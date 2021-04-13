import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/history';
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Previously viewed')),
      body: Center(child: Text('TODO')),
    );
  }
}
