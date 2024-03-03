import 'package:flutter/material.dart';
import 'food1.dart'; // Import food1.dart
import 'food2.dart'; // Import food2.dart
import 'food3.dart'; // Import food3.dart
import 'food4.dart'; // Import food4.dart
import 'food5.dart'; // Import food5.dart
import 'food6.dart'; // Import food6.dart

class HeroListPage extends StatelessWidget {
  const HeroListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เลือกหมวดหมู่"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  if (_contents[index] == 'เมนูอาหารหลัก') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food1Page(),
                    ));
                  } else if (_contents[index] == 'ขนมกินเล่น') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food2Page(),
                    ));
                  } else if (_contents[index] == 'ของหวาน') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food3Page(),
                    ));
                  } else if (_contents[index] == 'ชากาแฟ') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food4Page(),
                    ));
                  } else if (_contents[index] == 'อาหารทะเล') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food5Page(),
                    ));
                  } else if (_contents[index] == 'ผักผลไม้') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food6Page(),
                    ));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage(
                        heroTag: index,
                        content: _contents[index],
                      ),
                    ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: index,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            _images[index],
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _contents[index],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;
  final String content;

  const SecondPage({Key? key, required this.heroTag, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero ListView Page 2")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _images[heroTag],
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              content,
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}

final List<String> _images = [
  'assets/album/1.jpg',
  'assets/album/2.jpg',
  'assets/album/3.jpg',
  'assets/album/4.png',
  'assets/album/5.jpg',
  'assets/album/6.jpg',
];

final List<String> _contents = [
  'เมนูอาหารหลัก',
  'ขนมกินเล่น',
  'ของหวาน',
  'ชากาแฟ',
  'อาหารทะเล',
  'ผักผลไม้',
];
