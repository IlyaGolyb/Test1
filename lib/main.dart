import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://egtrtlmonoreyukwkgqz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVndHJ0bG1vbm9yZXl1a3drZ3F6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE4MDcwMjAsImV4cCI6MjA3NzM4MzAyMH0.0y2lEHl9wg7zRjV1CucgO-O7lIZGx8ZqRmQZMyBgZ-A',
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final _usernameController = TextEditingController();
  List<Map<String, dynamic>> _users = [];

  Future<void> _addUser() async {
    try {
      await Supabase.instance.client
          .from('Profils')  // Исправлено на Profils
          .insert({
            'text': _textController.text,
            'username': _usernameController.text,
          });
      
      _textController.clear();
      _usernameController.clear();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Данные добавлены')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    }
  }

  Future<void> _loadUsers() async {
    try {
      final response = await Supabase.instance.client
          .from('Profils')  // Исправлено на Profils
          .select();
      
      setState(() {
        _users = List<Map<String, dynamic>>.from(response);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка загрузки: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Supabase App')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Text'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _addUser,
                    child: Text('Добавить'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _loadUsers,
                    child: Text('Загрузить'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user['username']?.toString() ?? ''),
                    subtitle: Text(user['text']?.toString() ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}