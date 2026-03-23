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

/// Conversation item model
class ConversationItem {
  final String conversationId;
  final String title;
  final String firstQuestion;
  final DateTime lastActivity;
  final int messageCount;

  ConversationItem({
    required this.conversationId,
    required this.title,
    required this.firstQuestion,
    required this.lastActivity,
    required this.messageCount,
  });

  factory ConversationItem.fromJson(Map<String, dynamic> json) {
    return ConversationItem(
      conversationId: json['conversation_id'] as String,
      title: json['title'] as String,
      firstQuestion: json['first_question'] as String,
      lastActivity: DateTime.parse(json['last_activity'] as String),
      messageCount: json['message_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'title': title,
      'first_question': firstQuestion,
      'last_activity': lastActivity.toIso8601String(),
      'message_count': messageCount,
    };
  }
}

/// Conversations list response model
class ConversationsListModel {
  final String userId;
  final List<ConversationItem> conversations;

  ConversationsListModel({required this.userId, required this.conversations});

  factory ConversationsListModel.fromJson(Map<String, dynamic> json) {
    return ConversationsListModel(
      userId: json['user_id'] as String,
      conversations:
          (json['conversations'] as List<dynamic>?)
              ?.map((e) => ConversationItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'conversations': conversations.map((e) => e.toJson()).toList(),
    };
  }
}

/// Message pair model for conversation history
class MessagePair {
  final String question;
  final String answer;
  final String timestamp;

  MessagePair({
    required this.question,
    required this.answer,
    required this.timestamp,
  });

  factory MessagePair.fromJson(Map<String, dynamic> json) {
    return MessagePair(
      question: json['question'] as String,
      answer: json['answer'] as String,
      timestamp: json['timestamp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'question': question, 'answer': answer, 'timestamp': timestamp};
  }
}

/// Conversation history detail model
class ConversationHistoryModel {
  final String conversationId;
  final List<MessagePair> pairs;
  final int totalMessages;

  ConversationHistoryModel({
    required this.conversationId,
    required this.pairs,
    required this.totalMessages,
  });

  factory ConversationHistoryModel.fromJson(Map<String, dynamic> json) {
    return ConversationHistoryModel(
      conversationId: json['conversation_id'] as String,
      pairs:
          (json['pairs'] as List<dynamic>?)
              ?.map((e) => MessagePair.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalMessages: json['total_messages'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'pairs': pairs.map((e) => e.toJson()).toList(),
      'total_messages': totalMessages,
    };
  }
}
