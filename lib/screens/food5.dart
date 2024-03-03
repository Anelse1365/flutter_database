import 'package:flutter/material.dart';

void main() {
  runApp(Food5Page());
}

class Food5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalCalories = 0;

  final List<String> imageUrls = [
    'https://fit-d.com/image_webp/f?src=./uploads/food/210ffe4c2b61582368d6d0eeafe6da65.jpg',
    'https://fit-d.com/image_webp/f?src=./uploads/food/210ffe4c2b61582368d6d0eeafe6da65.jpg',
    'https://fit-d.com/image_webp/f?src=./uploads/food/210ffe4c2b61582368d6d0eeafe6da65.jpg',
    'https://www.thaismescenter.com/wp-content/uploads/2020/02/1513.jpg',
    'https://www.thaismescenter.com/wp-content/uploads/2020/02/1513.jpg',
    'https://www.thaismescenter.com/wp-content/uploads/2020/02/1513.jpg',
    // Add more image URLs as needed
  ];

  final List<String> imageNames = [
    'พิซซ่า',
    'ขนมปัง',
    'ชื่อภาพ 3',
    'ชื่อภาพ 4',
    'ชื่อภาพ 5',
    'ชื่อภาพ 6',
    // Add more image names as needed
  ];

  final List<String> imageDescriptions = [
    '300 แคล',
    '500 แคล',
    '100 แคล',
    '200 แคล',
    '300 แคล',
    '100 แคล',
    // Add more image descriptions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('อาหารทะเล'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image tap if needed
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  imageUrls[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                imageNames[index],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                imageDescriptions[index],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      totalCalories += int.parse(
                                          imageDescriptions[index]
                                              .split(' ')[0]);
                                    });
                                  },
                                  child: Text('Add Calories'),
                                ),
                                const SizedBox(width: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      totalCalories = 0;
                                    });
                                  },
                                  child: Text('Clear'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Calories: $totalCalories',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    imageNames[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    imageDescriptions[index],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
