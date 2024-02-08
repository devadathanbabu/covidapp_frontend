import 'package:covidapp/pages/add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVIDAPP",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.indigo.withOpacity(0.9),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20,),
          Container(
             height: 390,
             width: 390,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.indigo.withOpacity(0.6),
           ),

            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(height: 10,),
                    Icon(Icons.keyboard_alt_outlined,size: 40,),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>AddPage()));
                        }, child: Text("Patient Entry",
                      style: TextStyle(fontSize: 20,
                      color: Colors.black87),
                    ))
                  ],
                ),
                 SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 17,),
                    Icon(CupertinoIcons.eye_fill,size: 40,),
                    TextButton(onPressed: (){},
                        child: Text("Patient Details",
                        style: TextStyle(fontSize: 20,
                        color: Colors.black87),))
                  ],
                )

              ],
            ),
          ),
        ],
      )
    );
  }
}
