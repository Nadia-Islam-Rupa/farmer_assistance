/// crop_id : 1
/// soil_type : 0
/// seedling_stage : 2
/// moi : 40
/// temp : 30
/// humidity : 60

class SmartIrrigationRequestModel {
  SmartIrrigationRequestModel({
      String? cropId,
      String? soilType,
      String? seedlingStage,
      double? moi,
      double? temp,
      double? humidity,}){
    _cropId = cropId;
    _soilType = soilType;
    _seedlingStage = seedlingStage;
    _moi = moi;
    _temp = temp;
    _humidity = humidity;
}

  SmartIrrigationRequestModel.fromJson(dynamic json) {
    _cropId = json['crop_id'];
    _soilType = json['soil_type'];
    _seedlingStage = json['seedling_stage'];
    _moi = json['moi'];
    _temp = json['temp'];
    _humidity = json['humidity'];
  }
  String? _cropId;
  String? _soilType;
  String? _seedlingStage;
  double? _moi;
  double? _temp;
  double? _humidity;

  String? get cropId => _cropId;
  String? get soilType => _soilType;
  String? get seedlingStage => _seedlingStage;
  double? get moi => _moi;
  double? get temp => _temp;
  double? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop_id'] = _cropId;
    map['soil_type'] = _soilType;
    map['seedling_stage'] = _seedlingStage;
    map['moi'] = _moi;
    map['temp'] = _temp;
    map['humidity'] = _humidity;
    return map;
  }

}