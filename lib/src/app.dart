//import library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

//create class that will  be our custom widget
//This class must extend the 'StatelessWidget' base class
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = new ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('Click and Generate Image'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              fetchImage();
            });
          },
        ),
      ),
    );
  }
}
//must define 'build' method that returns
//the widgets
