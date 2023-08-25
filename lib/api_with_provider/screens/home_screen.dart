import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:apism/api_with_provider/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenProvider? homeScreenProvider;
  bool isList = true;

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
            'Api HomeScreen',
            style: TextStyle(color: AppColors.appMainColor),
          ),
          centerTitle: true,
          
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isList? isList = false:isList = true;
              });
            }, 
            icon:  isList? const Icon(Icons.grid_3x3,color: AppColors.appMainColor,):const Icon(Icons.list,color: AppColors.appMainColor,))
        ],
        ),
        body: homeScreenProvider!.isLoading
        ?const Center(child: CircularProgressIndicator(
          color: AppColors.appMainColor,
        ))
        :isList
        ?ListView.builder(
            itemCount: homeScreenProvider!.apiList.length,
            itemBuilder: ((context, index) => Container(
              padding:const EdgeInsets.symmetric(horizontal: 7),
              margin: const EdgeInsets.symmetric(horizontal:12,vertical:8),
              decoration: const BoxDecoration(
                color: AppColors.appMainColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
              
              child: ListTile(
                
                // tileColor: AppColors.appMainColor,
                    title: Text(homeScreenProvider!.apiList[index].name.toString(),style: const TextStyle(color: Colors.white),),
                    subtitle: Text(homeScreenProvider!.apiList[index].city.toString(),style: const TextStyle(color: Colors.white)),
                  ),
            ))):
          GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
            itemCount: homeScreenProvider!.apiList.length,
            itemBuilder: ((context, index) => Container(
              padding:const EdgeInsets.symmetric(horizontal: 7),
              margin: const EdgeInsets.symmetric(horizontal:12,vertical:8),
              decoration: const BoxDecoration(
                color: AppColors.appMainColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
              
              child: ListTile(
                
                // tileColor: AppColors.appMainColor,
                    title: Text(homeScreenProvider!.apiList[index].name.toString(),style: const TextStyle(color: Colors.white),),
                    subtitle: Text(homeScreenProvider!.apiList[index].city.toString(),style: const TextStyle(color: Colors.white)),
                  ),
            ))),
      ),
    );
  }
}
