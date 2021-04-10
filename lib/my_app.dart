import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swtp/repositories/hive_database.dart';
import 'package:swtp/repositories/swapi_provider.dart';

import './screens/details/details_screen.dart';
import './screens/search/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = HiveDatabase();
    return FutureBuilder(
      future: database.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // TODO: Handle error
            return MaterialApp(
              home: Scaffold(
                body: Text(snapshot.error.toString()),
              ),
            );
          } else {
            return MultiRepositoryProvider(
              providers: [
                RepositoryProvider(create: (context) => database),
                RepositoryProvider(
                    create: (context) => SwapiProvider(database)),
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
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Container(),
            ),
          );
        }
      },
    );
  }
}
