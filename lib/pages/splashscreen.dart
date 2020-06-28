import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fthedragon/pages/cleanerpage.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var gif ="https://cdn.dribbble.com/users/1253928/screenshots/9782367/media/d93fc778039fe087a5a4f45a3e507c3a.gif";
  @override
  @override
  void initState() {
    super.initState();
    //changeScreen();
  }
  //  Future changeScreen() async {
  //  try{

  //  final res= await InternetAddress.lookup('google.com');
  //  if (res.isNotEmpty && res[0].rawAddress.isNotEmpty){
  //     await Future.delayed(const Duration(seconds: 2),(){
  //     Navigator.of(context).pushReplacement(
  //     MaterialPageRoute<Null>(
  //     builder:(BuildContext context){
  //     return Consumer<ThemeNotifier>(
  //       builder: (context,notifier,child)=>LandingPage(notifier.darktheme));
  //   }));
  //  });
  //  }

  //  } on SocketException catch(_){
  //     print("cant");
  //  }
  //  }
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark),
    child:Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //color: Colors.blue
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          height: 180,
                          width:180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:Colors.black
                          ),
                        ),
                        Container(
                     height: 165,
                     width: 165,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: AssetImage("Assets/Images/dragon.jpg")
                       )
                     ),
                      ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text("F The Dragon",textScaleFactor: 0.8,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("You know exactly what F means :)",textScaleFactor: 0.8,)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 40,
                    child: RaisedButton(
                      elevation: 6,
                      color: Color(0xFF6C63FF),
                      child:  Text("Scan Your Device",
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                      onPressed:(){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<Null>(
                      builder:(BuildContext context){
                      return CleanerPage();
                      }));
                      }
                      ),
                  )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    )
  );
  }
}