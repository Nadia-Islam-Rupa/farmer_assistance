# Chatbot Implementation - Clean Architecture with BLoC

## Overview
This document explains the complete backend integration for the chatbot feature using **Clean Architecture** and **BLoC pattern**.

---

## Architecture Layers

### 🏗️ 1. Domain Layer (Business Logic)
**Location**: `lib/domain/`

This layer contains the core business logic and is independent of any framework or external dependencies.

#### Models (`domain/models/chat_models.dart`)
- **`Source`**: Represents reference sources from AI responses
- **`ConversationHistoryItem`**: Individual conversation history entry (role, content, timestamp)
- **`ChatResponseModel`**: Complete API response (answer, sources, conversation_id, conversation_history, conversation_title)
- **`ChatMessage`**: UI-specific model for displaying messages

#### Repository Interface (`domain/repositories/chat_repository.dart`)
```dart
abstract class ChatRepository {
  Future<Either<Failures, ChatResponseModel>> sendMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  });
}
```
- Defines the contract for chat operations
- Returns `Either<Failures, ChatResponseModel>` for functional error handling using `dartz` package

#### Use Case (`domain/usecases/chat_use_case.dart`)
```dart
@injectable
class ChatUseCase {
  final ChatRepository _chatRepository;

  Future<Either<Failures, ChatResponseModel>> call({...}) async {
    return await _chatRepository.sendMessage(...);
  }
}
```
- Encapsulates business logic for sending chat messages
- Delegates to repository
- Annotated with `@injectable` for dependency injection

---

### 💾 2. Data Layer (Implementation)
**Location**: `lib/data/`

This layer handles external data sources and implements domain contracts.

#### API Service (`data/datasources/remote_datasource/api_service.dart.dart`)
```dart
@injectable
class ApiService {
  final Dio dio;

  Future<ChatResponseModel> sendChatMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  }) async {
    final requestData = {
      'query': query,
      if (conversationId != null) 'conversation_id': conversationId,
      if (conversationHistory != null) 'conversation_history': conversationHistory,
    };

    final response = await dio.post('/ai-chat/chat', data: requestData);
    return ChatResponseModel.fromJson(response.data);
  }
}
```

**API Request Flow**:
1. **First message**: Sends only `query`
2. **Subsequent messages**: Sends `query` + `conversation_id` + `conversation_history`

#### Repository Implementation (`data/repositories/chat_repository_impl.dart`)
```dart
@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ApiService _apiService;

  @override
  Future<Either<Failures, ChatResponseModel>> sendMessage({...}) async {
    try {
      final response = await _apiService.sendChatMessage(...);
      return right(response);  // Success
    } catch (e) {
      if (e is DioException) {
        return left(GeneralFailure(handleDioError(e)));  // Error
      }
      return left(GeneralFailure("Unexpected error occurred."));
    }
  }
}
```
- Implements `ChatRepository` interface
- Handles error mapping (Dio errors → domain Failures)
- Uses functional error handling pattern

---

### 🎨 3. Presentation Layer (UI + State Management)
**Location**: `lib/application/pages/chatbot/`

#### BLoC Pattern Implementation

##### Events (`bloc/chat_event.dart`)
```dart
@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  }) = _SendMessage;

  const factory ChatEvent.reset() = _Reset;
}
```

##### States (`bloc/chat_state.dart`)
```dart
@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.loaded({required ChatResponseModel response}) = _Loaded;
  const factory ChatState.error({required String message}) = _Error;
}
```

##### BLoC (`bloc/chat_bloc.dart`)
```dart
@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase _chatUseCase;

  ChatBloc(this._chatUseCase) : super(const ChatState.initial()) {
    on<_SendMessage>(_onSendMessage);
    on<_Reset>(_onReset);
  }

  Future<void> _onSendMessage(_SendMessage event, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    final result = await _chatUseCase(...);
    result.fold(
      (failure) => emit(ChatState.error(...)),
      (response) => emit(ChatState.loaded(response: response)),
    );
  }
}
```

#### UI (`chatbot_page.dart`)
**Key Features**:
- ✅ **ChatGPT/Claude-style conversation**: All previous messages remain visible
- ✅ **Error handling**: Only the failed message shows error, rest remain intact
- ✅ **Real-time updates**: Loading indicator while waiting for response
- ✅ **Sources display**: Shows reference sources with each bot response
- ✅ **Conversation persistence**: Maintains conversation_id and history
- ✅ **New conversation**: Reset button to clear and start fresh

**State Management Flow**:
1. User types message → Add to UI immediately
2. Trigger `ChatEvent.sendMessage` with conversation context
3. BLoC emits `loading` state → Show "Thinking..." indicator
4. API responds → BLoC emits `loaded` or `error`
5. **On success**: Add bot response with sources to UI
6. **On error**: Add error message only for current prompt, previous messages stay visible

---

## 🔌 Dependency Injection
**Location**: `lib/di/`

Using **GetIt** + **Injectable** for automatic dependency injection:

```dart
// DI Registration (auto-generated)
ChatRepository → ChatRepositoryImpl(ApiService)
ChatUseCase → ChatUseCase(ChatRepository)
ChatBloc → ChatBloc(ChatUseCase)
```

**Setup** (`di/register_module.dart`):
- Configures Dio with base URL (`http://192.168.0.105:8000`)
- Adds Supabase auth interceptor for bearer token
- Adds pretty logger for debugging

---

## 📡 API Integration

### Endpoint
```
POST http://localhost:8000/ai-chat/chat
```

### Request Format

**First Message**:
```json
{
  "query": "How can I treat powdery mildew in cucumber?"
}
```

**Subsequent Messages**:
```json
{
  "query": "How can I treat powdery mildew in cucumber?",
  "conversation_id": "4271568b-49e3-4693-880f-6f1279b45354",
  "conversation_history": [
    {
      "role": "user",
      "content": "What is crop rotation?",
      "timestamp": "2024-03-22T10:30:00Z"
    }
  ]
}
```

### Response Format
```json
{
  "answer": "Use sulfur-based fungicide and improve airflow around plants.",
  "sources": [
    {
      "content": "Powdery mildew appears as white powder on leaves."
    }
  ],
  "conversation_id": "347b6621-c66e-4fa0-a028-3e2a88448c25",
  "conversation_history": [
    {
      "role": "user",
      "content": "What is crop rotation?",
      "timestamp": "2024-03-22T10:30:00Z"
    }
  ],
  "conversation_title": "Tomato Disease Treatment"
}
```

---

## 🎯 Data Flow (Step-by-Step)

### User Sends Message:
```
1. UI (chatbot_page.dart)
   └─> User types message
   └─> Add message to _messages list (UI update)
   └─> Dispatch ChatEvent.sendMessage()

2. BLoC (chat_bloc.dart)
   └─> Emit loading state
   └─> Call ChatUseCase

3. Use Case (chat_use_case.dart)
   └─> Call ChatRepository.sendMessage()

4. Repository (chat_repository_impl.dart)
   └─> Call ApiService.sendChatMessage()
   └─> Wraps result in Either<Failures, ChatResponseModel>

5. API Service (api_service.dart.dart)
   └─> Build request JSON (query, conversation_id, conversation_history)
   └─> POST to /ai-chat/chat via Dio
   └─> Parse response to ChatResponseModel

6. Response flows back:
   └─> ApiService → Repository → Use Case → BLoC
   └─> BLoC emits loaded or error state

7. UI (BlocListener)
   └─> On loaded: Add bot response to _messages, update conversation_id
   └─> On error: Add error message to _messages
   └─> Auto-scroll to bottom
```

---

## 🚀 Key Features Implemented

### ✅ ChatGPT/Claude-Style UX
- **Persistent conversation**: All messages remain visible
- **Error handling**: Only current prompt shows error, previous Q&A intact
- **Loading states**: "Thinking..." indicator while processing
- **Timestamps**: Shows relative time (Just now, 5m ago, etc.)
- **Sources display**: Expandable sources section for each response
- **Avatars**: Bot (robot icon) vs User (person icon)
- **Refresh button**: Start new conversation

### ✅ Conversation Management
- Maintains `conversation_id` across messages
- Builds `conversation_history` array automatically
- Sends complete context to backend for each follow-up

### ✅ Error Resilience
- Network errors caught and displayed
- Timeout handling via Dio
- Parse errors handled gracefully
- All previous messages preserved on error

---

## 🧪 Testing the Implementation

### Prerequisites
1. Ensure backend is running at `http://192.168.0.105:8000`
2. Update base URL in `lib/di/register_module.dart` if needed

### Test Flow
1. **First message**:
   - Type: "What is crop rotation?"
   - Verify API receives only `{query: "..."}`
   - Check bot response appears

2. **Follow-up message**:
   - Type: "How can I treat powdery mildew?"
   - Verify API receives `query + conversation_id + conversation_history`
   - Check bot response appears with sources

3. **Error handling**:
   - Turn off backend or use invalid URL
   - Send message
   - Verify error shows only for new message
   - Previous messages remain visible

4. **New conversation**:
   - Tap refresh icon
   - Verify conversation resets
   - conversation_id becomes null

---

## 📂 File Structure

```
lib/
├── domain/                          # Domain Layer
│   ├── models/
│   │   └── chat_models.dart        # Models: Source, ChatResponseModel, etc.
│   ├── repositories/
│   │   └── chat_repository.dart    # Repository interface
│   ├── usecases/
│   │   └── chat_use_case.dart      # Business logic
│   └── failures/
│       ├── failures.dart           # Failure types
│       └── dio_error.dart          # Error mapper
│
├── data/                            # Data Layer
│   ├── datasources/
│   │   └── remote_datasource/
│   │       └── api_service.dart.dart  # API calls
│   └── repositories/
│       └── chat_repository_impl.dart  # Repository implementation
│
├── application/                     # Presentation Layer
│   └── pages/
│       └── chatbot/
│           ├── chatbot_page.dart   # UI
│           └── bloc/
│               ├── chat_bloc.dart   # BLoC
│               ├── chat_event.dart  # Events
│               ├── chat_state.dart  # States
│               └── chat_bloc.freezed.dart  # Generated
│
└── di/                              # Dependency Injection
    ├── di.dart                      # GetIt setup
    ├── di.config.dart              # Generated registrations
    └── register_module.dart         # Dio, Supabase config
```

---

## 🔑 Key Benefits of This Architecture

1. **Separation of Concerns**: Each layer has a single responsibility
2. **Testability**: Easy to mock repositories and use cases for testing
3. **Maintainability**: Changes are localized to specific layers
4. **Scalability**: Easy to add new features following the same pattern
5. **Type Safety**: Freezed provides immutable data classes
6. **Error Handling**: Functional approach with Either<Failure, Success>
7. **Dependency Injection**: Automatic wiring with injectable

---

## 🔄 Conversation State Management

The chatbot maintains state across messages:

```dart
// In UI State
String? _conversationId;  // null for first message
List<ConversationHistoryItem> _conversationHistory = [];

// After each successful response:
_conversationId = response.conversationId;
_conversationHistory = response.conversationHistory;

// For next message:
ChatEvent.sendMessage(
  query: userQuery,
  conversationId: _conversationId,  // Pass existing ID
  conversationHistory: _conversationHistory,  // Pass history
)
```

---

## 🎨 UI Features

### Message Display
- **User messages**: Right-aligned, teal background
- **Bot messages**: Left-aligned, white background with sources
- **Error messages**: Red border, error icon, red tint
- **Loading state**: "Thinking..." indicator at bottom

### Interaction
- **Send button**: Disabled during loading
- **Auto-scroll**: Scrolls to latest message
- **Multiline input**: Text field expands with content
- **Enter key**: Submits message

---

## 🔧 How to Use

### In Your Code
The chatbot is already integrated in your navigation tabs. The BLoC provider is created at the page level, so each session is independent.

### Making Changes

1. **Update API URL**: Modify `baseUrl` in `lib/di/register_module.dart`
2. **Change UI colors**: Update colors in `chatbot_page.dart`
3. **Add new features**: Follow the same layer pattern
4. **Regenerate code**: Run `dart run build_runner build --delete-conflicting-outputs`

---

## 🐛 Error Handling Strategy

### Network Errors
- Caught by `DioException` handler
- Mapped to user-friendly messages via `handleDioError()`
- Displayed as red error bubble

### Parse Errors
- Caught in try-catch
- Displayed as "Unexpected error occurred"

### State Management
- **On error**: Only the current response fails
- **Previous messages**: Always remain visible
- **Conversation continues**: Can retry or ask different question

This matches ChatGPT/Claude behavior where errors don't break the conversation flow.

---

## 📝 Summary

This implementation follows Clean Architecture principles:
- ✅ Domain layer defines contracts (Repository, UseCases, Models)
- ✅ Data layer implements contracts (RepositoryImpl, ApiService)
- ✅ Presentation layer handles UI (BLoC, Pages)
- ✅ Dependency injection wires everything together
- ✅ Error handling uses functional programming (Either type)
- ✅ State management via BLoC pattern
- ✅ UI matches ChatGPT/Claude conversation style

The architecture is scalable, testable, and maintainable!
