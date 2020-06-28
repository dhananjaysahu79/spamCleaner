import 'package:flutter/material.dart';
import 'package:fthedragon/pages/about.dart';
import 'package:fthedragon/pages/replacement.dart';
import 'package:fthedragon/utils/name.dart';


class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
         alignment: Alignment.topRight,
         child: Padding(
           padding: const EdgeInsets.all(3.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
               InkWell(
                  onTap: (){  Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                  builder:(BuildContext context){
                  return Replacement();
                  }));
                  },
                 child: Container(
                 height: 35,
                 width: width/4,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   color:Color(0xFF343434),
                   borderRadius: BorderRadius.circular(5)
                 ),
                 child: Text("Replacements",textScaleFactor: 0.8,style: TextStyle(color:Colors.white,fontSize: 13),),
             ),
               ),
             SizedBox(height: 5,),
             InkWell(
                onTap: ()=>  Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                  builder:(BuildContext context){
                  return About();
                  })),
                child: Container(
                 height: 33,
                 width: width/5.5,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   color:Color(0xFF343434),
                   borderRadius: BorderRadius.circular(5)
                 ),
                 child: Text("About",textScaleFactor: 0.8,style: TextStyle(color:Colors.white,fontSize: 13),),
               ),
             ),
             ],
           ),
         ),
    );
  }
}