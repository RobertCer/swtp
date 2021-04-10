part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsStateInitial extends DetailsState {}

class DetailsStateLoading extends DetailsState {}

class DetailsStateLoaded extends DetailsState {
  const DetailsStateLoaded(this.peopleItemDetailed);
  final PeopleItemDetailed peopleItemDetailed;

  @override
  List<Object> get props => [peopleItemDetailed];
}

class DetailsStateError extends DetailsState {
  const DetailsStateError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
