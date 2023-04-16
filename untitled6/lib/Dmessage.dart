
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:untitled6/Bar.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:http/http.dart' as http ;
import 'package:untitled6/Transfer.dart';
import 'Search.dart';


class dmessage extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  dmessage(
      {
        required this.Email,
        required this.Password,
        required this.username,
        required this.mobile,
        required this.Gender,
        required this.dob,
        required this.id,
        required this.Adress,
        required this.nationalid,
      }
      );

  @override
  State<dmessage> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

TextEditingController name=TextEditingController();
TextEditingController subject=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController message=TextEditingController();
TextEditingController accountnumberr=TextEditingController();
TextEditingController uname=TextEditingController();
TextEditingController Email=TextEditingController();

Future sendemail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId="service_eb06r1i";
  const templateId="template_95ua9jl";
  final response = await http.post(url,
  headers: {'Content-Type':'application/json'},
    body: json.encode({
      "service_id":serviceId,
      "template_id":templateId,
      "template_params":{
        "name":uname.text,
        "subject":subject.text,
        "message":dropdown,
        "user_email":email.text
      }
    })
  );
  return response.statusCode;
}

var emaill;
var mobile;
var username;
var data;
var emailadd;

Future getUserData(String accnum) async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/Searchdesktop.php');
  var response = await http.post(url, body: {
    "accountnumber": accnum,
  });

  // print(json.decode(response.body));
  var data1 = await json.decode(response.body);
  print(data1);
  data = data1;
  return data1;
  // return json.decode(response.body);
}
Future<void> getData(String accnum) async {
  username = data[0]["name"];
  emailadd = data[0]["email"];
  mobilenum = data[0]["mobilenumber"];
  accountnum1 = data[0]["accountnumber"];
}


class _MyAppState extends State<dmessage> {

  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  _MyAppState(
      {
        required this.Email,
        required this.Password,
        required this.username,
        required this.mobile,
        required this.Gender,
        required this.dob,
        required this.id,
        required this.Adress,
        required this.nationalid,
      }
      );
  bool isChecked = false;
  String dropdown ='There was a deposit made into your bank account Login securely to view your latest bank transactions.';
  var items = ['There was a deposit made into your bank account Login securely to view your latest bank transactions.',
    'You have regular direct debit deposits scheduled to occur this week.Check your balance online to ensure you have sufficient funds.',
    'There was a new transaction made on your card Please login securely online to view your account activity. ',
  ];

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Color(0xff8d0000);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70,
                  flexibleSpace:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                        child:
                        Row(
                            children: [
                              Image(image: AssetImage("images/logo3.jpeg"),height:150 ,),
                              SizedBox(
                                  width: 1300
                              ),
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Search(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid) ,));
                              },
                                  icon: Icon(Icons.person_search_rounded,color: Colors.white,size: 30,)),
                              SizedBox(
                                width: 10,
                              ),
                            ]
                        )
                    ),
                  ),
                  backgroundColor: Color(0xff8d0000),
                ),
                body: Center(
                    child: ListView(children: [
                      TabBar(
                        unselectedLabelColor: Color(0xff8d0000),
                        indicator: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 5.0,
                                color: Color(0xff8d0000),
                              ),
                            )),
                        labelColor: Color(0xff8d0000),
                        labelPadding: EdgeInsets.only(right: 0, left: 0),
                        tabs: [
                          PlutoMenuBarDemo(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: Column(children: [
                            Center(
                              child: Text(" Deposit messages ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  child: Text(
                                    " Account Number : ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: TextField(
                                      controller: accountnumberr,
                                      cursorColor: Colors.black,
                                      onSubmitted: (value) {
                                        getUserData(accountnumberr.text);
                                        getData(accountnumberr.text);
                                        setState(() {
                                          uname.text=username;
                                          moobb.text=mobile;
                                          email.text=emailadd;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1)),
                                        focusColor: Colors.black,
                                        labelStyle: TextStyle(color: Colors.black),
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    " Username : ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  child: SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: TextField(
                                      controller: uname,
                                      cursorColor: Colors.black,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1)),
                                        focusColor: Colors.black,
                                        labelStyle: TextStyle(color: Colors.black),
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    " Email address : ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  child: SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: TextField(
                                      controller: email,
                                      cursorColor: Colors.black,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1)),
                                        focusColor: Colors.black,
                                        labelStyle: TextStyle(color: Colors.black),
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    child: Container(
                                      child:
                                      DropdownButton(
                                        value: dropdown,
                                        borderRadius: BorderRadius.circular(15),
                                        icon: const Icon(Icons.arrow_drop_down_sharp),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            dropdown = newvalue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Container(
                                        child: Text(
                                            " Send message to All ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                        MaterialStateProperty.resolveWith(getColor),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      )
                                    ],mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 40),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        sendemail();
                                      },
                                      child: Text('Send',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                width: 1,
                                                color: Colors.black)),
                                        primary: Colors.white70,
                                      ),
                                    ),
                                  )
                                ])
                          ]))
                    ])))));
  }
}

