class ItemDetailsModel {
  ItemDetailsModel(this.city, this.country, this.temp, this.icon, this.date,
      this.daily, this.additionalInfo);

  final String city;
  final String country;
  final double temp;
  final String icon;
  final String date;
  final List<DailyForecast> daily;
  final List<AdditionalInfo> additionalInfo;
}

class DailyForecast {
  DailyForecast(this.day, this.icon, this.temp);

  final String day;
  final String icon;
  final double temp;
}

class AdditionalInfo {
  AdditionalInfo(this.date, this.key, this.value);

  final String date;
  final String key;
  final String value;
}
