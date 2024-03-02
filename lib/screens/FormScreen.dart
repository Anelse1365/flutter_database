import 'package:flutter/material.dart';
import 'package:flutter_database/providers/TransactionProvider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // เพิ่มค่าแคลอรี่ลงใน Provider เมื่อกดปุ่ม
            Provider.of<TransactionProvider>(context, listen: false)
                .addCalories(100);
          },
          child: Text('Add Calories'),
        ),
      ),
    );
  }
}
