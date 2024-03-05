import 'package:flutter/material.dart';

void main() {
  runApp(Food1Page());
}

class Food1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      'image': 'assets/food1/1.jpg',
      'calories': 300,
      'fat': 15,
      'protein': 10,
    },
    {
      'name': 'สเต็กหมู',
      'image': 'assets/album/1.jpg',
      'calories': 259.1,
      'fat': 4.3,
      'protein': 19.6,
    },
    {
      'name': 'ข้าวผัดไข่',
      'image': 'assets/food1/2.png',
      'calories': 381.4,
      'fat': 14.1,
      'protein': 12.8,
    },
    {
      'name': 'ข้าวมันไก่',
      'image': 'assets/food1/4.png',
      'calories': 704.3,
      'fat': 18.8,
      'protein': 42.5,
    },
    {
      'name': 'ข้าวไข่เจียว',
      'image': 'assets/food1/5.jpg',
      'calories': 445,
      'fat': 65,
      'protein': 50,
    },
    {
      'name': 'ข้าวยำไก่',
      'image': 'assets/food1/7.jpg',
      'calories': 640,
      'fat': 18,
      'protein': 25,
    },
    {
      'name': 'กะเพราหมูกรอบ',
      'image': 'assets/food1/6.jpg',
      'calories': 753.8,
      'fat': 54,
      'protein': 14.3,
    },
    {
      'name': 'ข้าวหมูแดง',
      'image': 'assets/food1/8.jpg',
      'calories': 541,
      'fat': 18,
      'protein': 19,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('อาหารจารหลัก'),
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
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  foods[index]['image'],
                                  width: 180,
                                  height: 120,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      foods[index]['image'],
                      width: 180,
                      height: 120,
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
