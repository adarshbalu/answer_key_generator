import 'package:answer_key_generator/provider/answer_list_provider.dart';
import 'package:answer_key_generator/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AnswerListProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Answer key Generator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
