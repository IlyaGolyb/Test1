import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Третий экран'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Вы на третьем экране!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.star, size: 50, color: Colors.amber),
            const SizedBox(height: 30),
            
            // Возврат назад
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('← Назад'),
            ),
            const SizedBox(height: 10),
            
            // Возврат на главный экран
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('На главный экран'),
            ),
          ],
        ),
      ),
    );
  }
}