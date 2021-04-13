part of 'searcher_bloc.dart';

@immutable
class SearcherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearcherInitial extends SearcherState {}

class SearcherSearching extends SearcherState {}

class SearcherResult extends SearcherState {
  SearcherResult(this.searchResult);

  final List<PeopleItem> searchResult;

  @override
  List<Object?> get props => [searchResult];
}

class SearcherError extends SearcherState {
  SearcherError(this.error);

  final Object error;

  @override
  List<Object?> get props => [error];
}
