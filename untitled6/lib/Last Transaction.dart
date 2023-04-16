import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled6/Get%20Card.dart';
import 'package:untitled6/transaction.dart';
import 'Bar.dart';
import 'Search.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class LastTransaction extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  LastTransaction({
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
  State<LastTransaction> createState() =>
      _MyAppState(
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

class _MyAppState extends State<LastTransaction> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _MyAppState({
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

  TextEditingController accnum111 = TextEditingController();

  var accountnum1;
  var transsid;
  var data;
  var typee;
  var too;
  var amountt;
  var date;
  var time;
  var re;

  Future getUserData(String accnum) async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/trans%20search.php');
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
    transsid = data[0]["transid"];
    accountnum1 = data[0]["accountnumber"];
    typee = data[0]["type"];
    too = data[0]["tooo"];
    amountt = data[0]["amount"];
    date = data[0]["date1"];
    time = data[0]["time1"];
    re=data[0]["rbalance"];
  }
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

  Future<List<dynamic>> fetchTransactions(accountnum1) async {
    final response = await http.get(Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/getTransaction.php?accountnumber=$accountnum1'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load transactions');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    var date2= "${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time2 = "${time1.hour} - ${time1.minute}".toString();
    print(date2);
    print(time2);

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
                                      builder: (context) =>
                                          Search(
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
                body: ListView(children: [
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
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(" Report ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(children: [
                        // Search BAR
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Column(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(400, 7, 400, 5),
                                  child: TextField(
                                    onSubmitted: (value) {
                                      setState(() {
                                        getUserData(accnum111.text);
                                        getData(accnum111.text);
                                      });
                                    },
                                    controller: accnum111,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: ' Search Bar ',
                                        hintText:
                                        " Enter Customer's Account Number"),
                                  ),
                                ),
                                Text(
                                    "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
                              ])),
                        ),
                      ]),
                      SizedBox(
                        height: 450,
                        child: FutureBuilder<List<dynamic>>(
                          future: fetchTransactions(accountnum1),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 350,
                                            right: 350,
                                            top: 20,
                                            bottom: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: Color(0xfffcc8c8)),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Color(0xfffcc8c8),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Transaction id: ${snapshot
                                                            .data?[index]['transid']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Account status: Active',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Account number: ${snapshot.data?[index]['accountnumber']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  To: ${snapshot.data?[index]['tooo']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Transfer type: ${snapshot.data?[index]['type']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Amount: ${snapshot.data?[index]['amount']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Remaing balance : ${snapshot
                                                            .data?[index]['rbalance']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Date: ${snapshot
                                                            .data?[index]['date1']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '  Time: ${snapshot
                                                            .data?[index]['time1']}',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return Container(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  strokeWidth: 4,
                                  color: Color(0xff8d0000),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Column(children: <Widget>[
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PdfPreview(build: (format) => _generatePdf(format,"Account statements"),
                                                ),
                                          ));
                                    },
                                    child: Text(
                                      'Print',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.fromLTRB(
                                          50, 20, 50, 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30),
                                          side: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 1,
                                              color: Colors.black)),
                                      primary: Color(0xff8d0000),
                                    ),
                                  ),
                                )
                              ])),
                          SizedBox(width: 40),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ministat(
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
                              child: Text('Last Tranasction',
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ]))));
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.abelRegular();
    final imageFile = File('images/logo4.jpg');
    final image = pw.MemoryImage(imageFile.readAsBytesSync());
    pdf.addPage(
        pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(children: [
            pw.Row(
              children: [
                pw.Column(
                  children: [
                    pw.Row(children: [pw.Text(" Future National Bank ",style: pw.TextStyle(fontSize: 10))]),
                    pw.Row(children: [pw.Text("       Employee name : $username ",style: pw.TextStyle(fontSize: 10))]),
                    pw.Row(children: [pw.Text("      Branch : Fifth Settlement ",style: pw.TextStyle(fontSize: 10))]),
                  ]
                ),
                pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 250
                      ),
                      pw.Image(image,height: 150,width: 150)]),
              ],
            ),
            pw.Center(
              child: pw.Text(title, style: pw.TextStyle(font: font, fontSize: 18)),
            ),
            pw.Flexible(
                child:pw.ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return pw.Column(
                      children: [
                        pw.Container(
                          child: pw.Container(
                             child: pw.Column(
                              children: <pw.Widget>[
                                pw.Row(
                                  children: [
                                    pw.Container(
                                      child: pw.Text(
                                          '  Transaction id: ${data?[index]['transid']} ',
                                          style: pw.TextStyle(
                                              fontSize: 6,
                                              )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  children: [
                                    pw.Container(
                                      child: pw.Text(
                                          '  Account number: ${data?[index]['accountnumber']} ',
                                          style: pw.TextStyle(
                                              fontSize: 6,
                                          )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                    children: [
                                      pw.Container(
                                      child: pw.Text(
                                          '  To: $too ',
                                          style: pw.TextStyle(
                                              fontSize: 6,
                                              )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                      pw.Container(
                                        child: pw.Text(
                                            '  Transfer type: ${data?[index]['type']} ',
                                            style: pw.TextStyle(
                                              fontSize: 6,
                                            )),
                                        padding: pw.EdgeInsets.only(
                                            left: 5),
                                      ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  children: [
                                    pw.Container(
                                      child: pw.Text(
                                          '  Amount: ${data?[index]['amount']} ',
                                          style: pw.TextStyle(
                                              fontSize: 6,
                                              )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                    pw.Container(
                                      child: pw.Text(
                                          '  Balance : ${data?[index]['rbalance']} ',
                                          style: pw.TextStyle(
                                            fontSize: 6,
                                          )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  children: [
                                    pw.Container(
                                      child: pw.Text(
                                          '  Date : ${data?[index]['date1']} ',
                                          style: pw.TextStyle(
                                              fontSize: 6,
                                              )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                    pw.Container(
                                      child: pw.Text(
                                          '  Time : ${data?[index]['time1']} ',
                                          style: pw.TextStyle(
                                            fontSize: 6,
                                          )),
                                      padding: pw.EdgeInsets.only(
                                          left: 5),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Text("..........................")
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),),
          ]
          );
        }),
    );
    return pdf.save();
  }
  }
