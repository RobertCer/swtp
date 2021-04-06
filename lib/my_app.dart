import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/details_screen.dart';
import './screens/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
      routes: {
        SearchScreen.routeName: (_) => SearchScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen(),
      },
    );
  }
}
