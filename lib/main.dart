import 'package:flutter/material.dart';
import 'package:flutter_database/providers/TransactionProvider.dart';
import 'screens/FormScreen.dart';
import 'screens/test2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Account',
      home: const MyHomePage(title: ''),
      routes: {
        '/test2': (context) => const HeroListPage(),
        '/heroListPage': (context) => const HeroListPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 120, 194, 255),
            ),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Check Food Calories",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "อาหารแคลเยอะยอดฮิต",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 360,
            left: 0,
            child: ImageSlider(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 156, 141, 255),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  "ดูแคลอรี่อาหาร",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // ปรับความสูงของ Slide ตามต้องการ
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: 3, // จำนวนรูปภาพ
        itemBuilder: (context, index) {
          return Image.asset(
            'assets/album/${index + 1}.jpg',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
