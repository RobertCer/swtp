part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchEventStart extends SearchEvent {
  SearchEventStart(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}
