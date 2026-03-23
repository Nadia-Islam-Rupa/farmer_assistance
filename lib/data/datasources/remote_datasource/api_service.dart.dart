import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/models/Crop_disease_model.dart';
import 'package:farmer_assistance/domain/models/chat_models.dart';
import 'package:injectable/injectable.dart';

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
}
