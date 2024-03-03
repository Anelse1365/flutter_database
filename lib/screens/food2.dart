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
      'name': 'เฟรนฟราย (113g)',
      'image':
          'https://image.posttoday.com/media/content/2018/11/28/809833FC1C0A47E58125BB86B868D0B7.png',
      'calories': 330,
      'fat': 17,
      'protein': 5,
    },
    {
      'name': 'ขนมปังกระเทียม (1 ชิ้น)',
      'image':
          'https://cdn.1112.com/1112/public//images/products/appetizer/116525_4.png',
      'calories': 85,
      'fat': 4,
      'protein': 1,
    },
    {
      'name': 'ปีกไก่ทอด (1 ชิ้น)',
      'image': 'https://i.ytimg.com/vi/60xSNZvr7Ck/maxresdefault.jpg',
      'calories': 90,
      'fat': 15.3,
      'protein': 26.4,
    },
    {
      'name': 'นักเก็ตทอด (1 ชิ้น)',
      'image':
          'https://media.istockphoto.com/id/618209540/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%95%E0%B8%B0%E0%B8%81%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B9%80%E0%B8%81%E0%B9%87%E0%B8%95%E0%B9%84%E0%B8%81%E0%B9%88%E0%B8%8B%E0%B8%AD%E0%B8%AA%E0%B9%80%E0%B8%9B%E0%B8%A3%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%A7%E0%B8%AB%E0%B8%A7%E0%B8%B2%E0%B8%99.jpg?s=612x612&w=0&k=20&c=jS2w5ffZDdqQutFSNyCX1sU313AmPYYTHqHQ3qwwOO0=',
      'calories': 45,
      'fat': 3,
      'protein': 3,
    },
    {
      'name': 'ทาโกะยากิ (1 ลูก)',
      'image': 'https://img.kapook.com/u/2017/surauch/cooking/n1_9.jpg',
      'calories': 54,
      'fat': 2,
      'protein': 3,
    },
    {
      'name': 'ไก่ป๊อบ (100g)',
      'image': 'https://mpics.mgronline.com/pics/Images/552000011684405.JPEG',
      'calories': 300,
      'fat': 16,
      'protein': 15,
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
