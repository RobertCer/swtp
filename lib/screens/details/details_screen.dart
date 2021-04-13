import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swtp/models/detailed_swapi_item.dart';
import 'package:swtp/repositories/swapi_provider.dart';
import 'package:swtp/screens/details/bloc/details_bloc.dart';
import 'package:swapi_dart/swapi_dart.dart';
import 'package:swtp/widgets/custom_progress_indicator.dart';
import 'package:swtp/widgets/details_list_item.dart';
import 'package:swtp/extensions/swapi_item_utils.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();

  static Object createArguments(SwapiItem swapiItem) => swapiItem;
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final DetailsBloc _detailsBloc;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    final swapiProvider = RepositoryProvider.of<SwapiProvider>(context);

    final swapiItem = ModalRoute.of(context)!.settings.arguments as SwapiItem;

    _detailsBloc = DetailsBloc(swapiProvider);
    _detailsBloc.add(DetailsEventLoad(swapiItem));

    _initialized = true;
  }

  @override
  void dispose() {
    _detailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final swapiItem = ModalRoute.of(context)!.settings.arguments as SwapiItem;

    return Scaffold(
      appBar: AppBar(title: Text(swapiItem.detailsTitle)),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: _detailsBloc,
        builder: (context, state) {
          if (state is DetailsStateLoading) {
            return Center(
              child: CustomProgressIndicator(),
            );
          } else if (state is DetailsStateError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is DetailsStateLoaded) {
            return _buildDetailsContent(state.detailedSwapiItem);
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }

  Widget _buildDetailsContent(DetailedSwapiItem item) {
    final items = item.getDetailsList();

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return DetailsListItem(
          item: items[index],
          onPressed: (item) {
            Navigator.of(context).pushNamed(
              DetailsScreen.routeName,
              arguments: DetailsScreen.createArguments(item),
            );
          },
        );
      },
    );
  }
}
