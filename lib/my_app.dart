import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swtp/repositories/database.dart';

import './screens/details_screen.dart';
import './screens/search/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DatabaseImpl()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchScreen(),
        routes: {
          SearchScreen.routeName: (_) => SearchScreen(),
          DetailsScreen.routeName: (_) => DetailsScreen(),
        },
      ),
    );
  }
}
