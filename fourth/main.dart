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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.58,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://preview.redd.it/leo-and-its-future-v0-c7he6i0wmczd1.jpeg?auto=webp&s=6c453120dce6636826fc4ca9204609c9a0bc474e",
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.pink,
                    Colors.purple,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "LEO : Bloody Sweet",
                        style: GoogleFonts.sansita(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 35),
                          Icon(Icons.star, color: Colors.amber, size: 35),
                          Icon(Icons.star, color: Colors.amber, size: 35),
                          Icon(Icons.star, color: Colors.amber, size: 35),
                          Icon(Icons.star_half, color: Colors.amber, size: 35),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          profiles(
                            "https://i.pinimg.com/736x/b3/9c/0c/b39c0ca0faabf05a1c7d1e7b86366ae0.jpg",
                          ),
                          profiles(
                            "https://i.pinimg.com/736x/35/f2/45/35f245a8d68c4f110dd405cecb90d798.jpg",
                          ),
                          profiles(
                            "https://i.pinimg.com/736x/62/6f/c4/626fc4582fdedb00a4127e82a2732d53.jpg",
                          ),
                          profiles(
                            "https://i.pinimg.com/1200x/0e/35/24/0e352404425626a7ec21c62cdae71790.jpg",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "This Indian action thriller was directed by Lokesh Kanagaraj and stars Joseph Vijay in the title role. It is the third installment of the Lokesh Cinematic Universe (LCU) and was inspired by the 2005 film A History of Violence.",
                        style: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),
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
    ));
  }

  Container profiles(img) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.pink,
            Colors.purple,
            Colors.blue,
            Colors.green,
            Colors.yellow,
          ],
        ),
      ),
      padding: EdgeInsets.all(3),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(img)),
        ),
      ),
    );
  }
}
