import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'third_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Базовая навигация
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondScreen()),
                );
              },
              child: const Text('Базовая навигация → Второй экран'),
            ),
            const SizedBox(height: 10),
            
            // Named routes
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Named Routes → Второй экран'),
            ),
            const SizedBox(height: 10),
            
            // GoRouter (закомментирован пока не установлен)
            /*
            ElevatedButton(
              onPressed: () {
                context.push('/second');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('GoRouter → Второй экран'),
            ),
            */
            const SizedBox(height: 10),
            
            // Прямой переход на третий экран
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ThirdScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 235, 124, 124),
              ),
              child: const Text('Прямо в третий экран'),
            ),
          ],
        ),
      ),
    );
  }
}