import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apism/network/models/api_model.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier{
 List<GetApiModel> apiList = [];
  bool isLoading = true;
  // kggk

   Future<List<GetApiModel>> fetchData() async {

          final response = await http.get(Uri.parse("https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8"));
          var responseData = json.decode(response.body);
          List<GetApiModel> getApiNewList = [];
           apiList = [];
  
          
          for (var singleApiData in responseData) {
            GetApiModel getApi = GetApiModel(
                name: singleApiData["name"],
                city: singleApiData["city"]);

            getApiNewList.add(getApi);
            apiList.add(getApi);

          }
          isLoading = false;
          notifyListeners();
          return getApiNewList;

      }
}