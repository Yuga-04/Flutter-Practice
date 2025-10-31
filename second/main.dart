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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTohsHpg8w1H61Amh3MSQGQJx1RNR0XjQFu4g&s",
                    ),
                  ),
                ),
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDYVbDAal0CY7xGYSJIiXo5zrgMVotmee6lQ&s",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Classic 500",
                style: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Specification",
                style: TextStyle(
                  color: const Color.fromARGB(255, 211, 17, 3),
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  specs(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3OOIbpMiIR3Riqt_X36w4zMGHD7w2upR7Ew&s",
                    "300 CC",
                  ),
                  specs(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSuK-PtEnj30VqmFoG8cSa3Y7id8ggrw0OoA&s",
                    "90.9 KM",
                  ),
                  specs(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFfD2e7A1CwA7fPvJS6ulw9n0EMbQAFyR42w&s",
                    "Disk",
                  ),
                  specs(
                    "https://sparesgen.com/wp-content/uploads/2025/06/Fascino-Front-Brake-Shoe-600x600.png",
                    "45 LS",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(15),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://cdn.bikedekho.com/upload/userfiles/images/685be3465b495.jpg?tr=w-420",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Container specs(img, txt) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 45, child: Image.network(img, fit: BoxFit.contain)),
          const SizedBox(height: 5),
          Text(
            txt,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
