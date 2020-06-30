import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fthedragon/widgets/popupmenu.dart';
import 'package:fthedragon/widgets/applist.dart';


class CleanerPage extends StatefulWidget {
  @override
  _CleanerPageState createState() => _CleanerPageState();
}

class _CleanerPageState extends State<CleanerPage> {

  @override
  var gif ="https://i.pinimg.com/originals/d6/16/d2/d616d2b4dc17e17cdc530dbfac8fda2e.gif";

  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness:Brightness.dark),
    child:
     Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
            Container(
             width: double.infinity,
             alignment: Alignment.center,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Stack(
                   alignment: Alignment.topCenter,
                   children: <Widget>[
                     Container(
                       height: 250,
                       width: 250,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image:AssetImage("Assets/Images/guard.gif"),
                           fit: BoxFit.fitHeight
                           )
                       ),
                     ),
                     PopupMenu()
                   ],
                 ),
                 Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:Colors.cyan.withOpacity(0.4)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("MANAGE SPACE",textScaleFactor: 0.8,style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 17
                     ),),
                   ),
                 )
               ],
             ),
            ),

          Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("**We Encourage you to check out the App Replacements before deleting any app.Click on the three dots icon for App replacements.",
                    textAlign: TextAlign.center,
                    textScaleFactor: 0.8,
                    style: TextStyle(fontSize: 13),
                    ),
                  ),
                    ),
                 AppList()
                ],
              ),
            )
          )
        ],
      ),
     )
    );
  }
}

class AppDatas {
  Image appImage;
  var appName;
  var packagename;
  AppDatas(this.appImage,this.appName,this.packagename);
}


