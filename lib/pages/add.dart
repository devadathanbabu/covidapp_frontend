import 'package:covidapp/service/patientservice.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController txt1=new TextEditingController();
  TextEditingController txt2=new TextEditingController();
  TextEditingController txt3=new TextEditingController();
  TextEditingController txt4=new TextEditingController();
  TextEditingController txt5=new TextEditingController();

  void sendPatientData() async
  {

    final response = await PatientApiService().sendData(
        txt1.text,
        txt2.text,
        txt3.text,
        txt4.text,
        txt5.text);
    if(response["status"]=="success")
    {
      print("Successfully added");
    }
    else
    {
      print("Error");
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("COVIDAPP",style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.indigo.withOpacity(0.9),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  controller:txt1,
                  decoration: InputDecoration(
                      hintText: "Enter Patient Name",
                      labelText: "Patient Name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txt2,
                  decoration: InputDecoration(
                      hintText: "Enter MobileNo",
                      labelText: "MobileNo",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt3,
                  decoration: InputDecoration(
                      hintText: "Enter Address",
                      labelText: "Address",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt4,
                  decoration: InputDecoration(
                      hintText: "Enter Symptoms",
                      labelText: "Symptoms",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt5,
                  decoration: InputDecoration(
                      hintText: "Enter Status",
                      labelText: "Status",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          )
                      ),
                      onPressed: sendPatientData,
                      child: Text("ADD")),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
