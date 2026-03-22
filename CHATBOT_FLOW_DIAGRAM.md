# 🎯 Clean Architecture & BLoC - Visual Flow Diagram

## Complete Data Flow Visualization

```
┌──────────────────────────────────────────────────────────────────────┐
│                            USER INTERACTION                           │
│  User types: "How to treat powdery mildew?" and hits send button    │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                      PRESENTATION LAYER (UI)                          │
│  📱 chatbot_page.dart                                                │
│                                                                       │
│  • Add user message to _messages list (immediate UI update)          │
│  • Dispatch event to BLoC:                                           │
│    context.read<ChatBloc>().add(                                     │
│      ChatEvent.sendMessage(                                          │
│        query: "How to treat powdery mildew?",                        │
│        conversationId: _conversationId,                              │
│        conversationHistory: _conversationHistory                     │
│      )                                                                │
│    )                                                                  │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                   PRESENTATION LAYER (STATE MGMT)                     │
│  🧠 ChatBloc (chat_bloc.dart)                                        │
│                                                                       │
│  on<_SendMessage>() {                                                │
│    emit(ChatState.loading());  ← UI shows "Thinking..." indicator   │
│    final result = await _chatUseCase.call(...)                       │
│    result.fold(                                                       │
│      (failure) => emit(ChatState.error(message: ...)),               │
│      (response) => emit(ChatState.loaded(response: response))        │
│    )                                                                  │
│  }                                                                    │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                        DOMAIN LAYER (BUSINESS)                        │
│  💼 ChatUseCase (chat_use_case.dart)                                │
│                                                                       │
│  Future<Either<Failures, ChatResponseModel>> call({                  │
│    required String query,                                            │
│    String? conversationId,                                           │
│    List<ConversationHistoryItem>? conversationHistory,               │
│  }) async {                                                           │
│    return await _chatRepository.sendMessage(...);                    │
│  }                                                                    │
│                                                                       │
│  Dependencies: ChatRepository (abstract interface)                   │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                     DOMAIN LAYER (CONTRACT)                          │
│  📜 ChatRepository (chat_repository.dart) - INTERFACE               │
│                                                                       │
│  abstract class ChatRepository {                                     │
│    Future<Either<Failures, ChatResponseModel>> sendMessage({...});  │
│  }                                                                    │
│                                                                       │
│  This is just a contract - implementation is in Data Layer           │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                    DATA LAYER (IMPLEMENTATION)                        │
│  🔧 ChatRepositoryImpl (chat_repository_impl.dart)                   │
│                                                                       │
│  @Injectable(as: ChatRepository)                                     │
│  class ChatRepositoryImpl extends ChatRepository {                   │
│    @override                                                          │
│    Future<Either<Failures, ChatResponseModel>> sendMessage() {       │
│      try {                                                            │
│        final response = await _apiService.sendChatMessage(...);      │
│        return right(response);  ← Success wrapped in Either          │
│      } catch (e) {                                                    │
│        if (e is DioException) {                                       │
│          return left(GeneralFailure(...));  ← Error wrapped          │
│        }                                                              │
│      }                                                                │
│    }                                                                  │
│  }                                                                    │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                      DATA SOURCE (API)                               │
│  🌐 ApiService (api_service.dart.dart)                               │
│                                                                       │
│  Future<ChatResponseModel> sendChatMessage({...}) async {            │
│    final requestData = {                                             │
│      'query': query,                                                 │
│      if (conversationId != null) 'conversation_id': conversationId,  │
│      if (conversationHistory != null) 'conversation_history': [...]  │
│    };                                                                 │
│                                                                       │
│    final response = await dio.post(                                  │
│      '/ai-chat/chat',                                                │
│      data: requestData,                                              │
│    );                                                                 │
│                                                                       │
│    return ChatResponseModel.fromJson(response.data);                 │
│  }                                                                    │
└────────────────────────────┬─────────────────────────────────────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Backend Server  │
                    │  🖥️  FastAPI     │
                    │  Port: 8000      │
                    └─────────────────┘
                             │
                             ▼
                    Response flows back up!
                             │
                             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                        RESPONSE HANDLING                             │
│                                                                       │
│  ApiService parses JSON → ChatResponseModel                          │
│           ↓                                                           │
│  ChatRepositoryImpl wraps in Either (right = success)                │
│           ↓                                                           │
│  ChatUseCase forwards result                                         │
│           ↓                                                           │
│  ChatBloc receives result:                                           │
│    • On success: emit(ChatState.loaded(response))                    │
│    • On error: emit(ChatState.error(message))                        │
│           ↓                                                           │
│  UI (BlocListener) reacts:                                           │
│    • loaded: Add bot message + sources to _messages                  │
│    • error: Add error message to _messages                           │
│    • Auto-scroll to bottom                                           │
└──────────────────────────────────────────────────────────────────────┘
```

---

## 🔄 Conversation State Management

```
Initial State:
  _conversationId = null
  _conversationHistory = []
  _messages = [Welcome message]

After First Message:
  _conversationId = "347b6621-..."  ← From backend response
  _conversationHistory = [
    {role: "user", content: "What is crop rotation?", ...},
    {role: "assistant", content: "Crop rotation is...", ...}
  ]
  _messages = [Welcome, UserMsg1, BotMsg1]

After Second Message:
  _conversationId = "347b6621-..."  ← Same ID
  _conversationHistory = [
    {role: "user", content: "What is crop rotation?", ...},
    {role: "assistant", content: "Crop rotation is...", ...},
    {role: "user", content: "How to start?", ...},
    {role: "assistant", content: "To start...", ...}
  ]
  _messages = [Welcome, UserMsg1, BotMsg1, UserMsg2, BotMsg2]

On Refresh:
  _conversationId = null  ← Reset
  _conversationHistory = []  ← Clear
  _messages = [Welcome message]  ← Fresh start
```

---

## 🎭 BLoC States & UI Mapping

| BLoC State | UI Behavior |
|------------|-------------|
| `ChatState.initial()` | Default state, ready to send |
| `ChatState.loading()` | Show "Thinking..." + Disable send button |
| `ChatState.loaded(response)` | Add bot message to UI + Update conversation context |
| `ChatState.error(message)` | Add red error bubble + Previous messages stay visible |

---

## 🧪 Example Conversation Flow

```
User: "What is crop rotation?"
  ↓ [API Call with query only]
Bot: "Crop rotation is the practice of growing different crops..."
  ↓ [Stores conversation_id: "abc123"]

User: "What are the benefits?"
  ↓ [API Call with query + conversation_id + history]
Bot: "Benefits include improved soil health, pest control..."
  ↓ [Updates conversation_history]

User: "How to implement it?"
  ↓ [API Call with full context]
Bot: "To implement crop rotation, first plan..."

[Network Error]
  ↓
Bot (ERROR): "Failed to connect to server"
  ↓ [Previous messages REMAIN VISIBLE]

User: "How to implement it?" [Retry]
  ↓ [Works now]
Bot: "To implement crop rotation, first plan..."
```

---

## 📦 Dependencies Used

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | BLoC state management |
| `freezed` | Immutable data classes |
| `injectable` | Dependency injection annotations |
| `get_it` | Service locator |
| `dio` | HTTP client |
| `dartz` | Functional programming (Either type) |

---

## 🎓 Clean Architecture Benefits

1. **Testability**: Each layer can be tested independently
2. **Maintainability**: Changes in one layer don't affect others
3. **Scalability**: Easy to add new features following the same pattern
4. **Independence**: Domain layer has no framework dependencies
5. **Flexibility**: Can swap data sources without changing business logic

---

## 🔐 Security

- **Auth Token**: Automatically added by Dio interceptor (from Supabase)
- **Error Messages**: Generic messages to users, detailed logs in console
- **Type Safety**: Compile-time checks prevent runtime errors

---

**Implementation Complete! 🎉**

Your chatbot is production-ready with proper architecture, error handling, and a great user experience.
