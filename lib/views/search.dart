import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screen_deck/data/data.dart';
import 'package:screen_deck/model/wallpapaermodel.dart';
import 'package:screen_deck/widget/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String? SearchQuery;
  // ignore: non_constant_identifier_names
  const Search({ Key? key, this.SearchQuery }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = new TextEditingController();

  List<WallpaperModel> wallpapers = [];

  getSearch(query) async {
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=20"), headers: {
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
  void initState(){
    getSearch(widget.SearchQuery);
    super.initState();
    searchController.text = widget.SearchQuery!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                  wallpaperList(wallpapers,context),
                  SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}