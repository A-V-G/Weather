import 'package:flutter/material.dart';
import 'package:lesson_4/models/weather_parse_model.dart';


class WeatherContainer extends StatelessWidget {
  final WeatherParse weather;

  WeatherContainer({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${weather.city} : ${weather.temperature} °C',
                style: Theme.of(context).textTheme.display1,
                textAlign: TextAlign.center,
              ),
              Image.network(weather.iconUrl),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${weather.city}',
                    style: Theme.of(context).textTheme.display1
                  ),
                  Text(
                    '${weather.temperature} °C',
                    style: Theme.of(context).textTheme.display1
                  )
                ],
              ),
              ),
              Image.network(weather.iconUrl),
            ],
          );
        }
      },
    );
  }
}