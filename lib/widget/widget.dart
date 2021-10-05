import 'package:flutter/material.dart';
import 'package:screen_deck/model/wallpapaermodel.dart';
import 'package:screen_deck/views/image_view.dart';

// ignore: non_constant_identifier_names
Widget? AppName() {
  return RichText(
  text: TextSpan(
    style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    children: const <TextSpan>[
      TextSpan(text: 'Screen', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: 'Deck', style: TextStyle(color: Colors.blue)),
    ],
  ),
);
}

Widget wallpaperList(List<WallpaperModel> wallpapers, context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children:
        wallpapers.map((wallpaper){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(
                imgurl: wallpaper.src!.potrait,
              )));
            },
            child: Hero(
              tag: wallpaper.src!,
              child: GridTile(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(wallpaper.src!.potrait!, fit: BoxFit.cover,)),
                )
              ),
            ),
          );
        }).toList(),
    ),
  );
}