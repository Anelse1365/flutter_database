import 'package:flutter/material.dart';
import 'food1.dart'; // Import food1.dart
import 'food2.dart'; // Import food1.dart
import 'food3.dart'; // Import food1.dart
import 'food4.dart'; // Import food1.dart
import 'food5.dart'; // Import food1.dart
import 'food6.dart'; // Import food1.dart

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
                      builder: (context) => Food2Page(), // เพิ่มนี้
                    ));
                  } else if (_contents[index] == 'ของหวาน') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food3Page(), // เพิ่มนี้
                    ));
                  } else if (_contents[index] == 'ชากาแฟ') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food4Page(), // เพิ่มนี้
                    ));
                  } else if (_contents[index] == 'อาหารทะเล') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food5Page(), // เพิ่มนี้
                    ));
                  } else if (_contents[index] == 'ผักผลไม้') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food6Page(), // เพิ่มนี้
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
                          child: Image.network(
                            _images[index],
                            width: 200,
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
                  child: Image.network(_images[heroTag]),
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
  'https://media.istockphoto.com/id/938742222/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%9E%E0%B8%B4%E0%B8%8B%E0%B8%8B%E0%B9%88%E0%B8%B2%E0%B8%8A%E0%B8%B5%E0%B8%AA%E0%B9%80%E0%B8%9B%E0%B8%9B%E0%B9%80%E0%B8%9B%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B9%82%E0%B8%A3%E0%B8%99%E0%B8%B5.jpg?s=612x612&w=0&k=20&c=C2HzP64oleC_v1f-Ym-akBw0_RSXfq30s3TO_D9gk0o=',
  'https://fit-d.com/image_webp/f?src=./uploads/food/16cca95edc9ab6185c8720bed16ae178.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWPR6bam73DRdBoAan2ntJoAcJgyCgUMB27g&usqp=CAU',
  'https://food.mthai.com/app/uploads/2019/11/SW.jpg',
  'https://food.mthai.com/app/uploads/2019/11/SW.jpg',
  'https://food.mthai.com/app/uploads/2019/11/SW.jpg'
];

final List<String> _contents = [
  'เมนูอาหารหลัก',
  'ขนมกินเล่น',
  'ของหวาน',
  'ชากาแฟ',
  'อาหารทะเล',
  'ผักผลไม้',
];
