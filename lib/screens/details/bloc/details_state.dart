part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsStateInitial extends DetailsState {}

class DetailsStateLoading extends DetailsState {}

class DetailsStateLoaded extends DetailsState {
  const DetailsStateLoaded(this.detailedSwapiItem);
  final DetailedSwapiItem detailedSwapiItem;

  @override
  List<Object> get props => [detailedSwapiItem];
}

class DetailsStateError extends DetailsState {
  const DetailsStateError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
