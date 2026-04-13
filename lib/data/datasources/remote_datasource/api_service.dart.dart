import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/models/Crop_disease_model.dart';
import 'package:farmer_assistance/domain/models/chat_models.dart';
import 'package:farmer_assistance/domain/models/price_prediction_request_model.dart';
import 'package:farmer_assistance/domain/models/price_prediction_response_model.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_request_model.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/Crop_recommendation_request_model.dart';
import '../../../domain/models/Crop_recommendation_response_model.dart';
import '../../../domain/models/fertilizer_tips_request_model.dart';
import '../../../domain/models/fertilizer_tips_response_model.dart';
import '../../../domain/models/yield_estimation_request_model.dart';
import '../../../domain/models/yield_estimation_response_model.dart';

@injectable
class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<CropDiseaseModel> detectCropDisease(FormData formData) async {
    // final formData = FormData.fromMap({
    //   'image': await MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: imageFile.path.split('/').last,
    //   ),
    // });

    final response = await dio.post(
      '/crop-disease/detect',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to detect crop disease.');
    }

    return CropDiseaseModel.fromJson(response.data);
  }

  Future<ChatResponseModel> sendChatMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  }) async {
    final Map<String, dynamic> requestData = {'query': query};

    if (conversationId != null) {
      requestData['conversation_id'] = conversationId;
    }

    if (conversationHistory != null && conversationHistory.isNotEmpty) {
      requestData['conversation_history'] = conversationHistory
          .map((e) => e.toJson())
          .toList();
    }

    final response = await dio.post(
      '/ai-chat/chat',
      data: requestData,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send chat message.');
    }

    return ChatResponseModel.fromJson(response.data);
  }

  Future<ConversationsListModel> getConversations({int? limit}) async {
    final response = await dio.get(
      '/ai-chat/conversations',
      queryParameters: {'limit': limit ?? 20},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch conversations.');
    }

    return ConversationsListModel.fromJson(response.data);
  }

  Future<ConversationHistoryModel> getConversationHistory({
    required String conversationId,
    int? limit,
  }) async {
    final response = await dio.get(
      '/ai-chat/conversations/$conversationId',
      queryParameters: {'limit': limit ?? 50},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch conversation history.');
    }

    return ConversationHistoryModel.fromJson(response.data);
  }

  Future<void> deleteConversation({required String conversationId}) async {
    final response = await dio.delete(
      '/ai-chat/conversations/$conversationId',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete conversation.');
    }
  }

  Future<SmartIrrigationResponseModel> smartIrrigation({
    required SmartIrrigationRequestModel smartIrrigationRequestData,
  }) async {
    try {
      final response = await dio.post(
        '/smart-irrigation/predict',
        data: smartIrrigationRequestData.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send Request.');
      } else {
        return SmartIrrigationResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Failed to send Request.');
    }
  }

  Future<FertilizerTipsResponseModel> fertilizerTips({
    required FertilizerTipsRequestModel fertilizerTipsRequestData,
  }) async {
    try {
      final response = await dio.post(
        '/fertilizer-tips/predict',
        data: fertilizerTipsRequestData.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send Request.');
      } else {
        return FertilizerTipsResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Failed to send Request.');
    }
  }

  Future<YieldEstimationResponseModel> estimateYield({
    required YieldEstimationRequestModel yieldEstimationRequestData,
  }) async {
    try {
      final response = await dio.post(
        '/yield-estimation/predict',
        data: yieldEstimationRequestData.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send Request.');
      } else {
        return YieldEstimationResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Failed to send Request.');
    }
  }

  Future<CropRecommendationResponseModel> getCropRecommendation({
    required CropRecommendationRequestModel cropRecommendationRequestModel,
  }) async {
    try {
      final response = await dio.post(
        '/crop-recommendation/predict',
        data: cropRecommendationRequestModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to send Request.');
      } else {
        return CropRecommendationResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Failed to send Request.');
    }
  }

  Future<PricePredictionResponseModel> predictPrice({
    required PricePredictionRequestModel pricePredictionRequestData,
  }) async {
    try {
      final response = await dio.post(
        '/price-prediction/predict',
        data: pricePredictionRequestData.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to send Request.');
      } else {
        return PricePredictionResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Failed to send Request.');
    }
  }
}
