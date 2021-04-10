import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/models/detailed_swapi_item.dart';
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
    DetailedSwapiItem? detailedSwapiItem;
    try {
      final swapiItem = event.swapiItem;
      if (swapiItem is PeopleItem) {
        detailedSwapiItem =
            await _swapiProvider.getPeopleItemDetailed(swapiItem);
      } else if (swapiItem is FilmsItem) {
        detailedSwapiItem =
            await _swapiProvider.getFilmsItemDetailed(swapiItem);
      } else if (swapiItem is PlanetsItem) {
        detailedSwapiItem =
            await _swapiProvider.getPlanetsItemDetailed(swapiItem);
      } else if (swapiItem is SpeciesItem) {
        detailedSwapiItem =
            await _swapiProvider.getSpeciesItemsDetailed(swapiItem);
      } else if (swapiItem is StarshipsItem) {
        detailedSwapiItem =
            await _swapiProvider.getStarshipsItemDetailed(swapiItem);
      } else if (swapiItem is VehiclesItem) {
        detailedSwapiItem =
            await _swapiProvider.getVehiclesItemDetailed(swapiItem);
      }
      if (detailedSwapiItem != null) {
        yield DetailsStateLoaded(detailedSwapiItem);
      } else {
        yield DetailsStateError('Unable to fetch item details');
      }
    } catch (err) {
      yield DetailsStateError(err);
    }
  }
}
