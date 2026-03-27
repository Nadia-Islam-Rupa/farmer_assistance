/// crop : "Wheat"
/// soil_color : "Red"
/// temperature : 25.0
/// nitrogen : 80
/// potassium : 40
/// phosphorus : 40
/// rainfall : 100.0
/// ph : 6.5

class FertilizerTipsRequestModel {
  FertilizerTipsRequestModel({
      String? crop, 
      String? soilColor, 
      double? temperature, 
      double? nitrogen,
      double? potassium,
      double? phosphorus,
      double? rainfall, 
      double? ph,}){
    _crop = crop;
    _soilColor = soilColor;
    _temperature = temperature;
    _nitrogen = nitrogen;
    _potassium = potassium;
    _phosphorus = phosphorus;
    _rainfall = rainfall;
    _ph = ph;
}

  FertilizerTipsRequestModel.fromJson(dynamic json) {
    _crop = json['crop'];
    _soilColor = json['soil_color'];
    _temperature = json['temperature'];
    _nitrogen = json['nitrogen'];
    _potassium = json['potassium'];
    _phosphorus = json['phosphorus'];
    _rainfall = json['rainfall'];
    _ph = json['ph'];
  }
  String? _crop;
  String? _soilColor;
  double? _temperature;
  double? _nitrogen;
  double? _potassium;
  double? _phosphorus;
  double? _rainfall;
  double? _ph;

  String? get crop => _crop;
  String? get soilColor => _soilColor;
  double? get temperature => _temperature;
  double? get nitrogen => _nitrogen;
  double? get potassium => _potassium;
  double? get phosphorus => _phosphorus;
  double? get rainfall => _rainfall;
  double? get ph => _ph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop'] = _crop;
    map['soil_color'] = _soilColor;
    map['temperature'] = _temperature;
    map['nitrogen'] = _nitrogen;
    map['potassium'] = _potassium;
    map['phosphorus'] = _phosphorus;
    map['rainfall'] = _rainfall;
    map['ph'] = _ph;
    return map;
  }

}