import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swtp/models/detailed/people_detailed.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/repositories/swapi_provider.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(SwapiProvider swapiProvider)
      : _swapiProvider = swapiProvider,
        super(DetailsStateInitial());

  final SwapiProvider _swapiProvider;

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (event is DetailsEventLoad) {
      yield* _mapLoadToState(event);
    }
  }

  Stream<DetailsState> _mapLoadToState(DetailsEventLoad event) async* {
    yield DetailsStateLoading();
    try {
      final peopleItemDetailed =
          await _swapiProvider.getPeopleItemDetailed(event.peopleItem);

      yield DetailsStateLoaded(peopleItemDetailed);
    } catch (err) {
      yield DetailsStateError(err);
    }
  }
}
