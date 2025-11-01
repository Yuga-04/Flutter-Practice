import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<GlobalKey<ExpansionTileCardState>> cardKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Student Details",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 234, 25, 10),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              tileCard(
                0,
                "Yuga T",
                "23IT1251",
                "B +ve",
                "8682812310",
                "417,Uthangarai Kadu,Rayarpalayam,\nChinnasalem,Pethanur(POST),\nKallakurichi(TALUK & DISTRICT),\n606201",
              ),
              tileCard(
                1,
                "Velamran E",
                "23IT1196",
                "O -ve",
                "9876543210",
                "19,Saras Vilas,Patel Street,\nPadur,Chennai-119",
              ),
              tileCard(
                2,
                "Sastidharan T",
                "23IT1200",
                "B +ve",
                "81234567890",
                "Boys Hostel,\nSt.Joseph's Institute of Technology,\nOMR,Chennai-119",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileCard(
    int index,
    String name,
    String rollno,
    String bloodg,
    String phone,
    String add,
  ) {
    return ExpansionTileCard(
      key: cardKeys[index],
      leading: ClipOval(
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxiEQcaL-D6RT4f1C87bgUOpfeNrL_0XLZaQ&s",
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
      ),
      title: Text(name),
      subtitle: Text(rollno),
      onExpansionChanged: (expanded) {
        if (expanded) {
          setState(() {
            // close all others
            for (int i = 0; i < cardKeys.length; i++) {
              if (i != index) {
                cardKeys[i].currentState?.collapse();
              }
            }
            expandedIndex = index;
          });
        } else if (expandedIndex == index) {
          expandedIndex = null;
        }
      },
      children: [
        infoRow(Icons.bloodtype, Colors.red, bloodg),
        infoRow(Icons.phone, Colors.blue, "+91 $phone"),
        infoRow(Icons.home, Colors.blue, add),
        OverflowBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            customButton("Exam", Icons.schedule),
            customButton("Attendance", Icons.book),
            customButton("Fee Details", Icons.currency_rupee),
          ],
        ),
      ],
    );
  }

  Widget infoRow(IconData icon, Color color, String text) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(String txt, IconData icn) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        // ignore: deprecated_member_use
        overlayColor: Colors.blue,
        foregroundColor: Colors.blue,
      ),
      child: Column(
        children: [
          Icon(icn, size: 30),
          const SizedBox(height: 5),
          Text(txt, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
