// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

List<Patient> patientFromJson(String str) => List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  String id;
  String name;
  String mobileNo;
  String address;
  String symptoms;
  String status;
  int v;

  Patient({
    required this.id,
    required this.name,
    required this.mobileNo,
    required this.address,
    required this.symptoms,
    required this.status,
    required this.v,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["_id"],
    name: json["name"],
    mobileNo: json["mobileNo"],
    address: json["address"],
    symptoms: json["symptoms"],
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobileNo": mobileNo,
    "address": address,
    "symptoms": symptoms,
    "status": status,
    "__v": v,
  };
}
