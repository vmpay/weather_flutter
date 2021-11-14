import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_architecture/features/details/weather_details_bloc.dart';
import 'package:weather_flutter_architecture/utils/loading_value.dart';

import 'item_details_model.dart';
import 'view/weather_details_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this._inputDetailsModel, {Key? key}) : super(key: key);
  final InputDetailsModel? _inputDetailsModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late WeatherDetailsBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of(context);
    _bloc.fetchWeatherDetails(widget._inputDetailsModel);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _bloc.weatherDetails,
        builder: (context,
            AsyncSnapshot<Future<LoadingValue<ItemDetailsModel>>> snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: snapshot.data,
              builder: (context,
                  AsyncSnapshot<LoadingValue<ItemDetailsModel>> itemSnapShot) {
                if (itemSnapShot.hasData) {
                  if (itemSnapShot.requireData.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (itemSnapShot.requireData.value != null) {
                      return WeatherDetailsWidget(
                          itemSnapShot.requireData.value!);
                    } else {
                      return const Center(
                        child: Text(
                          'List is empty',
                          style: TextStyle(color: Colors.blue),
                        ),
                      );
                    }
                  }
                } else if (itemSnapShot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.blue),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.blue),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
