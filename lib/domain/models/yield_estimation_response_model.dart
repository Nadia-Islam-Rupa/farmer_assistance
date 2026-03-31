/// predicted_yield : 5.2
/// yield_unit : "t/ha"
/// item : "Maize"
/// area : "Brazil"
/// confidence : 0.95
/// feature_importance : {"additionalProp1":{}}

class YieldEstimationResponseModel {
  YieldEstimationResponseModel({
      double? predictedYield, 
      String? yieldUnit, 
      String? item, 
      String? area, 
      double? confidence, 
      FeatureImportance? featureImportance,}){
    _predictedYield = predictedYield;
    _yieldUnit = yieldUnit;
    _item = item;
    _area = area;
    _confidence = confidence;
    _featureImportance = featureImportance;
}

  YieldEstimationResponseModel.fromJson(dynamic json) {
    _predictedYield = json['predicted_yield'];
    _yieldUnit = json['yield_unit'];
    _item = json['item'];
    _area = json['area'];
    _confidence = json['confidence'];
    _featureImportance = json['feature_importance'] != null ? FeatureImportance.fromJson(json['feature_importance']) : null;
  }
  double? _predictedYield;
  String? _yieldUnit;
  String? _item;
  String? _area;
  double? _confidence;
  FeatureImportance? _featureImportance;

  double? get predictedYield => _predictedYield;
  String? get yieldUnit => _yieldUnit;
  String? get item => _item;
  String? get area => _area;
  double? get confidence => _confidence;
  FeatureImportance? get featureImportance => _featureImportance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['predicted_yield'] = _predictedYield;
    map['yield_unit'] = _yieldUnit;
    map['item'] = _item;
    map['area'] = _area;
    map['confidence'] = _confidence;
    if (_featureImportance != null) {
      map['feature_importance'] = _featureImportance?.toJson();
    }
    return map;
  }

}

/// additionalProp1 : {}
class FeatureImportance {
  final Map<String, double> features;

  FeatureImportance({required this.features});

  factory FeatureImportance.fromJson(Map<String, dynamic> json) {
    return FeatureImportance(
      features: json.map(
            (key, value) => MapEntry(
          key,
          (value is num) ? value.toDouble() : 0.0,
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return features;
  }
}