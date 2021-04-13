import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi_dart/swapi_api.dart';
import 'package:swtp/repositories/database.dart';
import 'package:swtp/repositories/hive_database.dart';
import 'package:swtp/repositories/swapi_provider.dart';
import 'package:swtp/repositories/swapi_stub.dart';
import 'package:swtp/screens/history/history_screen.dart';
import 'package:swtp/screens/home/home_screen.dart';

import 'screens/details/details_screen.dart';
import 'screens/search/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Database database = HiveDatabase();
    final Swapi swapi = Swapi.instance;
    final swapiProvider = SwapiProvider(
      database: database,
      swapi: swapi,
    );

    return FutureBuilder(
      future: database.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Text(snapshot.error.toString()),
              ),
            );
          } else {
            return MultiRepositoryProvider(
              providers: [
                RepositoryProvider(create: (context) => swapi),
                RepositoryProvider(create: (context) => database),
                RepositoryProvider(create: (context) => swapiProvider),
              ],
              child: MaterialApp(
                initialRoute: HomeScreen.routeName,
                debugShowCheckedModeBanner: false,
                routes: {
                  HomeScreen.routeName: (_) => HomeScreen(),
                  SearchScreen.routeName: (_) => SearchScreen(),
                  DetailsScreen.routeName: (_) => DetailsScreen(),
                  HistoryScreen.routeName: (_) => HistoryScreen(),
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
