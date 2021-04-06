import 'package:flutter/material.dart';
import 'package:swtp/screens/details_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search screen')),
      body: Container(
          child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(DetailsScreen.routeName);
          },
          child: Text('Go to details'),
        ),
      )),
    );
  }
}
