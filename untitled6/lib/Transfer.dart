import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/signature.dart';
import 'Search.dart';

class transfers extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  transfers({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  @override
  State<transfers> createState() => _transfersState(
      Email: Email,
      Password: Password,
      username: username,
      mobile: mobile,
      Gender: Gender,
      dob: dob,
      id: id,
      Adress: Adress,
      nationalid: nationalid);
}

TextEditingController accnum = new TextEditingController();
TextEditingController accnum2 = new TextEditingController();
TextEditingController amount = new TextEditingController();
TextEditingController password1 = new TextEditingController();
TextEditingController cfn11 = new TextEditingController();
TextEditingController balance11 = new TextEditingController();
TextEditingController nationalid1 = new TextEditingController();
TextEditingController accnumto = new TextEditingController();
TextEditingController cfn2 = new TextEditingController();
TextEditingController moobb = new TextEditingController();

String dropdown3 = 'EGP';
var items3 = ['EGP', 'USD', 'SAR', 'KWD'];

String bank = 'FNB';
var bank3 = ['FNB', 'Ahly', 'Cib', 'HSBC'];

String branch = 'fifth settlement';
var items4 = ['fifth settlement', 'Nasr city', 'October', 'Maadi'];

String bookdate = '';
DateTime date1 = DateTime.now();

Future<Null> selectinDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: date1,
    firstDate: DateTime(1960),
    lastDate: DateTime(2040),
  );
  if (picked != null && picked != date1) {
    date1 = picked;
    print(date1.toString());
  }
}

TimeOfDay time1 = TimeOfDay.now();

Future<Null> selectTime(BuildContext context) async {
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial;
  final TimeOfDay? tpicked = await showTimePicker(
    context: context,
    initialTime: time1,
    initialEntryMode: initialEntryMode,
  );

  time1 = tpicked!;
  print(time1.toString());
}

var h;

Future SendData2(var date, var time) async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/transactions.php');

  final response = await http.post(url, body: {
    "accountnumber": accnum.text,
    "tooo": accnum2.text,
    "type": 'Bank transfer',
    "amount": amount.text,
    "date1": date,
    "time1": time,
    "rbalance": h.toString(),
  });
  try {
    var data = json.decode(response.body);
    print(data);
    if (data == "Error") {
    } else if (data == "Success") {
    } else {
      print("error");
    }
  } catch (e) {
    print(e);
  }
}

class _transfersState extends State<transfers> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _transfersState({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  Future Updatedata(var accnum1, var c) async {
    var url =
        Uri.parse('https://inconspicuous-pairs.000webhostapp.com/Deposit.php');
    print(accnum1.toString());
    print(c.toString());
    final response = await http.post(url, body: {
      "accnum": accnum1,
      "balance": c.toString(),
    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
        print("mansour");
      } else if (data == "Success") {
        print("bebo");
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  var accountnum1;
  var data;
  var balance1;
  var money;
  var password;
  var name;
  var id1;
  var balance;
  var mob;

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
    accountnum1 = data[0]["accountnumber"];
    balance1 = data[0]["balance"];
    money = data[0]["money"];
    password = data[0]["password"];
    balance = data[0]["balance"];
    name = data[0]["name"];
    id1 = data[0]["nationalid"];
    mob = data[0]["mobilenumber"];
    print("balance $balance1");
  }

  bool isChecked = false;

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

    var date = "${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time = "${time1.hour} - ${time1.minute}".toString();
    print(date);
    print(time);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                        child: Row(children: [
                      Image(
                        image: AssetImage("images/logo3.jpeg"),
                        height: 150,
                      ),
                      SizedBox(width: 1300),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Search(
                                      Email: Email,
                                      Password: Password,
                                      username: username,
                                      mobile: mobile,
                                      Gender: Gender,
                                      dob: dob,
                                      id: id,
                                      Adress: Adress,
                                      nationalid: nationalid),
                                ));
                          },
                          icon: Icon(
                            Icons.person_search_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                    ])),
                  ),
                  backgroundColor: Color(0xff8d0000),
                ),
                body: ListView(
                  children: [
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
                        PlutoMenuBarDemo(
                            Email: Email,
                            Password: Password,
                            username: username,
                            mobile: mobile,
                            Gender: Gender,
                            dob: dob,
                            id: id,
                            Adress: Adress,
                            nationalid: nationalid),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(" Transfer Money ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 0,
                        ),
                        Column(children: [
                          Padding(padding: EdgeInsets.only(left: 0, top: 20)),
                          Container(
                              child: Column(children: [
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  child: Text(" Account Number :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    controller: accnum,
                                    cursorColor: Colors.black,
                                    onSubmitted: (value) async {
                                      await getUserData(accnum.text);
                                      await getData(accnum.text);
                                      cfn11.text = name;
                                      balance11.text = balance1;
                                      nationalid1.text = id1;
                                    },
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            // Second Row
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" Customer Name :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    readOnly: true,
                                    controller: cfn11,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" National id :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    readOnly: true,
                                    controller: nationalid1,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" Balance :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    readOnly: true,
                                    controller: balance11,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            // third row
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  child:
                                      Text(" Amount ( you want to transfer ): ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    controller: amount,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                DropdownButton(
                                  value: dropdown3,
                                  dropdownColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  borderRadius: BorderRadius.circular(15),
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  items: items3.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      dropdown3 = newvalue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" Branch : ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                DropdownButton(
                                  value: branch,
                                  dropdownColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  borderRadius: BorderRadius.circular(15),
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  items: items4.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      branch = newvalue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ]))
                        ]),
                        Row(children: [
                          Padding(padding: EdgeInsets.only(left: 50)),
                          Container(
                              child: Column(children: [
                            Row(children: <Widget>[
                              Container(
                                child: Text(" To bank :",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DropdownButton(
                                value: bank,
                                dropdownColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                borderRadius: BorderRadius.circular(15),
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                items: bank3.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    bank = newvalue!;
                                  });
                                },
                              ),
                            ]),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" To Account Number : ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    controller: accnum2,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    onSubmitted: (value) {
                                      getUserData(accnum2.text);
                                      getData(accnum2.text);
                                      setState(() {
                                        cfn2.text = name;
                                        moobb.text = mob;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Second Row
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" To Customer Name :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    controller: cfn2,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(" Mobile number : ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  child: TextField(
                                    controller: moobb,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),

                            // third row
                          ]))
                        ]),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          child: Text(" Signature : ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signaturee(
                                        Email: Email,
                                        Password: Password,
                                        username: username,
                                        mobile: mobile,
                                        Gender: Gender,
                                        dob: dob,
                                        id: id,
                                        Adress: Adress,
                                        nationalid: nationalid),
                                  ));
                            },
                            icon: Icon(Icons.paste_outlined),iconSize: 30,)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          child: Text(
                              " Are you sure you want to transfer money to account number : ",
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
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Center(
                            child: Column(children: <Widget>[
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (amount.text == "" || accnum2.text == "") {
                                  showAlertDialog(
                                      context, " Please Enter values ");
                                } else {
                                  if (int.parse(amount.text) >
                                      int.parse(balance1)) {
                                    showAlertDialog(context,
                                        " Your account balance is'nt enough");
                                  } else {
                                    h = int.parse(balance1) -
                                        int.parse(amount.text);
                                    print("h1 $h");
                                    await Updatedata(accnum.text, h);

                                    // accnum 2

                                    await getUserData(accnum2.text);
                                    await getData(accnum2.text);

                                    var h2 = int.parse(balance1) +
                                        int.parse(amount.text);
                                    print("h2 $h2");

                                    await Updatedata(accnum2.text, h2);

                                    SendData2(date, time);

                                    setState(() {
                                      amount.text = "";
                                      accnum.text = "";
                                      accnum2.text = "";
                                      password1.text = "";
                                      cfn11.text = "";
                                      balance11.text = "";
                                      nationalid1.text = "";
                                      cfn2.text = "";
                                      moobb.text = "";
                                      showAlertDialog(context,
                                          "Money has been transfer sucessfuly");
                                    });
                                  }
                                }
                              },
                              child: Text('Transfer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                        style: BorderStyle.solid,
                                        width: 1,
                                        color: Colors.black)),
                                primary: Color(0xff8d0000),
                              ),
                            ),
                          )
                        ]))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ],
                ))));
  }
}

void showAlertDialog(BuildContext context, var text) {
  var alertDialog = AlertDialog(
    content: Text(
      text,
      style: TextStyle(color: Color(0xff8d0000), fontSize: 30),
    ),
    actions: [
      ElevatedButton(
          onPressed: () {},
          child: Text(
            'Ok',
          ),
          style: ButtonStyle(
            iconSize: MaterialStatePropertyAll(20),
            backgroundColor: MaterialStatePropertyAll(Color(0xff8d0000)),
          )),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
