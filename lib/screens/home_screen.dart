import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apism/network/api_model.dart';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<GetApiModel>> getApiList;
  @override
  void initState() {
    super.initState();
     getApiList = fetchData();
  }

  Future<List<GetApiModel>> fetchData() async {

      final response = await http.get(Uri.parse("https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8"));
      var responseData = json.decode(response.body);
      List<GetApiModel> getApiNewList = [];
      
      for (var singleApiData in responseData) {
        GetApiModel getApi = GetApiModel(
            name: singleApiData["name"],
            city: singleApiData["city"]);

        getApiNewList.add(getApi);
      }
      return getApiNewList;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomeScreen',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body:FutureBuilder(
        future : fetchData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: 4,
                itemBuilder: (context,index){
                  if(snapshot.data == null) return CircularProgressIndicator();
                  else return ListTile(
                    title:  Text(snapshot.data![index].name.toString()),
                    subtitle: Text(snapshot.data![index].city.toString()),
                  );
                });
          }
          else return CircularProgressIndicator();
        },
      ),
    );
  }
}