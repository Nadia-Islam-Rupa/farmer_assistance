/// crop : "Jute"
/// confidence : 0.95

class CropRecommendationResponseModel {
  CropRecommendationResponseModel({
      this.crop, 
      this.confidence,});

  CropRecommendationResponseModel.fromJson(dynamic json) {
    crop = json['crop'];
    confidence = json['confidence'];
  }
  String? crop;
  double? confidence;
CropRecommendationResponseModel copyWith({  String? crop,
  double? confidence,
}) => CropRecommendationResponseModel(  crop: crop ?? this.crop,
  confidence: confidence ?? this.confidence,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop'] = crop;
    map['confidence'] = confidence;
    return map;
  }

}