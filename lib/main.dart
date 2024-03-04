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
          Image.asset(
            'assets/album/1.jpg',
            height: size.height * 1,
            width: size.width,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.45),
            colorBlendMode: BlendMode.darken,
          ),
          Positioned(
            bottom: size.height * 0.4, // ปรับตำแหน่ง Text ตามต้องการ
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CHECK ',
                  style: TextStyle(
                    fontSize: 50.0, //size text
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0), // เพิ่มระยะห่างระหว่างข้อความ
                Text(
                  'FOOD ',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  'CALORIES ',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 253, 114, 156),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  "ดูแคลอรี่อาหาร",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
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


// class ImageSlider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150, // ปรับความสูงของ Slide ตามต้องการ
//       width: MediaQuery.of(context).size.width,
//       child: PageView.builder(
//         itemCount: 3, // จำนวนรูปภาพ
//         itemBuilder: (context, index) {
//           return Image.asset(
//             'assets/album/${index + 1}.jpg',
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
// }

// class ImageSlider2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150, // ปรับความสูงของ Slide ตามต้องการ
//       width: MediaQuery.of(context).size.width,
//       child: PageView.builder(
//         itemCount: 3, // จำนวนรูปภาพ
//         itemBuilder: (context, index) {
//           return Image.asset(
//             'assets/album/${index + 1}.jpg',
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
// }
