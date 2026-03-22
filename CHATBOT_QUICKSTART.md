# 🚀 Chatbot Quick Start Guide

## ✅ What's Been Implemented

A fully-functional **ChatGPT/Claude-style chatbot** with:
- ✅ Clean Architecture (Domain → Data → Presentation)
- ✅ BLoC State Management
- ✅ Conversation persistence (maintains context across messages)
- ✅ Error handling (only current message fails, previous messages stay)
- ✅ Source attribution display
- ✅ Loading indicators
- ✅ Auto-scroll
- ✅ New conversation reset

---

## 📝 Backend Integration Summary

### API Endpoint
```
POST http://localhost:8000/ai-chat/chat
```

### Request Examples

**First Message:**
```json
{
  "query": "How can I treat powdery mildew in cucumber?"
}
```

**Follow-up Messages:**
```json
{
  "query": "What about organic methods?",
  "conversation_id": "4271568b-49e3-4693-880f-6f1279b45354",
  "conversation_history": [
    {
      "role": "user",
      "content": "How can I treat powdery mildew in cucumber?",
      "timestamp": "2024-03-22T10:30:00Z"
    },
    {
      "role": "assistant",
      "content": "Use sulfur-based fungicide...",
      "timestamp": "2024-03-22T10:30:15Z"
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
  "conversation_history": [...],
  "conversation_title": "Tomato Disease Treatment"
}
```

---

## 🏗️ Architecture Flow

```
┌─────────────────────────────────────────────────────────────┐
│                        UI Layer                              │
│  chatbot_page.dart (User types → sends message)             │
└───────────────────────────┬─────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                        │
│  ChatBloc (Manages state: loading, loaded, error)           │
└───────────────────────────┬─────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                     Domain Layer                             │
│  ChatUseCase → ChatRepository (abstract interface)          │
└───────────────────────────┬─────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                              │
│  ChatRepositoryImpl → ApiService (HTTP calls)               │
└───────────────────────────┬─────────────────────────────────┘
                            │
                            ▼
                    Backend API Server
           POST /ai-chat/chat with Dio
```

---

## 📂 Files Created/Modified

### Domain Layer (Business Logic)
- `lib/domain/models/chat_models.dart` - Models: Source, ChatResponseModel, ChatMessage, ConversationHistoryItem
- `lib/domain/repositories/chat_repository.dart` - Repository interface
- `lib/domain/usecases/chat_use_case.dart` - Business logic

### Data Layer (Implementation)
- `lib/data/datasources/remote_datasource/api_service.dart.dart` - Added `sendChatMessage()` method
- `lib/data/repositories/chat_repository_impl.dart` - Repository implementation

### Presentation Layer (UI + State)
- `lib/application/pages/chatbot/bloc/chat_event.dart` - Events: sendMessage, reset
- `lib/application/pages/chatbot/bloc/chat_state.dart` - States: initial, loading, loaded, error
- `lib/application/pages/chatbot/bloc/chat_bloc.dart` - BLoC logic
- `lib/application/pages/chatbot/chatbot_page.dart` - UI (replaced old placeholder)

### Auto-Generated Files
- `lib/application/pages/chatbot/bloc/chat_bloc.freezed.dart` - Freezed code gen
- `lib/di/di.config.dart` - Updated with ChatBloc, ChatRepository, ChatUseCase

---

## 🎯 How It Works

### 1. User Sends First Message
```
User types: "What is crop rotation?"
  ↓
UI adds user message to _messages list
  ↓
Dispatches: ChatEvent.sendMessage(query: "What is crop rotation?")
  ↓
ChatBloc → ChatUseCase → ChatRepository → ApiService
  ↓
POST /ai-chat/chat with {query: "..."}
  ↓
Backend responds with conversation_id
  ↓
UI adds bot response + stores conversation_id
```

### 2. User Sends Follow-up Message
```
User types: "How do I start?"
  ↓
Dispatches: ChatEvent.sendMessage(
  query: "How do I start?",
  conversation_id: "347b...",  ← From previous response
  conversation_history: [...]   ← Full context
)
  ↓
Backend receives full context → Generates contextual response
  ↓
UI updates with new answer
```

### 3. Error Handling
```
If API fails:
  ↓
ChatBloc emits ChatState.error(message: "...")
  ↓
UI adds RED error message bubble
  ↓
Previous messages remain visible ✅
  ↓
User can retry or ask different question
```

---

## 🛠️ Configuration

### Update Backend URL
Edit `lib/di/register_module.dart`:
```dart
baseUrl: 'http://192.168.0.105:8000',  // Change this to your backend
```

### Test Locally
1. Start your backend server
2. Run the Flutter app
3. Navigate to Chatbot page (bottom nav)
4. Type a message

---

## 🎨 UI Features

| Feature | Description |
|---------|-------------|
| **Message Bubbles** | User (right, teal) vs Bot (left, white) |
| **Sources** | Shows reference sources with each bot answer |
| **Loading** | "Thinking..." indicator during API call |
| **Timestamps** | Relative time (Just now, 5m ago, etc.) |
| **Error Display** | Red bubble with error icon for failed messages |
| **Auto-scroll** | Automatically scrolls to latest message |
| **Refresh** | Top-right icon to start new conversation |
| **Send Button** | Disabled during loading (hourglass icon) |

---

## 🔍 Debugging

### Check if dependencies are registered
```bash
dart run build_runner build --delete-conflicting-outputs
```

### View API logs
The app uses `PrettyDioLogger` - check console for HTTP requests/responses.

### Test Connection
```bash
curl -X POST http://localhost:8000/ai-chat/chat \
  -H "Content-Type: application/json" \
  -d '{"query": "Test message"}'
```

---

## 🧪 Testing Checklist

- [ ] First message sends successfully
- [ ] Bot response appears with sources
- [ ] conversation_id is stored
- [ ] Follow-up message includes conversation context
- [ ] Error handling works (turn off backend)
- [ ] Previous messages stay visible on error
- [ ] Refresh button clears conversation
- [ ] Loading indicator appears while waiting
- [ ] Auto-scroll works
- [ ] Send button disabled during loading

---

## 🚨 Common Issues

### "ChatBloc not found"
**Solution**: Run `dart run build_runner build --delete-conflicting-outputs`

### "Connection refused"
**Solution**: Check backend is running and URL in `register_module.dart` is correct

### "No messages appearing"
**Solution**: Check console logs for HTTP errors with PrettyDioLogger

### "Conversation context not working"
**Solution**: Verify `conversation_id` and `conversation_history` are being sent in API request (check logs)

---

## 📚 Learn More

For detailed architecture explanation, see:
- `CHATBOT_ARCHITECTURE.md` - Complete architecture documentation

---

## ✨ Key Features Summary

✅ **Clean Architecture** - Separated into Domain, Data, and Presentation layers
✅ **BLoC Pattern** - Reactive state management with freezed
✅ **Dependency Injection** - Auto-wired with GetIt + Injectable
✅ **Error Handling** - Functional approach with Either<Failure, Success>
✅ **Conversation Context** - Maintains conversation_id and full history
✅ **ChatGPT-Style UX** - Messages persist, errors don't break conversation
✅ **Source Attribution** - Displays reference sources for each answer
✅ **Type Safety** - Immutable models with Freezed

---

## 🎉 You're Ready!

The chatbot is fully integrated and ready to use. Just:
1. Update the backend URL if needed
2. Ensure your backend is running
3. Navigate to the Chatbot tab
4. Start chatting!

For implementation details or modifications, check `CHATBOT_ARCHITECTURE.md`.
