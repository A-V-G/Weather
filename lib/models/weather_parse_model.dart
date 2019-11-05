class WeatherParse {
  WeatherParse(this.temperature, this.city, this.iconUrl);

  final int temperature;
  final String city;
  final String iconUrl;

  WeatherParse.fromJson(Map<String, dynamic> json)
      : temperature = json['main']['temp'],
        city = json['name'],
        iconUrl = _generateIconUrl(json['weather'][0]['icon']);

  static String _generateIconUrl(String icon) {
    return 'https://openweathermap.org/img/wn/$icon@2x.png';
  }
}