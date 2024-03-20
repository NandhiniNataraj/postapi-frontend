import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class emplo extends StatefulWidget {
  const emplo({super.key});

  @override
  State<emplo> createState() => _emploState();
}

class _emploState extends State<emplo> {
  TextEditingController Cname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confrim = TextEditingController();

  Future<bool>? _success;
  Future<bool> addcat(String Cname, int phone, String user,String pass, String confrim) async {
    var result = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
        headers: <String, String>{
          'Content-Type':'application/json; charset=utf-8',
        },
        body: jsonEncode(<String, dynamic>{
          "employeeId": 0,
          "employeeName": Cname,
          "mobile":phone ,
          "userName":user,
          "password":pass ,
          "confirmPassword":confrim,
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
              label: Text("Employeename"),
            ),
          ),
          TextFormField(
            controller:phone ,
            decoration: InputDecoration(
              label: Text("PhoneNumber"),
            ),
          ),
          TextFormField(
            controller: user,
            decoration: InputDecoration(
              label: Text("Username"),
            ),
          ),
          TextFormField(
            controller:pass ,
            decoration: InputDecoration(
              label: Text("Password"),
            ),
          ),
          TextFormField(
            controller:confrim ,
            decoration: InputDecoration(
              label: Text("Confrim Password"),
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              _success = addcat(Cname.text,
                int.parse(phone.text),
                user.text,
                pass.text,
                confrim.text,
              );
            });
          }, child: Text("save"))
        ],
      ),
    );
  }
}
