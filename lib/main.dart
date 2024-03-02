import 'package:flutter/material.dart';
import 'package:flutter_database/providers/TransactionProvider.dart';
import 'screens/FormScreen.dart';
import 'screens/test2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'My Account',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'บัญชีของฉัน'),
        routes: {
          '/test2': (context) => const HeroListPage(),
          '/heroListPage': (context) => const HeroListPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    TransactionProvider provider =
        Provider.of<TransactionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/test2');
            },
            icon: const Text(
              "+",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          // ปุ่ม "ดูแคลอรี่อาหาร"
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/test2');
            },
            icon: const Text(
              "ดูแคลอรี่อาหาร",
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Calories:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // แสดงค่าแคลอรี่ทั้งหมดจาก Provider
            Consumer<TransactionProvider>(
              builder: (context, provider, child) {
                return Text(
                  '${provider.totalCalories}',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
