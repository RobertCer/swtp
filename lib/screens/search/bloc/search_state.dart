part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSearching extends SearchState {}

class SearchResult extends SearchState {
  SearchResult(this.searchResult);

  final List<PeopleItem> searchResult;

  @override
  List<Object?> get props => [searchResult];
}
