class PricePredictionResponseModel {
  PricePredictionResponseModel({
    double? predictedPrice,
    String? commodity,
    String? unit,
    String? market,
    String? pricetype,
    String? currency,
    double? confidence,
  }) {
    _predictedPrice = predictedPrice;
    _commodity = commodity;
    _unit = unit;
    _market = market;
    _pricetype = pricetype;
    _currency = currency;
    _confidence = confidence;
  }

  PricePredictionResponseModel.fromJson(dynamic json) {
    _predictedPrice = json['predicted_price']?.toDouble();
    _commodity = json['commodity'];
    _unit = json['unit'];
    _market = json['market'];
    _pricetype = json['pricetype'];
    _currency = json['currency'];
    _confidence = json['confidence']?.toDouble();
  }

  double? _predictedPrice;
  String? _commodity;
  String? _unit;
  String? _market;
  String? _pricetype;
  String? _currency;
  double? _confidence;

  double? get predictedPrice => _predictedPrice;
  String? get commodity => _commodity;
  String? get unit => _unit;
  String? get market => _market;
  String? get pricetype => _pricetype;
  String? get currency => _currency;
  double? get confidence => _confidence;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['predicted_price'] = _predictedPrice;
    map['commodity'] = _commodity;
    map['unit'] = _unit;
    map['market'] = _market;
    map['pricetype'] = _pricetype;
    map['currency'] = _currency;
    map['confidence'] = _confidence;
    return map;
  }
}
