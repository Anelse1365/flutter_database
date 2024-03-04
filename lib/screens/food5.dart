import 'package:flutter/material.dart';

void main() {
  runApp(Food5Page());
}

class Food5Page extends StatelessWidget {
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
      'name': 'ปูนิ่มผัดผงกะหรี่',
      'image': 'assets/seafood/1_crabpad.jpg',
      'calories': 746.1,
      'fat': 30.8,
      'protein': 73.9,
    },
    {
      'name': 'กุ้งแม่น้ำเผา (1 ตัว)',
      'image': 'assets/seafood/2_crayfish.jpg',
      'calories': 96,
      'fat': 0,
      'protein': 18.7,
    },
    {
      'name': 'หมึกผัดไข่เค็ม',
      'image': 'assets/seafood/3_squid.jpg',
      'calories': 90,
      'fat': 2,
      'protein': 16,
    },
    {
      'name': 'ปลาหมึกทอดน้ำปลา',
      'image': 'assets/seafood/4_squidfry.jpg',
      'calories': 175,
      'fat': 7.5,
      'protein': 17.9,
    },
    {
      'name': 'ทะเลผัดผฝกะหรี่',
      'image': 'assets/seafood/5_seapad.jpg',
      'calories': 291,
      'fat': 34.2,
      'protein': 13.9,
    },
    {
      'name': 'ช้าวผัดต้มยำทะเล',
      'image': 'assets/seafood/6_fryrice.jpg',
      'calories': 500,
      'fat': 65,
      'protein': 50,
    },
    // Add more food items as needed
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
