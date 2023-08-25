
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var city = "Delhi";
  var humid;
  var temp;
  var speed;
  var desc;
  var icon_value ;

  void setData(String city) async {
    GetData obj1 = GetData(loc: city);
    await obj1.getData();
    humid = obj1.humidity;
    temp = obj1.temperature ;
    desc = obj1.description;
    speed = obj1.air_speed;
    icon_value = obj1.icon;
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, "/home" , arguments: {
        "h" : humid,
        "t" : temp,
        "d" : desc,
        "a" : speed,
        "i" : icon_value,
        "city_value" : city
      });
    } );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    setData(city);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              CircleAvatar(
                radius: 80,
                child: Image.asset("Assets/images/weather_icon.jpeg"),
              ),
              SizedBox(height: 10),
              Text("Mausam App " , style: TextStyle(
                fontSize: 25,
                  color: Colors.white,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 10),
              Text("Made by Anish" , style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ) ),
          SizedBox(height: 20,),
          SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          )
            ],
          ),
        ),
      ),
    );
  }
}
