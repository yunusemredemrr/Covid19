class Country {
  late final int? id;
  late final String? country;

  Country({
    required this.country,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country'] = country;
    return map;
  }

  Country.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    country = map['country'];
  }
}
