

import 'package:flutter/material.dart';
import 'package:untitled/Activity/home.dart';
import 'package:untitled/Activity/location.dart';
import 'package:untitled/Activity/loading.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Loading(),
        "/home" : (context) => Home(),
        "/loading" : (context) => Loading(),
      }
  ));
}
