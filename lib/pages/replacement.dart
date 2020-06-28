import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Replacement extends StatelessWidget {
  const Replacement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark),
    child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text("Replacements",textScaleFactor: 0.8,style: TextStyle(color:Colors.black),),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:7),
            Container(
              width:MediaQuery.of(context).size.width/1.04,
              //height: 40,
              decoration: BoxDecoration(
                  color:Colors.white,
                  border: Border.all(style: BorderStyle.solid,width: 2),
                  borderRadius:BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Text("Spam Apps",textScaleFactor: 0.8,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
                   Text("Replacements",textScaleFactor: 0.8,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
                 ]
              ),
            ),
            Expanded(
              child:ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context,i){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width:MediaQuery.of(context).size.width/1.2,
                        height:MediaQuery.of(context).size.height/3,
                        decoration:BoxDecoration(
                          border: Border.all(style: BorderStyle.solid,width: 2),
                          borderRadius:BorderRadius.circular(5),
                          image:DecorationImage(
                            fit:BoxFit.fitWidth,
                            image:AssetImage("Assets/Images/p${i+1}.jpg")
                          )
                        )
                      ),
                    );
                  }
              )
            )
          ],
        ),
     )
    );
  }
}