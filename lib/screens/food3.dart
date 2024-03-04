import 'package:flutter/material.dart';

void main() {
  runApp(Food3Page());
}

class Food3Page extends StatelessWidget {
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
      'name': 'ช็อคโกแลตเค้ก (1 ชิ้น)',
      'image': 'assets/dessert/1_Chocolatecake.jpg',
      'calories': 370.7,
      'fat': 65,
      'protein': 50,
    },
    {
      'name': 'ไอศครีมกะทิ (1 โคน)',
      'image': 'assets/dessert/2_Iceream.png',
      'calories': 161.2,
      'fat': 11.8,
      'protein': 1.2,
    },
    {
      'name': 'ปังโทส (1 ชิ้น)',
      'image': 'assets/dessert/3_pangtos.jpg',
      'calories': 855,
      'fat': 43,
      'protein': 14,
    },
    {
      'name': 'บิงซูสตอเบอรี่ (1 ถ้วย)',
      'image': 'assets/dessert/4_bingsu.jpg',
      'calories': 912,
      'fat': 32,
      'protein': 19,
    },
    {
      'name': 'โรตีธรรมดา (1 แผ่น)',
      'image': 'assets/dessert/5_rotee.png',
      'calories': 198.5,
      'fat': 10.5,
      'protein': 0,
    },
    {
      'name': 'วาฟเฟิล (1 ชิ้น)',
      'image': 'assets/dessert/6_waffle.jpg',
      'calories': 291,
      'fat': 34.2,
      'protein': 13.9,
    },
    {
      'name': 'น้ำเต้าหู้',
      'image': 'assets/dessert/8.jpg',
      'calories': 54,
      'fat': 1.8,
      'protein': 3.3,
    },
    {
      'name': 'ชาเขียว',
      'image': 'assets/dessert/7.jpg',
      'calories': 143,
      'fat': 6,
      'protein': 3,
    },

    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ของหวาน'),
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
                                child: Image.asset(
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
