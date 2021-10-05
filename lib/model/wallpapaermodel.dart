// ignore: unused_import
import 'dart:convert';

class WallpaperModel{
  String? photographer;
  // ignore: non_constant_identifier_names
  String? photographer_url;
  // ignore: non_constant_identifier_names
  int? photographer_id;
  SrcModel? src;

  // ignore: non_constant_identifier_names
  WallpaperModel({this.src, this.photographer_url, this.photographer, this.photographer_id});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer_url: jsonData["photographer_url"],
      photographer: jsonData["photographer"],
      photographer_id: jsonData["photographer_id"],
    );
  }
}

class SrcModel{
  String? original;
  String? small;
  String? potrait;

  SrcModel({ this.original,  this.potrait, this.small});

  factory SrcModel.fromMap(Map<String?, dynamic> jsonData){
    return SrcModel(
      potrait: jsonData["portrait"],
      original: jsonData["original"],
      small: jsonData["small"],
    );
  }

}