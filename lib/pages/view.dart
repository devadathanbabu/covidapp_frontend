import 'package:covidapp/service/patientservice.dart';
import 'package:flutter/material.dart';

import '../model/patientmodel.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Patient>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PatientApiService().getData();
  }
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
        body: FutureBuilder(
            future: data, builder: (context,snapshot)
        {
          if(snapshot.hasData && snapshot.data!.isNotEmpty)
            {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (value,index){
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.withOpacity(0.5),
                            child: Text(snapshot.data![index].name[0].toString()),
                          ),
                          title: Text("Name : " +snapshot.data![index].name.toString()),
                          subtitle: Text("MobileNo : "+snapshot.data![index].mobileNo.toString()
                              +"\n"+ "Address : "+snapshot.data![index].address.toString()
                              +"\n"+ "Symptoms : " + snapshot.data![index].symptoms.toString()
                              +"\n"+ "Status : " + snapshot.data![index].status.toString()),
                        ),
                      ],
                    ),

                  );

              }
              );
            }
          else
            {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 460,),
                  CircularProgressIndicator(),
                ],

              );
            }
        }),
      ),
    );
  }
}
