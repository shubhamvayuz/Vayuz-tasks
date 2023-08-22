import 'package:apism/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenProvider? homeScreenProvider;

  @override
  void initState() {
    super.initState();
    homeScreenProvider = Provider.of<HomeScreenProvider>(context,listen: false);
    homeScreenProvider?.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    homeScreenProvider = context.watch();
    return ChangeNotifierProvider<HomeScreenProvider>(
      create: (context) => HomeScreenProvider(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'HomeScreen',
            style: TextStyle(color: Colors.green),
          ),
          centerTitle: true,
        ),
        body: homeScreenProvider!.isLoading
        ?const Center(child: CircularProgressIndicator())
        :ListView.builder(
            itemCount: homeScreenProvider!.apiList.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Text(homeScreenProvider!.apiList[index].name.toString()),
                  subtitle: Text(homeScreenProvider!.apiList[index].city.toString()),
                ))),
      ),
    );
  }
}
