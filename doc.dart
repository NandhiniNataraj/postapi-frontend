import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class doc extends StatefulWidget {
  const doc({super.key});

  @override
  State<doc> createState() => _docState();
}

class _docState extends State<doc> {
  TextEditingController Cname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController add = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController web = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cont = TextEditingController();
  TextEditingController phn = TextEditingController();
  Future<bool>? _success;
  Future<bool> addcat(String Cname, String phone, String add,String gst, String web, String email,
      String cont, String phn ) async {
    var result = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Client/InsertClient"),
        headers: <String, String>{
          'Content-Type':'application/json; charset=utf-8',
        },
        body: jsonEncode(<String, dynamic>{
          "clientId": 0,
          "clientName": Cname,
          "phone": phone,
          "address": add,
          "gst": gst,
          "website": web,
          "email": email,
          "contactPerson": cont,
          "phoneNumber": phn ,
          "createdBy": 1
        })
    );
    return jsonDecode(result.body)["success"];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller:Cname ,
            decoration: InputDecoration(
              label: Text("Clintname"),
            ),
          ),
          TextFormField(
            controller:phone ,
            decoration: InputDecoration(
              label: Text("Phone"),
            ),
          ),
          TextFormField(
            controller: add,
            decoration: InputDecoration(
              label: Text("address"),
            ),
          ),
          TextFormField(
            controller:gst ,
            decoration: InputDecoration(
              label: Text("Gst"),
            ),
          ),
          TextFormField(
            controller:web ,
            decoration: InputDecoration(
              label: Text("website"),
            ),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              label: Text("Email"),
            ),
          ),
          TextFormField(
            controller:cont ,
            decoration: InputDecoration(
              label: Text("Conact"),
            ),
          ),
          TextFormField(
            controller: phn,
            decoration: InputDecoration(
              label: Text("Mobile"),
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              _success = addcat(Cname.text,
                phone.text,
                add.text,
                gst.text,
                web.text,
                email.text,
                cont.text,
                phn.text,);

            });
          }, child: Text("save"))
        ],
      ),
    );
  }
}
