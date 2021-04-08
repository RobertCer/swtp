import 'package:flutter/material.dart';
import 'package:swtp/models/people.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();

  static Object createArguments(PeopleItem peopleItem) => peopleItem;
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final peopleItem = ModalRoute.of(context)!.settings.arguments as PeopleItem;
    return Scaffold(
      appBar: AppBar(title: Text('Details for ${peopleItem.name}')),
    );
  }
}
