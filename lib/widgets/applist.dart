import 'package:flutter/material.dart';
import 'package:flutter_package_manager/flutter_package_manager.dart';
import 'package:fthedragon/utils/name.dart';
import 'package:flutter/services.dart';

class AppList extends StatefulWidget {
  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
   static const platform = const MethodChannel("com.flutter.epic/epic");
  @override
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
     var width= MediaQuery.of(context).size.width;

    return FutureBuilder(
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
  );
  }
}

class AppDatas {
  Image appImage;
  var appName;
  var packagename;
  AppDatas(this.appImage,this.appName,this.packagename);
}