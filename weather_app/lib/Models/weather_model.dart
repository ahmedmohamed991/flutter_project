class weatherModel {
  String? date;
  double? temp;
  double? max_Temp;
  double? min_Temp;
  weatherModel(
      {required this.date,
      required this.temp,
      required this.max_Temp,
      required this.min_Temp});
  factory weatherModel.fromjason(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return weatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        max_Temp: jsonData['maxtemp_c'],
        min_Temp: jsonData['mintemp_c']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
