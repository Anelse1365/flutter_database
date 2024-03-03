import 'package:flutter/material.dart';

void main() {
  runApp(Food2Page());
}

class Food2Page extends StatelessWidget {
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
  num totalCalories = 0;
  num totalFat = 0;
  num totalProtein = 0;

  final List<Map<String, dynamic>> foods = [
    {
      'name': 'พิซซ่า',
      'image':
          'https://fit-d.com/image_webp/f?src=./uploads/food/210ffe4c2b61582368d6d0eeafe6da65.jpg',
      'calories': 300,
      'fat': 15,
      'protein': 10,
    },
    {
      'name': 'ขนมปัง',
      'image':
          'https://fit-d.com/image_webp/f?src=./uploads/food/210ffe4c2b61582368d6d0eeafe6da65.jpg',
      'calories': 500,
      'fat': 20,
      'protein': 15,
    },
    {
      'name': 'ชื่อภาพ 3',
      'image':
          'https://s.isanook.com/wo/0/ud/37/186793/r.jpg?ip/crop/w670h402/q80/jpg',
      'calories': 100,
      'fat': 5,
      'protein': 8,
    },
    {
      'name': 'ชื่อภาพ 4',
      'image':
          'https://static.thairath.co.th/media/dFQROr7oWzulq5Fa5naLwWtYtNesZaki91wtz8N9CQg7YZvxZMhzjwoOWiUn6p2zikv.jpg',
      'calories': 200,
      'fat': 10,
      'protein': 12,
    },
    {
      'name': 'ชื่อภาพ 5',
      'image':
          'https://www.thaismescenter.com/wp-content/uploads/2020/02/1513.jpg',
      'calories': 300,
      'fat': 15,
      'protein': 10,
    },
    {
      'name': 'ชื่อภาพ 6',
      'image':
          'https://www.thaismescenter.com/wp-content/uploads/2020/02/1513.jpg',
      'calories': 100,
      'fat': 5,
      'protein': 8,
    },
    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ขนมกินเล่น'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: foods.length,
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
                                  foods[index]['image'],
                                  width: 180,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                foods[index]['name'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Calories: ${foods[index]['calories']}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Fat: ${foods[index]['fat']}g',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Protein: ${foods[index]['protein']}g',
                                style: TextStyle(
                                  fontSize: 20.0,
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
                                      totalCalories += foods[index]['calories'];
                                      totalFat += foods[index]['fat'];
                                      totalProtein += foods[index]['protein'];
                                    });
                                  },
                                  child: Text('Add Calories'),
                                ),
                                const SizedBox(width: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      totalCalories = 0;
                                      totalFat = 0;
                                      totalProtein = 0;
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
                                'Calories: $totalCalories, Fat: $totalFat g, Protein: $totalProtein g',
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
                      foods[index]['image'],
                      width: 180, //ขนาดตัวอย่าง
                      height: 120, //ขนาดตัวอย่าง
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    foods[index]['name'],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Calories: ${foods[index]['calories']}',
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
