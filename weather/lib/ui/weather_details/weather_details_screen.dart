import 'package:flutter/material.dart';
import 'weather_details_bloc.dart';
import 'package:weather/ui/weather_details/weather_data_view_model.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final WeatherDetailsBloc bloc;

  const WeatherDetailsScreen(this.bloc, { Key key }) : super(key: key);

  @override
  _WeatherDetailsScreenState createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  WeatherDetailsBloc get _bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bloc.cityName),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () {
              _bloc.refresh();
            },
          ),
        ],
      ),
      body: _createBody(context),
    );
  }

  @override
  void initState() {
    _bloc.refresh();

    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  Widget _createBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _weatherDataWidget(),
        _errorWidget(),
        _progressWidget(),
      ],
    );
  }

  Widget _weatherDataWidget() {
    return StreamBuilder<WeatherDataViewModel>(
        stream: _bloc.weatherData,
        builder: (BuildContext context, AsyncSnapshot<WeatherDataViewModel> snapshot) {
          if (snapshot.connectionState != ConnectionState.active || snapshot.data == null) {
            return Container();
          }

          final viewModel = snapshot.data;

          return Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  viewModel.iconURL,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Text(viewModel.temperature),
                    Text(viewModel.pressure),
                    Text(viewModel.humidity),
                    Text(viewModel.description),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          );
        }
    );
  }


  Widget _progressWidget() {
    return StreamBuilder<bool>(
        stream: _bloc.showLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState != ConnectionState.active || snapshot.data == false) {
            return Container();
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  Widget _errorWidget() {
    return StreamBuilder<String>(
        stream: _bloc.errorMessage,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState != ConnectionState.active ||
              snapshot.data == null) {
            return Container();
          }

          return Center(
            child: Text(snapshot.data),
          );
        }
    );
  }
}