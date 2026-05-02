// ignore: file_names


// ignore_for_file: duplicate_ignore, file_names

class CropRecommendationRequestModel {
  CropRecommendationRequestModel({
    this.nitrogen,
    this.phosphorus,
    this.potassium,
    this.temperature,
    this.humidity,
    this.ph,
    this.rainfall,
  });

  CropRecommendationRequestModel.fromJson(dynamic json) {
    nitrogen = json['nitrogen'];
    phosphorus = json['phosphorus'];
    potassium = json['potassium'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    ph = json['ph'];
    rainfall = json['rainfall'];
  }
  double? nitrogen;
  double? phosphorus;
  double? potassium;
  double? temperature;
  double? humidity;
  double? ph;
  double? rainfall;
  CropRecommendationRequestModel copyWith({
    double? nitrogen,
    double? phosphorus,
    double? potassium,
    double? temperature,
    double? humidity,
    double? ph,
    double? rainfall,
  }) => CropRecommendationRequestModel(
    nitrogen: nitrogen ?? this.nitrogen,
    phosphorus: phosphorus ?? this.phosphorus,
    potassium: potassium ?? this.potassium,
    temperature: temperature ?? this.temperature,
    humidity: humidity ?? this.humidity,
    ph: ph ?? this.ph,
    rainfall: rainfall ?? this.rainfall,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nitrogen'] = nitrogen;
    map['phosphorus'] = phosphorus;
    map['potassium'] = potassium;
    map['temperature'] = temperature;
    map['humidity'] = humidity;
    map['ph'] = ph;
    map['rainfall'] = rainfall;
    return map;
  }
}
