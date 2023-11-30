class Weather {
  String? cityName;
  String? date;
  String? temperature;
  String? humidity;
  String? climate;
  String? windDirection;
  String? hurricane;
  Icons? icons;

  Weather(
      {this.cityName,
        this.date,
        this.temperature,
        this.humidity,
        this.climate,
        this.windDirection,
        this.hurricane,
        this.icons});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    date = json['date'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    climate = json['climate'];
    windDirection = json['wind_direction'];
    hurricane = json['hurricane'];
    icons = json['icons'] != null ? Icons.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_name'] = cityName;
    data['date'] = date;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['climate'] = climate;
    data['wind_direction'] = windDirection;
    data['hurricane'] = hurricane;
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    return data;
  }
}

class Icons {
  String? day;
  String? night;

  Icons({this.day, this.night});

  Icons.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    return data;
  }
}
