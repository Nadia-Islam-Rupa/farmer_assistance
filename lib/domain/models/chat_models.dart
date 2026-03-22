/// Source model for chat response
class Source {
  final String content;

  Source({required this.content});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(content: json['content'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'content': content};
  }
}

/// Conversation history item model
class ConversationHistoryItem {
  final String role;
  final String content;
  final String timestamp;

  ConversationHistoryItem({
    required this.role,
    required this.content,
    required this.timestamp,
  });

  factory ConversationHistoryItem.fromJson(Map<String, dynamic> json) {
    return ConversationHistoryItem(
      role: json['role'] as String,
      content: json['content'] as String,
      timestamp: json['timestamp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'role': role, 'content': content, 'timestamp': timestamp};
  }
}

/// Chat response model from API
class ChatResponseModel {
  final String answer;
  final List<Source> sources;
  final String conversationId;
  final List<ConversationHistoryItem> conversationHistory;
  final String? conversationTitle;

  ChatResponseModel({
    required this.answer,
    required this.sources,
    required this.conversationId,
    required this.conversationHistory,
    this.conversationTitle,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      answer: json['answer'] as String,
      sources:
          (json['sources'] as List<dynamic>?)
              ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      conversationId: json['conversation_id'] as String,
      conversationHistory:
          (json['conversation_history'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ConversationHistoryItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      conversationTitle: json['conversation_title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'sources': sources.map((e) => e.toJson()).toList(),
      'conversation_id': conversationId,
      'conversation_history': conversationHistory
          .map((e) => e.toJson())
          .toList(),
      if (conversationTitle != null) 'conversation_title': conversationTitle,
    };
  }
}

/// Chat message model for UI
class ChatMessage {
  final String text;
  final bool isBot;
  final DateTime timestamp;
  final bool isError;
  final List<Source>? sources;

  ChatMessage({
    required this.text,
    required this.isBot,
    required this.timestamp,
    this.isError = false,
    this.sources,
  });
}
