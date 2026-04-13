class PricePredictionRequestModel {
  PricePredictionRequestModel({
    String? admin1,
    String? admin2,
    String? market,
    double? latitude,
    double? longitude,
    String? category,
    String? commodity,
    String? unit,
    String? pricetype,
    String? priceflag,
    String? date,
  }) {
    _admin1 = admin1;
    _admin2 = admin2;
    _market = market;
    _latitude = latitude;
    _longitude = longitude;
    _category = category;
    _commodity = commodity;
    _unit = unit;
    _pricetype = pricetype;
    _priceflag = priceflag;
    _date = date;
  }

  PricePredictionRequestModel.fromJson(dynamic json) {
    _admin1 = json['admin1'];
    _admin2 = json['admin2'];
    _market = json['market'];
    _latitude = json['latitude']?.toDouble();
    _longitude = json['longitude']?.toDouble();
    _category = json['category'];
    _commodity = json['commodity'];
    _unit = json['unit'];
    _pricetype = json['pricetype'];
    _priceflag = json['priceflag'];
    _date = json['date'];
  }

  String? _admin1;
  String? _admin2;
  String? _market;
  double? _latitude;
  double? _longitude;
  String? _category;
  String? _commodity;
  String? _unit;
  String? _pricetype;
  String? _priceflag;
  String? _date;

  String? get admin1 => _admin1;
  String? get admin2 => _admin2;
  String? get market => _market;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get category => _category;
  String? get commodity => _commodity;
  String? get unit => _unit;
  String? get pricetype => _pricetype;
  String? get priceflag => _priceflag;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin1'] = _admin1;
    map['admin2'] = _admin2;
    map['market'] = _market;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['category'] = _category;
    map['commodity'] = _commodity;
    map['unit'] = _unit;
    map['pricetype'] = _pricetype;
    map['priceflag'] = _priceflag;
    map['date'] = _date;
    return map;
  }
}
