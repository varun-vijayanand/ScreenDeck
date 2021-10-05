import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screen_deck/data/data.dart';
import 'package:screen_deck/model/wallpapaermodel.dart';
import 'package:screen_deck/widget/widget.dart';

class CategoryState extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String? CategoryName;
  // ignore: non_constant_identifier_names
  const CategoryState({ Key? key, this.CategoryName }) : super(key: key);

  @override
  _CategoryStateState createState() => _CategoryStateState();
}

class _CategoryStateState extends State<CategoryState> {

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
    getSearch(widget.CategoryName);
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              wallpaperList(wallpapers,context),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
      
    );
  }
}