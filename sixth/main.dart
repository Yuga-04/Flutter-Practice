import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://i.pinimg.com/736x/42/ea/2c/42ea2ce64dadd20d3f52d9cde49b9efe.jpg",
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(7, 5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "The Story of a Girl !",
                style: GoogleFonts.aboreto(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "              Once upon a time in a quiet village, there lived a small girl named Meera who was curious about everything around her. Every morning, she would follow the butterflies to the edge of the forest, her little feet leaving soft prints on the muddy path. She loved collecting colorful pebbles and imagining they were magical stones that could grant wishes. Meera’s world was simple yet full of wonder. One day, she found a tiny injured bird under a tree. Instead of being scared, she gently carried it home in her palms and nursed it back to health using water, rice, and lots of love. \n\n\t\t\t\t      As days passed, the bird healed and began to sing every morning near her window. It became her best friend and secret keeper. Whenever Meera felt sad or lonely, the bird’s song reminded her that kindness always comes back in beautiful ways. Years later, whenever people in the village spoke about Meera, they remembered her as the little girl with a big heart who taught everyone that even the smallest acts of love could make the world a brighter place.",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 34, 34, 34),
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
