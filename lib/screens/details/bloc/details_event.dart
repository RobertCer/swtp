part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsEventLoad extends DetailsEvent {
  const DetailsEventLoad(this.swapiItem);

  final SwapiItem swapiItem;
}
