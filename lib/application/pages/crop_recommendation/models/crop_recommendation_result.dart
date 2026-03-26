class CropRecommendationResult {
  final String cropName;
  final double confidence;
  final List<String> tips;
  final Map<String, dynamic> inputData;

  CropRecommendationResult({
    required this.cropName,
    required this.confidence,
    required this.tips,
    required this.inputData,
  });

  factory CropRecommendationResult.fromJson(Map<String, dynamic> json) {
    return CropRecommendationResult(
      cropName: json['crop_name'] as String,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
      tips:
          (json['tips'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
          [],
      inputData: json['input_data'] as Map<String, dynamic>? ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'crop_name': cropName,
      'confidence': confidence,
      'tips': tips,
      'input_data': inputData,
    };
  }
}
