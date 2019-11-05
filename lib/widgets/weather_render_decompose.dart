import 'package:flutter/material.dart';
import 'package:lesson_4/models/weather_parse_model.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  final WeatherParse weather;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return RenderLandscape(weather: weather);
        } else {
          return RenderPortrait(weather: weather);
        }
      },
    );
  }
}

class RenderPortrait extends StatelessWidget {
  const RenderPortrait({@required this.weather});

  final dynamic weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${weather.city} : ${weather.temperature} °C',
          style: Theme.of(context).textTheme.display1,
          textAlign: TextAlign.center,
        ),
        Image.network(weather.iconUrl),
      ],
    );
  }
}

class RenderLandscape extends StatelessWidget {
  const RenderLandscape({@required this.weather});

  final dynamic weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${weather.city}',
                  style: Theme.of(context).textTheme.display1),
              Text('${weather.temperature} °C',
                  style: Theme.of(context).textTheme.display1)
            ],
          ),
        ),
        Image.network(weather.iconUrl),
      ],
    );
  }
}
