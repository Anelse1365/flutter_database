import 'package:flutter/material.dart';
import 'package:flutter_database/models/TransactionItem.dart';
import 'package:flutter_database/providers/TransactionProvider.dart';
import 'package:flutter_database/screens/FormEditScreen.dart';
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
          create: (context) {
            return TransactionProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'My Account',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'บัญชีของฉัน'),
        routes: {
          '/formScreen': (context) => const FormScreen(),
          '/test2': (context) => const HeroListPage(),
          '/heroListPage': (context) => const HeroListPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/formScreen');
            },
            icon: const Text(
              "+",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/test2');
            },
            icon: const Text(
              "-",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, child) {
          provider.initAllData();
          int count = provider.transactions.length;
          if (count > 0) {
            List<TransactionItem> data = provider.getTransaction();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                TransactionItem item = provider.transactions[index];
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text("${item.amount}"),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.date.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);
                        provider.deleteData(item);
                      },
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FormEditScreen(data: item);
                      }));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "No Data.",
                style: TextStyle(fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}
