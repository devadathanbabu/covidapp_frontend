import 'dart:convert';
import 'package:http/http.dart' as http;
class PatientApiService{
  Future<dynamic> sendData(
    String name,
    String mobileNo,
    String address,
    String symptoms,
    String status) async{
    var client=http.Client();
    var ApiUrl=Uri.parse("http://192.168.1.4:3001/api/patientEntry/patiententry");
    var response=await client.post(ApiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
            "name":name,
            "mobileNo":mobileNo,
            "address":address,
            "symptoms":symptoms,
            "status":status
          }
          )
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to send data");
    }



  }

}