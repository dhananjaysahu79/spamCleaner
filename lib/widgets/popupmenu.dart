import 'package:flutter/material.dart';
import 'package:fthedragon/pages/about.dart';
import 'package:fthedragon/pages/replacement.dart';
import 'package:fthedragon/utils/name.dart';


class PopupMenu extends StatefulWidget {
  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right:3.0,top: 28),
      child: Container(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: IconButton(icon: Icon(Icons.more_vert),color: Colors.black, onPressed: (){
                setState(() {
                  popupActive=!popupActive;
                });
                }),
              ),
             popupActive? InkWell(
                onTap: (){  Navigator.of(context).push(
                MaterialPageRoute<Null>(
                builder:(BuildContext context){
                return Replacement();
                }));
                setState(() {
                  popupActive=false;
                });
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
                ),):Container(),

                SizedBox(height: 5,),

              popupActive? InkWell(
              onTap: (){  Navigator.of(context).push(
                MaterialPageRoute<Null>(
                builder:(BuildContext context){
                return About();
                }));
                 setState(() {
                  popupActive=false;
                });
                },
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
                ):Container(),
          ],
        ),
      ),
    );

  }
}