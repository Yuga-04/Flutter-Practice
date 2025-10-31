import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child:

          Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.immediate.co.uk/production/volatile/sites/30/2021/08/One-pot-spiced-roast-chicken-05079e9.jpg",
                          ),
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      height: 400,
                      width: 225,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 10,
                      children: [
                        circlephoto(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxLUylpXSB7u85LFAYqTeMTc1SBAuH-YKJ_Q&s",
                        ),
                        circlephoto(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC8rJHcxD0CvXKQkD_c_Fcu9qqI7YfZxT74Q&s",
                        ),
                        circlephoto(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2vOhoXWj1Z-xJj0l72BkxFS4W0rGUuN51wA&s",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Delicious Food !",
                  style: GoogleFonts.sansita(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Food is a necessary nourishment for every living being to survive. Every living creature needs food in addition to clothing and shelter in order to exist..",
                    style: GoogleFonts.lexend(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [button("\$. 120"), button("1 + 1"), button("+ 5 ⭐")],
                ),
              ],
            ),
          ),
        ),
      
    );
  }

  Container button(dis) {
    return Container(
      height: 75,
      width: 100,
      alignment: Alignment.center,
      child: Text(
        dis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 25,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  CircleAvatar circlephoto(img) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      radius: 54,
      child: CircleAvatar(
        backgroundImage: NetworkImage(img),
        backgroundColor: Colors.black,
        radius: 50,
      ),
    );
  }
}
