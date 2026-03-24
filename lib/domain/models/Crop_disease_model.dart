/// label : "Pepper__bell___Bacterial_spot"
/// confidence : 82.48
/// heatmap_url : "https://rdqpssnvyywzjiqrokfv.supabase.co/storage/v1/object/public/crop_disease/gradcam_e27d27521ae04e40a7db2d0709ba0832.png"

// ignore_for_file: file_names, dangling_library_doc_comments

class CropDiseaseModel {
  CropDiseaseModel({this.label, this.confidence, this.heatmapUrl});

  CropDiseaseModel.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    confidence = json['confidence'];
    heatmapUrl = json['heatmap_url'];
  }
  String? label;
  double? confidence;
  String? heatmapUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['confidence'] = confidence;
    map['heatmap_url'] = heatmapUrl;
    return map;
  }

  @override
  toString() {
    return 'CropDiseaseModel(label: $label, confidence: $confidence, heatmapUrl: $heatmapUrl)';
  }
}
