part of 'searcher_bloc.dart';

@immutable
abstract class SearcherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearcherSearch extends SearcherEvent {
  SearcherSearch(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}
