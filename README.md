# Test1
## Тестирование загрузки на GitHub

import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children:[  
     Image.network('https://habrastorage.org/getpro/habr/upload_files/347/bc4/240/347bc424029e258318de6c8ab17c9052.png'),
     Image.network('https://habrastorage.org/getpro/habr/upload_files/347/bc4/240/347bc424029e258318de6c8ab17c9052.png')
    ]     
     );
  }
}
