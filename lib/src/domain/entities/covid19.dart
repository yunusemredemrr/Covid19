class Covid19 {
  String? country;
  String? countryCode;
  String? province;
  String? city;
  String? cityCode;
  String? lat;
  String? lon;
  int? cases;
  String? status;
  String? date;

  Covid19(
      {country,
      countryCode,
      province,
      city,
      cityCode,
      lat,
      lon,
      cases,
      status,
      date});

  Covid19.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    province = json['Province'];
    city = json['City'];
    cityCode = json['CityCode'];
    lat = json['Lat'];
    lon = json['Lon'];
    cases = json['Cases'];
    status = json['Status'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Province'] = province;
    data['City'] = city;
    data['CityCode'] = cityCode;
    data['Lat'] = lat;
    data['Lon'] = lon;
    data['Cases'] = cases;
    data['Status'] = status;
    data['Date'] = date;
    return data;
  }
}
