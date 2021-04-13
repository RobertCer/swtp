import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:swapi_dart/swapi_dart.dart';

part 'searcher_event.dart';
part 'searcher_state.dart';

class SearcherBloc extends Bloc<SearcherEvent, SearcherState> {
  SearcherBloc(Swapi swapi)
      : _swapi = swapi,
        super(SearcherInitial());

  final Swapi _swapi;

  @override
  Stream<SearcherState> mapEventToState(
    SearcherEvent event,
  ) async* {
    if (event is SearcherSearch) {
      yield* _mapSearchToState(event);
    }
  }

  Stream<SearcherState> _mapSearchToState(SearcherSearch event) async* {
    yield SearcherSearching();

    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        yield SearcherError('No internet connection');
      } else {
        final people = await _swapi.searchAllPeople(event.name);
        yield SearcherResult(people);
      }
    } catch (err) {
      yield SearcherError(err);
    }
  }
}
