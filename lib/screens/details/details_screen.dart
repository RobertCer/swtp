import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swtp/models/detailed/people_detailed.dart';
import 'package:swtp/models/people.dart';
import 'package:swtp/repositories/swapi_provider.dart';
import 'package:swtp/screens/details/bloc/details_bloc.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();

  static Object createArguments(PeopleItem peopleItem) => peopleItem;
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final DetailsBloc _detailsBloc;
  late final PeopleItem _peopleItem;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    final swapiProvider = RepositoryProvider.of<SwapiProvider>(context);

    _peopleItem = ModalRoute.of(context)!.settings.arguments as PeopleItem;

    _detailsBloc = DetailsBloc(swapiProvider);
    _detailsBloc.add(DetailsEventLoad(_peopleItem));

    _initialized = true;
  }

  @override
  void dispose() {
    _detailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final peopleItem = ModalRoute.of(context)!.settings.arguments as PeopleItem;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for ${peopleItem.name}'),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: _detailsBloc,
        builder: (context, state) {
          if (state is DetailsStateLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
          } else if (state is DetailsStateError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is DetailsStateLoaded) {
            return _buildDetailsContent(state.peopleItemDetailed);
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }

  Widget _buildDetailsContent(PeopleItemDetailed peopleItemDetailed) {
    final items = [
      ['Name', peopleItemDetailed.name],
      ['Birth year', peopleItemDetailed.birthYear],
      ['Eye color', peopleItemDetailed.eyeColor],
      ['Gender', peopleItemDetailed.gender],
      ['Hair color', peopleItemDetailed.hairColor],
      ['Height', peopleItemDetailed.height],
      ['Mass', peopleItemDetailed.mass],
      ['Skin color', peopleItemDetailed.skinColor],
      ['Home world', peopleItemDetailed.homeWorld.name],
      // ['url', peopleItemDetailed.url],
      // ['created', peopleItemDetailed.created],
      // ['edited', peopleItemDetailed.edited],
      ['Films', '${peopleItemDetailed.filmsList.length}'],
      ['Species', '${peopleItemDetailed.speciesList.length}'],
      ['Starships', '${peopleItemDetailed.starShipsList.length}'],
      ['Vehicles', '${peopleItemDetailed.vehiclesList.length}'],
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item[0].toString()),
          subtitle: Text(item[1].toString()),
        );
      },
    );
  }
}

// class DetailsListItemHolder<T> {
//   final String title;
//   final Object value;
//   final List<T>? items;
// }
