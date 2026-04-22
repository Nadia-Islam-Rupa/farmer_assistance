part of 'history_cubit.dart';

abstract class HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<Map<String, dynamic>> fertilizerTips;
  final List<Map<String, dynamic>> smartIrrigation;
  final List<Map<String, dynamic>> yieldEstimations;
  final List<Map<String, dynamic>> cropRecommendations;
  final List<Map<String, dynamic>> pricePredictions;
  final List<Map<String, dynamic>> cropDiseaseResults;

  HistoryLoaded({
    required this.fertilizerTips,
    required this.smartIrrigation,
    required this.yieldEstimations,
    required this.cropRecommendations,
    required this.pricePredictions,
    required this.cropDiseaseResults,
  });
}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}
