/// fertilizer : "Urea"
/// confidence : 0.95
/// feature_importance : {"additionalProp1":{}}

class FertilizerTipsResponseModel {
  FertilizerTipsResponseModel({
      String? fertilizer, 
      double? confidence, 
      FeatureImportance? featureImportance,}){
    _fertilizer = fertilizer;
    _confidence = confidence;
    _featureImportance = featureImportance;
}

  FertilizerTipsResponseModel.fromJson(dynamic json) {
    _fertilizer = json['fertilizer'];
    _confidence = json['confidence'];
    _featureImportance = json['feature_importance'] != null ? FeatureImportance.fromJson(json['feature_importance']) : null;
  }
  String? _fertilizer;
  double? _confidence;
  FeatureImportance? _featureImportance;

  String? get fertilizer => _fertilizer;
  double? get confidence => _confidence;
  FeatureImportance? get featureImportance => _featureImportance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fertilizer'] = _fertilizer;
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