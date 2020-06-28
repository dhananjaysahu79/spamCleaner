import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_manager/flutter_package_manager.dart';
import 'package:fthedragon/pages/popupmenu.dart';
import 'package:fthedragon/utils/name.dart';


class CleanerPage extends StatefulWidget {
  @override
  _CleanerPageState createState() => _CleanerPageState();
}

class _CleanerPageState extends State<CleanerPage> {
  static const platform = const MethodChannel("com.flutter.epic/epic");

  @override
  var gif ="https://i.pinimg.com/originals/d6/16/d2/d616d2b4dc17e17cdc530dbfac8fda2e.gif";
  @override
  void initState() {
    super.initState();
  }

    Future getPackages() async{
      List<AppDatas> data =[];
      List packages = await FlutterPackageManager.getInstalledPackages();
      List spampackages=[];
      for(var u in packages){
        if (spamlist.contains(u)){
          spampackages.add(u);
        }
      }
       for (var u in spampackages){
         var info= await FlutterPackageManager.getPackageInfo(u);
         data.add(AppDatas(info.getAppIcon(fit: BoxFit.contain),info.appName,u));
       }
      if (data.length == 0){
        return "Not Found";
      }else{
        return data;
      }
    }
     Future packs(var name)async{
      List packages = await FlutterPackageManager.getInstalledPackages();
      if (packages.contains(name)){
        packs(name);
      }
      else{
        setState(() {

        });
      }
    }

   Future appUninstall(var name,var i) async{
     await platform.invokeMethod("appUninstall",name.toString()).then((value) => update(name));
   }


    Future update(var value)async {
    Future.delayed(const Duration(seconds: 2),(){
     packs(value);
   });
  }

  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    return  AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark),
    child:
     Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
           height: height/2.6,
           width: double.infinity,
           alignment: Alignment.center,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
               Stack(
                 alignment: Alignment.center,
                 children: <Widget>[
                   Container(
                     height: 250,
                     width: 250,
                     decoration: BoxDecoration(
                       //shape: BoxShape.circle,
                       image: DecorationImage(
                         image:AssetImage("Assets/Images/guard.gif"),
                         fit: BoxFit.cover
                         )
                     ),
                   ),
                   Container(
                     alignment: Alignment.topRight,
                     height: height/4,
                     width: double.infinity,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(right:8.0),
                           child: IconButton(icon: Icon(Icons.more_vert),color: Colors.black, onPressed: (){
                            setState(() {
                              popupActive=!popupActive;
                            });
                           }),
                         )
                       ],
                     ),
                   ),
                 popupActive ? PopupMenu() : Container(),
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
                FutureBuilder(
                  future: getPackages(),
                  builder: (context,snapshot){
                    return snapshot.data==null?Center(child: CircularProgressIndicator()):snapshot.data=="Not Found"?Center(
                      child: Container(
                        width: double.infinity,
                        color: Colors.cyan.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Congratulations !\nNo Spam App Found :)",textScaleFactor: 0.8,textAlign: TextAlign.center,style: TextStyle(
                              fontSize: 20
                            ),
                            ),
                        ),
                      ),
                    ):ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,i){
                       return  Padding(
                         padding: const EdgeInsets.all(8),
                         child: Container(
                           width: width/1.1,
                           height: 70,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color: Colors.cyan.withOpacity(0.1),
                           ),
                           child: Row(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   width: 50,
                                   height: 50,
                                   child: snapshot.data[i].appImage,
                                 ),
                               ),
                               SizedBox(width: 5,),
                               Expanded(child: Text( snapshot.data[i].appName,textScaleFactor: 0.8,style: TextStyle(fontSize: 18))),
                               Container(
                                  width: width/3.4,
                                  height: 40,
                                  child: RaisedButton(
                                    elevation: 6,
                                    color: Color(0xFF6C63FF),
                                    child:  Text("Uninstall",
                                        textScaleFactor: 0.8,
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                                      ),
                                    onPressed:(){
                                    appUninstall(snapshot.data[i].packagename,i);
                                    }
                                    ),
                                ),
                                SizedBox(width: 5,),
                             ],
                           ),
                         ),
                       );
                      }
                    );
                  }
                  ),
              ],
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


