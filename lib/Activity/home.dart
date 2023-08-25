import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController search = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {

    Map info= ModalRoute.of(context)!.settings.arguments as Map;
    String temp = ((info["t"]).toString()).substring(0,4);
    String icon_value = info["i"].toString();
    String city = info["city_value"].toString();
    String humid = info["h"].toString();
    String air_speed = (info["a"].toString()).substring(0,3);
    String desc = info["d"].toString();

    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.yellow,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  // color: Colors.black12,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24 ,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                        GestureDetector(
                          onTap: (){
                            if((search.text).replaceAll(" ", "") == ""){}
                            else {
                              Navigator.pushReplacementNamed(
                                  context, "/loading", arguments: {
                                "searchText": search.text
                              });
                            }
                          },
                          child :  Container(child: Icon(Icons.search,color: Colors.blueAccent,),margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                        ),
                      Expanded(
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search any City name",

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlueAccent,
                        ),
                        height: 80,
                        // color: Colors.lightBlueAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Image.network("https://openweathermap.org/img/wn/$icon_value@2x.png",)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text("$desc",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("In $city" ,style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlueAccent,
                        ),
                        height: 200,
                        // color: Colors.lightBlueAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.ac_unit),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style: TextStyle(
                                fontSize: 100,
                                ),),
                                Text("C",style: TextStyle(
                                  fontSize: 20,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlueAccent,
                        ),
                        height: 200,
                        // color: Colors.lightBlueAccent,
                        child: Column(
                          children: [
                            Icon(Icons.speed),
                            SizedBox(height: 30,),
                            Text("$air_speed", style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Km/h",style : TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 15,),
                            Text("Wind speed",style : TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlueAccent,
                        ),
                        height: 200,
                        // color: Colors.lightBlueAccent,
                        child: Column(
                          children: [
                            Icon(Icons.water_drop),
                            SizedBox(height: 30,),
                            Text("$humid", style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("Percent",style : TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 15,),
                            Text("Humidity",style : TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Made by Anish"),
                      SizedBox(height: 6,),
                      Text("Data by OpenWeatherap.org"),
                      SizedBox(height: 110,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
