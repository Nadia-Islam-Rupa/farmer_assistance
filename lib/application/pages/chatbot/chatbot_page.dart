// ignore_for_file: deprecated_member_use

import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../../domain/failures/failures.dart';
import '../../../domain/models/chat_models.dart';
import '../../../domain/usecases/chat_use_case.dart';
import 'bloc/chat_bloc.dart';
import 'widgets/conversations_sidebar.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatBloc>(),
      child: const Chatbot(),
    );
  }
}

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'Hello! I\'m your Farm Assistant. How can I help you today?',
      isBot: true,
      timestamp: DateTime.now(),
    ),
  ];

  String? _conversationId;
  final List<ConversationHistoryItem> _conversationHistory = [];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = _messageController.text.trim();

    setState(() {
      _messages.add(
        ChatMessage(text: userMessage, isBot: false, timestamp: DateTime.now()),
      );
    });

    _messageController.clear();
    _scrollToBottom();

    // Send message via BLoC
    context.read<ChatBloc>().add(
      ChatEvent.sendMessage(
        query: userMessage,
        conversationId: _conversationId,
        conversationHistory: _conversationHistory.isNotEmpty
            ? _conversationHistory
            : null,
      ),
    );
  }

  void _startNewChat() {
    setState(() {
      _messages.clear();
      _messages.add(
        ChatMessage(
          text: 'Hello! I\'m your Farm Assistant. How can I help you today?',
          isBot: true,
          timestamp: DateTime.now(),
        ),
      );
      _conversationId = null;
      _conversationHistory.clear();
    });
    context.read<ChatBloc>().add(const ChatEvent.reset());
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _loadConversation(String conversationId) async {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }

    setState(() {
      _conversationId = conversationId;
      _messages.clear();
      _messages.add(
        ChatMessage(
          text: 'Loading conversation...',
          isBot: true,
          timestamp: DateTime.now(),
        ),
      );
      _conversationHistory.clear();
    });

    try {
      final result = await getIt<ChatUseCase>().getConversationHistory(
        conversationId: conversationId,
      );

      result.fold(
        (failure) {
          setState(() {
            _messages.clear();
            _messages.add(
              ChatMessage(
                text:
                    'Failed to load conversation: ${failure is GeneralFailure ? failure.message : "Unknown error"}',
                isBot: true,
                timestamp: DateTime.now(),
                isError: true,
              ),
            );
          });
        },
        (history) {
          setState(() {
            _messages.clear();

            // Convert message pairs to chat messages
            for (final pair in history.pairs) {
              final timestamp =
                  DateTime.tryParse(pair.timestamp) ?? DateTime.now();

              // Add question (user message)
              _messages.add(
                ChatMessage(
                  text: pair.question,
                  isBot: false,
                  timestamp: timestamp,
                ),
              );

              // Add answer (bot message)
              _messages.add(
                ChatMessage(
                  text: pair.answer,
                  isBot: true,
                  timestamp: timestamp,
                ),
              );
            }
          });
          _scrollToBottom();
        },
      );
    } catch (e) {
      setState(() {
        _messages.clear();
        _messages.add(
          ChatMessage(
            text: 'Error loading conversation: ${e.toString()}',
            isBot: true,
            timestamp: DateTime.now(),
            isError: true,
          ),
        );
      });
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: message.isBot
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.isBot) ...[
            CircleAvatar(
              backgroundColor: message.isError
                  ? AppTheme.errorRed
                  : AppTheme.primaryTeal,
              radius: 16,
              child: Icon(
                message.isError ? Icons.error_outline : Icons.smart_toy,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: message.isBot
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: message.isError
                        ? Colors.red.shade50
                        : message.isBot
                        ? Colors.white
                        : AppTheme.primaryTeal,
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: message.isBot
                          ? Radius.zero
                          : const Radius.circular(20),
                      topRight: message.isBot
                          ? const Radius.circular(20)
                          : Radius.zero,
                    ),
                    border: message.isError
                        ? Border.all(color: Colors.red.shade200)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.text,
                        style: TextStyle(
                          color: message.isError
                              ? Colors.red.shade900
                              : message.isBot
                              ? Colors.black87
                              : Colors.white,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTimestamp(message.timestamp),
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          if (!message.isBot) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 16,
              child: Icon(Icons.person, color: Colors.grey[700], size: 18),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppTheme.primaryTeal,
            radius: 16,
            child: Icon(Icons.smart_toy, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              ).copyWith(topLeft: Radius.zero),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Thinking...',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Farm Assistant'),
        backgroundColor: AppTheme.primaryTeal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          tooltip: 'Menu',
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _startNewChat,
            tooltip: 'New conversation',
          ),
        ],
      ),
      drawer: Drawer(
        child: ConversationsSidebar(
          onNewChat: _startNewChat,
          onConversationSelected: _loadConversation,
          currentConversationId: _conversationId,
        ),
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: BlocListener<ChatBloc, ChatState>(
              listener: (context, state) {
                state.when(
                  initial: () {},
                  loading: () {},
                  loaded: (response) {
                    setState(() {
                      // Update conversation ID and history
                      _conversationId = response.conversationId;
                      _conversationHistory.clear();
                      _conversationHistory.addAll(response.conversationHistory);

                      // Add bot response to messages
                      _messages.add(
                        ChatMessage(
                          text: response.answer,
                          isBot: true,
                          timestamp: DateTime.now(),
                        ),
                      );
                    });
                    _scrollToBottom();
                  },
                  error: (errorMessage) {
                    setState(() {
                      // Add error message to UI (only affects current message)
                      _messages.add(
                        ChatMessage(
                          text: errorMessage,
                          isBot: true,
                          timestamp: DateTime.now(),
                          isError: true,
                        ),
                      );
                    });
                    _scrollToBottom();
                  },
                );
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
          ),

          // Loading indicator
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: _buildLoadingIndicator(),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),

          // Input Field
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Ask me anything about farming...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<ChatBloc, ChatState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.hourglass_empty,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          orElse: () => CircleAvatar(
                            backgroundColor: AppTheme.primaryTeal,
                            child: IconButton(
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: _sendMessage,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
