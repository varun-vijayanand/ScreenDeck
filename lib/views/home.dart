import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_deck/data/data.dart';
import 'package:screen_deck/model/categoriesmodel.dart';
import 'package:screen_deck/model/wallpapaermodel.dart';
import 'package:screen_deck/views/category.dart';
import 'package:screen_deck/views/image_view.dart';
import 'package:screen_deck/views/search.dart';
import 'package:screen_deck/widget/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  getTrending() async {
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization": apiKey,
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpapermodel = new WallpaperModel();
      wallpapermodel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpapermodel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getTrending();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppName(),
        elevation: 0.0,
      ),
      body:SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  height: 47,
                  decoration: BoxDecoration(
                   color: Colors.grey.shade200,
                   borderRadius: BorderRadius.circular(100)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )
                            ),
                          ),
                        ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(
                          SearchQuery: searchController.text ,
                        ))
                        );
                      },
                      child: Container(
                        child: Icon(Icons.search)),
                    ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 16,),
      
                Container(
                  height: 70,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                      return CategoryTile(url: categories[index].imageUrl, title: categories[index].categoriesname);
                    }),
                ),

                SizedBox(height: 16,),
      
                wallpaperList(wallpapers,context),

                SizedBox(height: 16,),

              ],
            ),
          ),
      ),
      );
  }
}

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  CategoryTile({required this.url,required this.title, Key? key }) : super(key: key);

  String? url, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryState(
          CategoryName: title?.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 13),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(url!, height: 80, width: 130, fit: BoxFit.cover,)),
    
            Container(
              height: 80, width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Text(title!, style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

