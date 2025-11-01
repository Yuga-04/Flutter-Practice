// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

String val = "";
bool v1 = false;
bool v2 = false;
bool v3 = false;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://i.pinimg.com/1200x/30/ba/2d/30ba2d3e7f2244fd2b316f920938edd3.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "FeedBack Form",
              style: GoogleFonts.acme(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: const Color.fromARGB(255, 127, 3, 149),
                          ),
                          hintText: "Enter Your Name !",
                          labelText: "Your Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.call,
                            color: const Color.fromARGB(255, 127, 3, 149),
                          ),
                          hintText: "Enter Your Number !",
                          labelText: "Mobile No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Your Degree",
                        style: GoogleFonts.afacad(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                
                        children: [
                          Radio(
                            value: "UG",
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value.toString();
                              });
                            },
                          ),
                          Text("UG"),
                          Radio(
                            value: "PG",
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value.toString();
                              });
                            },
                          ),
                          Text("PG"),
                        ],
                      ),
                      Text(
                        "Skills",
                        style: GoogleFonts.afacad(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: v1,
                            onChanged: (value) {
                              setState(() {
                                v1 =value ??false;
                              });
                            },
                          ),
                          Text("Flutter"),Checkbox(
                            value: v2,
                            onChanged: (value) {
                              setState(() {
                                v2 =value?? false;
                              });
                            },
                          ),
                          Text("React Native"),Checkbox(
                            value: v3,
                            onChanged: (value) {
                              setState(() {
                                v3 =value?? false;
                              });
                            },
                          ),
                          Text("Kotlin")
                        ],
                      ),
                      SizedBox(height: 20,),
                     TextField(
                      maxLines: 5,
                        decoration: InputDecoration(
                          hintText:"Enter your feedback...",
                          labelText: "Your Feedback",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
