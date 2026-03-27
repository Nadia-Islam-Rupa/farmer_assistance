/// irrigation_needed : true
/// recommendation : "💧 Irrigation Needed"
/// confidence : 0.95
/// feature_importance : {"additionalProp1":{}}

class SmartIrrigationResponseModel {
  SmartIrrigationResponseModel({
      bool? irrigationNeeded, 
      String? recommendation, 
      double? confidence, 
      FeatureImportance? featureImportance,}){
    _irrigationNeeded = irrigationNeeded;
    _recommendation = recommendation;
    _confidence = confidence;
    _featureImportance = featureImportance;
}

  SmartIrrigationResponseModel.fromJson(dynamic json) {
    _irrigationNeeded = json['irrigation_needed'];
    _recommendation = json['recommendation'];
    _confidence = json['confidence'];
    _featureImportance = json['feature_importance'] != null ? FeatureImportance.fromJson(json['feature_importance']) : null;
  }
  bool? _irrigationNeeded;
  String? _recommendation;
  double? _confidence;
  FeatureImportance? _featureImportance;

  bool? get irrigationNeeded => _irrigationNeeded;
  String? get recommendation => _recommendation;
  double? get confidence => _confidence;
  FeatureImportance? get featureImportance => _featureImportance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['irrigation_needed'] = _irrigationNeeded;
    map['recommendation'] = _recommendation;
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