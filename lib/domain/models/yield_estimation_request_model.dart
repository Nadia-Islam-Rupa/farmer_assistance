/// item : "Maize"
/// area : "Brazil"
/// rainfall : 1300
/// temperature : 28.5
/// pesticides : 1800

class YieldEstimationRequestModel {
  YieldEstimationRequestModel({
      String? item, 
      String? area, 
      double? rainfall,
      double? temperature, 
      double? pesticides,}){
    _item = item;
    _area = area;
    _rainfall = rainfall;
    _temperature = temperature;
    _pesticides = pesticides;
}

  YieldEstimationRequestModel.fromJson(dynamic json) {
    _item = json['item'];
    _area = json['area'];
    _rainfall = json['rainfall'];
    _temperature = json['temperature'];
    _pesticides = json['pesticides'];
  }
  String? _item;
  String? _area;
  double? _rainfall;
  double? _temperature;
  double? _pesticides;

  String? get item => _item;
  String? get area => _area;
  double? get rainfall => _rainfall;
  double? get temperature => _temperature;
  double? get pesticides => _pesticides;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item'] = _item;
    map['area'] = _area;
    map['rainfall'] = _rainfall;
    map['temperature'] = _temperature;
    map['pesticides'] = _pesticides;
    return map;
  }

}