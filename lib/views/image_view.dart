import 'dart:io' show Platform;
import 'dart:typed_data';
// ignore: import_of_legacy_library_into_null_safe
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageView extends StatefulWidget {
  final String? imgurl;
  const ImageView({ Key? key, this.imgurl }) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(widget.imgurl!, fit: BoxFit.cover)),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    _save();
                  },
                  child: Stack(
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                        ),
                        height: 73,
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Container(
                      height: 73,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [
                            Color(0x36FFFFFF),
                            Color(0x0FFFFFFF)
                          ]
                        )
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Download", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),
                              Icon(Icons.download, color: Colors.white)
                            ],
                          ),
                          Text("Image will be saved in gallery", style: TextStyle(fontSize: 17,color: Colors.white))
                        ],
                      ) ,
                    ),
                  ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),)),
                SizedBox(height: 50,)
              ],
            ),
          )
      ],),
    );
  }

  _save() async {
    if(Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio().get(
      widget.imgurl!,
      options: Options(responseType: ResponseType.bytes)
    );
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    //Navigator.pop(context);
  }

  _askPermission() async {
    /*if(Platform.isIOS) {
      Map<PermissionGroup, PermissionStatus> permissions = 
      await [Permission.photos].request();
    } else {*/
      PermissionStatus permission = await Permission.storage.status;
    }
}