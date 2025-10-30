import 'package:flutter/material.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Второй экран'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Вы на втором экране!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            // Возврат назад
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('← Назад'),
            ),
            const SizedBox(height: 10),
            
            // Переход на третий экран через базовую навигацию
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ThirdScreen()),
                );
              },
              child: const Text('Базовая навигация → Третий экран'),
            ),
            const SizedBox(height: 10),
            
            // Переход на третий экран через Named routes
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Named Routes → Третий экран'),
            ),
          ],
        ),
      ),
    );
  }
}