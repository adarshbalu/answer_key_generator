import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer key Generator'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {},
      ),
      body: Container(
        child: Column(
          children: [
            Text('Add Answer key data'),
          ],
        ),
      ),
    );
  }
}
