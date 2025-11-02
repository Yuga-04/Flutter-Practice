import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String mainimg =
      "https://i.pinimg.com/736x/7b/74/7c/7b747c8065d4a1f088dbfe40ad506ef9.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final isTablet = width > 600;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [

                  Center(
                    child: Image.network(
                      "https://i.pinimg.com/736x/1a/c6/82/1ac682ae545082a04e95a9a5cc8f757b.jpg",
                      height: height * 0.22,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: height * 0.015),


                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: width * 0.04),
                        menubar("Ambur Biryani", width, height),
                        SizedBox(width: width * 0.04),
                        menubar("Donne Biryani", width, height),
                        SizedBox(width: width * 0.04),
                        menubar("Sindhi Biryani", width, height),
                        SizedBox(width: width * 0.04),
                        menubar("Kolkata Biryani", width, height),
                        SizedBox(width: width * 0.04),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(width * 0.02),
                      margin: EdgeInsets.all(width * 0.03),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.3,
                              child: Card(
                                color: Colors.white,
                                elevation: 4,
                                shadowColor: Colors.black54,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      briyanibar(
                                        "https://i.pinimg.com/736x/7b/74/7c/7b747c8065d4a1f088dbfe40ad506ef9.jpg",
                                        width,
                                        height,
                                      ),
                                      briyanibar(
                                        "https://i.pinimg.com/736x/cf/4d/b6/cf4db6676f5ecc769211614151f0a988.jpg",
                                        width,
                                        height,
                                      ),
                                      briyanibar(
                                        "https://i.pinimg.com/736x/95/0e/61/950e619924a17fb5886e4955b3de28ab.jpg",
                                        width,
                                        height,
                                      ),
                                      briyanibar(
                                        "https://i.pinimg.com/736x/7e/9e/57/7e9e57880d24c56c43271793a189d756.jpg",
                                        width,
                                        height,
                                      ),
                                      briyanibar(
                                        "https://i.pinimg.com/736x/88/65/08/886508928bb3795b1c535745c921f5fc.jpg",
                                        width,
                                        height,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.black54,
                                color: Colors.white,
                                child: Container(
                                  padding: EdgeInsets.all(width * 0.02),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.25,
                                        width: height * 0.25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(mainimg),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.015),

                                      Text(
                                        "Ingredients : ",
                                        style: GoogleFonts.poppins(
                                          fontStyle: FontStyle.italic,
                                          fontSize: isTablet
                                              ? width * 0.025
                                              : width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: height * 0.01),

                                      
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(width * 0.02),
                                          child: Row(
                                            children: [
                                              ingredients(
                                                  "https://i.pinimg.com/736x/38/36/a1/3836a17c652c67f0d359c19027f9c233.jpg",
                                                  width),
                                              ingredients(
                                                  "https://i.pinimg.com/736x/ac/40/0b/ac400bf6b98cdf235fea26515abf3235.jpg",
                                                  width),
                                              ingredients(
                                                  "https://i.pinimg.com/1200x/c9/91/24/c991241e996d391d80dadb4363532b5e.jpg",
                                                  width),
                                              ingredients(
                                                  "https://i.pinimg.com/1200x/1c/21/d7/1c21d73dccd6f51e8a4a211649c9390a.jpg",
                                                  width),
                                              ingredients(
                                                  "https://i.pinimg.com/736x/7e/3e/38/7e3e380a434972c76e13391ae0c39889.jpg",
                                                  width),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: height * 0.015),

                                      Text(
                                        "Biryani",
                                        style: GoogleFonts.poppins(
                                          fontSize: isTablet
                                              ? width * 0.03
                                              : width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.005),
                                      Text(
                                        "₹240.00",
                                        style: GoogleFonts.arima(
                                          fontSize: isTablet
                                              ? width * 0.03
                                              : width * 0.05,
                                          fontWeight: FontWeight.bold,
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget ingredients(String img, double width) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.025),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: width * 0.08,
        child: CircleAvatar(
          radius: width * 0.075,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(img),
        ),
      ),
    );
  }


  Widget briyanibar(String img, double width, double height) {
    return GestureDetector(
      onTap: () {
        setState(() {
          mainimg = img;
        });
      },
      child: Container(
        margin: EdgeInsets.all(width * 0.02),
        height: height * 0.12,
        width: width * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black54, width: 0.5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 2,
              offset: Offset(4, 5),
            ),
          ],
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(img)),
        ),
      ),
    );
  }


  Widget menubar(String txt, double width, double height) {
    return Container(
      height: height * 0.04,
      width: width * 0.35,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          txt,
          style: GoogleFonts.adamina(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.04,
          ),
        ),
      ),
    );
  }
}
