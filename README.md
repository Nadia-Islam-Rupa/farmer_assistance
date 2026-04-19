# 🌾 Farmer Assistance

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Supabase-Auth%20%26%20Storage-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white" />
  <img src="https://img.shields.io/badge/Architecture-Clean%20Architecture-00796B?style=for-the-badge" />
  <img src="https://img.shields.io/badge/State-BLoC%20%2B%20Riverpod-7B61FF?style=for-the-badge" />
</p>

<p align="center">
  <strong>An AI-powered mobile assistant that helps farmers make smarter decisions — from disease detection to yield forecasting, irrigation planning, and live market prices.</strong>
</p>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features at a Glance](#-features-at-a-glance)
- [Getting Started](#-getting-started)
- [App Navigation](#-app-navigation)
- [Authentication](#-authentication)
- [Home Dashboard](#-home-dashboard)
- [Feature Guides](#-feature-guides)
  - [Crop Disease Detection](#1-crop-disease-detection)
  - [Smart Irrigation](#2-smart-irrigation)
  - [Fertilizer Recommendation](#3-fertilizer-recommendation)
  - [Yield Estimation](#4-yield-estimation)
  - [Crop Recommendation](#5-crop-recommendation)
  - [Market Trends & Price Prediction](#6-market-trends--price-prediction)
  - [Weather Forecast](#7-weather-forecast)
  - [AI Chatbot](#8-ai-chatbot)
- [Profile Management](#-profile-management)
- [Architecture Overview](#-architecture-overview)
- [Tech Stack](#-tech-stack)
- [Permissions](#-permissions)

---

## 🌟 Overview

**Farmer Assistance** is a cross-platform mobile application built with Flutter that puts the power of machine learning directly in the hands of farmers and agronomists. By combining real-time weather data, AI-driven predictions, and an intelligent chatbot, it supports smarter, data-backed farming decisions at every stage of the crop lifecycle.

### Who is it for?

- **Farmers** who want actionable recommendations without needing agronomic expertise
- **Agronomists & field agents** who need quick analytical tools on mobile
- **Agricultural students & researchers** exploring AI in farming

### What problems does it solve?

| Problem | Solution |
|---|---|
| Can't identify crop disease from visual symptoms | Upload a leaf photo — AI diagnoses it instantly |
| Unsure when to irrigate or how much | Smart Irrigation predicts need based on soil + weather |
| Don't know which fertilizer to apply | NPK + soil analysis gives a precise recommendation |
| Uncertain about expected harvest yield | Yield Estimation uses historical + environmental data |
| Not sure what crop to plant this season | Crop Recommendation matches soil profile to best crops |
| Can't predict market prices | Price Prediction forecasts commodity prices by market |
| Need farming advice anytime | AI Chatbot answers farming questions 24/7 |

---

## ⚡ Features at a Glance

| Feature | Key Inputs | Output |
|---|---|---|
| 🔬 **Crop Disease Detection** | Leaf image (photo/gallery) | Disease name + heatmap |
| 💧 **Smart Irrigation** | Crop, soil type, growth stage, weather | Irrigate now? Yes / No |
| 🌱 **Fertilizer Recommendation** | Crop, NPK levels, soil pH, weather | Best fertilizer name |
| 📊 **Yield Estimation** | Crop, region, soil nutrients, weather | Predicted yield (t/ha) |
| 🌾 **Crop Recommendation** | NPK, pH, humidity, rainfall | Best crop to plant |
| 💰 **Market Trends** | Location, commodity, date | Predicted market price |
| ⛅ **Weather Forecast** | Auto-detected location | Current + 7-day forecast |
| 🤖 **AI Chatbot** | Natural language questions | Expert farming advice |

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** ≥ 3.9.0 — [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart** ≥ 3.9.0 (bundled with Flutter)
- **Android device** or emulator (Android 5.0+)
- **Internet connection** (all ML predictions are server-side)

### Installation

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd farmer_assistance

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### Backend & Services

The app connects to two backend services:

| Service | Purpose |
|---|---|
| **ML API** — `http://20.6.88.5:8000/` | All prediction endpoints (disease, yield, irrigation, etc.) |
| **Supabase** | User authentication, profile storage, profile images |

> **Note:** The ML API server must be reachable from your device/emulator network. If running on a real device, ensure the device is on a network that can reach the API server.

---

## 🗺️ App Navigation

The app uses a **bottom navigation bar** with 4 main sections:

```
┌─────────────────────────────────────────┐
│              App Content                │
├──────────┬──────────┬──────────┬────────┤
│  🏠 Home │⛅Forecast│ 🤖 Chat  │👤Profile│
└──────────┴──────────┴──────────┴────────┘
```

| Tab | Screen | Description |
|---|---|---|
| **Home** | Home Dashboard | Central hub — access all 7 ML features |
| **Forecast** | Weekly Forecast | 7-day weather outlook |
| **Chatbot** | AI Chatbot | Farming advice & Q&A |
| **Profile** | Profile Page | Account info & settings |

### Overall App Flow

```
App Launch
    │
    ├─── Not logged in ──→  Login Dashboard
    │                            │
    │               ┌────────────┴────────────┐
    │           Login Page           Create Account
    │         (Email / Google)       (Email + Name)
    │               └────────────┬────────────┘
    │                            │
    └─── Already logged in ──────▼
                            Home Dashboard
                                 │
               ┌─────────────────┼──────────────────┐
           Feature Cards     Weather Card      Navigation Bar
```

---

## 🔐 Authentication

### Login

1. Open the app — you will see the **Login Dashboard**
2. Tap **Login**
3. Enter your **email** and **password**, then tap **Login**
4. Alternatively, tap **Sign in with Google** for one-tap Google authentication

### Create Account

1. From the Login Dashboard, tap **Create Account**
2. Fill in:
   - **Full Name**
   - **Email address**
   - **Password** (see requirements below)
   - **Confirm Password**
3. Tap **Create Account**

**Password requirements:**
- At least **8 characters**
- At least one **uppercase** letter
- At least one **lowercase** letter
- At least one **number**
- At least one **special character** (`!@#$&*~%^`)

### Forgot Password

1. On the Login page, tap **Forgot Password?**
2. Enter your registered **email address** and tap **Submit**
3. Check your inbox (including **spam/junk**) for a password reset link
4. The reset link is **valid for 1 hour only**

> **Tip:** If the link expires, go back to Forgot Password and request a new one.

### Reset Password (via email link)

1. Tap the reset link in your email — it opens the app automatically
2. Enter your **new password** and **confirm** it
3. Tap **Reset Password**
4. You are signed out and redirected to login — use your new password

---

## 🏠 Home Dashboard

After logging in, the **Home Dashboard** shows:

- A **live weather card** at the top with current temperature and conditions
- A **grid of 7 feature cards** — tap any to open that tool:

```
┌──────────────────┬──────────────────┐
│  🔬 Disease      │  💧 Smart        │
│     Detection    │     Irrigation   │
├──────────────────┼──────────────────┤
│  🌱 Fertilizer   │  💰 Market       │
│     Tips         │     Trends       │
├──────────────────┼──────────────────┤
│  ⛅ Weather      │  📊 Yield        │
│     Insights     │     Estimate     │
├──────────────────┴──────────────────┤
│         🌾 Crop Recommendation       │
└─────────────────────────────────────┘
```

---

## 📚 Feature Guides

---

### 1. Crop Disease Detection

> **Purpose:** Identify crop diseases from a leaf photograph using AI image analysis with visual heatmap explanation.

#### How to use

1. Tap **Disease Detection** on the Home Dashboard
2. Tap the upload area and select a leaf image from your device
   - Supported formats: **JPG, PNG, JPEG**
   - Maximum size: **10 MB**
3. A preview of the image appears in the upload box
4. Tap **Detect Disease**

#### What you get

| Result | Description |
|---|---|
| **Disease Name** | Human-readable label, e.g., *Pepper Bell — Bacterial Spot* |
| **Heatmap Analysis** | Visual overlay (Grad-CAM) highlighting affected leaf areas |

> **What is the heatmap?** The Grad-CAM heatmap shows *where* the AI looked when making its diagnosis. Warm (red/orange) areas are where disease symptoms were detected most strongly. This helps you verify the AI's reasoning.

#### Tips for best results

- Use a **clear, well-lit** close-up photo of the leaf
- Focus on **symptomatic areas** (spots, lesions, discoloration, wilting)
- Avoid blurry, dark, or heavily shadowed images
- The leaf should fill most of the frame

---

### 2. Smart Irrigation

> **Purpose:** Predict whether your crop needs irrigation right now, based on current soil conditions and live weather data.

#### How to use

1. Tap **Smart Irrigation** on the Home Dashboard
2. Fill in the form:

| Field | Available Options |
|---|---|
| **Crop** | Wheat, Chilli, Potato, Carrot, Tomato |
| **Soil Type** | Clay, Sandy, Red, Loam, Black, Alluvial, Chalky |
| **Growth Stage** | Germination · Seedling · Vegetative · Flowering · Pollination · Fruit/Grain Formation · Maturation · Harvest |
| **Temperature (°C)** | Auto-filled from live weather |
| **Humidity (%)** | Auto-filled from live weather |
| **Soil Moisture (%)** | Enter manually (0–100) |

3. Tap **Predict Irrigation**

#### What you get

| Result | Description |
|---|---|
| **Irrigation Decision** | **Yes — Irrigation Needed** or **No — Irrigation Not Required** |
| **Recommendation Text** | Short advice message (e.g., *"💧 Irrigate within 24 hours"*) |
| **Feature Importance** | Which factors most influenced the decision |

> **Auto-fill tip:** Temperature and humidity are fetched from live weather at your GPS location. Tap the refresh button to pull the latest readings before predicting.

---

### 3. Fertilizer Recommendation

> **Purpose:** Recommend the optimal fertilizer type for your crop based on soil nutrient levels, pH, and current weather.

#### How to use

1. Tap **Fertilizer Tips** on the Home Dashboard
2. Fill in the form:

| Field | Format / Notes |
|---|---|
| **Crop** | Free text — type the crop name |
| **Soil Color / Type** | Free text — e.g., *Red*, *Black*, *Brown* |
| **Nitrogen (N)** | Numeric — mg/kg or ppm |
| **Phosphorus (P)** | Numeric — mg/kg or ppm |
| **Potassium (K)** | Numeric — mg/kg or ppm |
| **pH Level** | Numeric — typically 4.0 to 9.0 |
| **Temperature (°C)** | Auto-filled from weather |
| **Rainfall (mm)** | Auto-filled from weather |

3. Tap **Refresh From Weather** to update temperature and rainfall
4. Tap **Get Recommendation**

#### What you get

| Result | Description |
|---|---|
| **Fertilizer Name** | E.g., *Urea*, *DAP*, *MOP*, *NPK 10-26-26* |
| **Feature Importance** | Relative contribution of each soil/weather factor |

> **How to get soil NPK values?** Use a soil testing kit (available at agricultural supply stores) or contact your local agricultural extension office for a lab soil test.

---

### 4. Yield Estimation

> **Purpose:** Forecast the expected crop yield in tonnes per hectare (t/ha) for your crop, region, and growing conditions.

#### How to use

1. Tap **Yield Estimate** on the Home Dashboard
2. Fill in the form:

| Field | Available Options / Format |
|---|---|
| **Crop** | Cassava, Maize, Plantains, Potatoes, Rice paddy, Sorghum, Soybeans, Sweet potatoes, Wheat, Yams |
| **Area / Country** | Select from 100+ countries (Albania to Zimbabwe) |
| **Temperature (°C)** | Auto-filled from weather |
| **Rainfall (mm)** | Auto-filled from weather |
| **Pesticides** | Numeric — quantity applied |

3. Tap **Refresh From Weather** to update temperature and rainfall
4. Tap **Estimate Yield**

#### What you get

| Result | Description |
|---|---|
| **Predicted Yield** | Numeric value in **t/ha** (tonnes per hectare) |
| **Yield Class** | High / Medium / Low classification with color coding |
| **Feature Importance** | Which inputs most affected the yield estimate |

---

### 5. Crop Recommendation

> **Purpose:** Tell you the best crop to grow right now given your soil's nutrient profile and current climate conditions.

#### How to use

1. Tap **Crop Recommendation** on the Home Dashboard
2. Weather data (temperature, humidity, rainfall) **auto-fills on page load**
3. Enter your soil nutrient readings:

| Field | Format / Notes |
|---|---|
| **Nitrogen (N)** | Numeric — ppm or mg/kg |
| **Phosphorus (P)** | Numeric — ppm or mg/kg |
| **Potassium (K)** | Numeric — ppm or mg/kg |
| **pH Level** | Numeric — typically 4.0 to 9.0 |
| **Temperature (°C)** | Auto-filled |
| **Humidity (%)** | Auto-filled |
| **Rainfall (mm)** | Auto-filled |

4. Tap **Refresh Weather Data** to update live values
5. Tap **Get Recommendation**

#### What you get

| Result | Description |
|---|---|
| **Recommended Crop** | Best-matched crop for your conditions (e.g., *Jute*, *Rice*, *Mungbean*, *Cotton*) |

---

### 6. Market Trends & Price Prediction

> **Purpose:** Forecast the market price of an agricultural commodity at a specific market location on a chosen date.

#### How to use

1. Tap **Market Trends** on the Home Dashboard
2. Select your **location** using cascading dropdowns:
   - **Division** → **District** → **Market**
   - Latitude & Longitude are **auto-filled** when a market is selected
3. Select your **commodity**:

| Field | Options / Format |
|---|---|
| **Category** | Food, Vegetables, Spices, Grains, etc. |
| **Commodity** | Specific crop/product (e.g., Rice, Tomato, Wheat, Onion) |
| **Unit** | kg, quintal, ton, bag, etc. |
| **Price Type** | Retail / Wholesale |
| **Price Flag** | Status indicator for special conditions |
| **Date** | Date picker (range: 2020–2030) |

4. Tap **Predict Price**

#### What you get

| Result | Description |
|---|---|
| **Predicted Price** | Estimated price as a numeric value |
| **Currency** | Local currency code (e.g., BDT for Bangladeshi Taka) |
| **Market & Commodity** | Confirmation of your selected market and product |

> **Tip:** The market list and coordinates are pre-loaded — you do not need to enter GPS data manually.

---

### 7. Weather Forecast

> **Purpose:** View live weather conditions and multi-day forecasts for your current location. Weather data is also shared across other features for auto-fill.

#### How to use

1. Tap the **Forecast** tab at the bottom of the screen
2. The app automatically fetches weather for your **GPS location**
3. Swipe down or tap the **refresh button** to update the data

#### What you see

**Current Conditions**
- Temperature (°C)
- Weather condition (Sunny, Cloudy, Rainy, etc.)
- Humidity, wind speed, atmospheric pressure

**Hourly Forecast**
- Hour-by-hour temperature and precipitation for the rest of the day

**7-Day Extended Forecast**
- Day name, expected high/low temperatures, and conditions for the next week

#### Why it matters for other features

When you open Smart Irrigation, Fertilizer, Yield Estimation, or Crop Recommendation, the app **automatically fills in** temperature, humidity, and rainfall from the latest weather data — saving you time and reducing manual entry errors.

> **Location permission required:** Grant location access when prompted so the app can fetch weather for your exact coordinates.

---

### 8. AI Chatbot

> **Purpose:** Get expert farming advice by asking questions in plain language. The AI understands farming context and gives detailed, formatted answers.

#### How to use

1. Tap the **Chatbot** tab at the bottom of the screen
2. Type your farming question in the text box
3. Tap **Send**
4. Read the AI's response (supports rich text: bold, lists, tables)

#### Example questions

```
"What is the best time to plant tomatoes in a tropical climate?"
"How do I treat early blight on potato leaves?"
"What NPK ratio should I use for paddy rice?"
"How can I improve soil drainage in clay soil?"
"What pests are common during wheat flowering stage?"
"How much water does maize need per week?"
```

#### Managing your conversations

| Action | How to do it |
|---|---|
| **Start a new chat** | Tap the ➕ new conversation button |
| **View past conversations** | Open the sidebar (slide from the left edge or tap the menu icon) |
| **Continue an old conversation** | Tap any conversation in the sidebar list |
| **Delete a conversation** | Swipe or long-press a conversation, then confirm deletion |

> **Markdown rendering:** The chatbot supports bold text, bullet lists, numbered steps, tables, and code blocks so answers are easy to read and act on.

---

## 👤 Profile Management

### Viewing your profile

1. Tap the **Profile** tab at the bottom of the screen
2. Your profile card shows:
   - **Profile picture** (circular avatar)
   - **Full name**
   - **Email address**

### Menu options

| Option | Description |
|---|---|
| **Personal Information** | Edit your name and profile picture |
| **Help & Support** | Get help using the app |
| **About** | App version and info (v1.0.0) |
| **Logout** | Sign out of your account |

### Updating your profile

1. Tap **Personal Information**
2. **To change your name:** Edit the name text field directly
3. **To change your profile picture:**
   - Tap the avatar or camera icon
   - Select a new image from your device (**JPG, PNG, JPEG**, max **10 MB**)
   - Preview the image before saving
4. Tap **Save** to apply all changes

### Logging out

1. Tap **Logout** on the Profile page
2. Confirm in the dialog prompt
3. You are returned to the Login Dashboard

---

## 🏗️ Architecture Overview

The app is built with **Clean Architecture** — each concern is clearly separated into three layers:

```
┌─────────────────────────────────────────────────┐
│                Presentation Layer               │
│   Flutter Widgets  ·  BLoC  ·  Riverpod         │
├─────────────────────────────────────────────────┤
│                  Domain Layer                   │
│        Use Cases  ·  Entity Models              │
├─────────────────────────────────────────────────┤
│                   Data Layer                    │
│   Repositories  ·  Dio HTTP  ·  Supabase        │
└─────────────────────────────────────────────────┘
```

| Layer | Responsibility |
|---|---|
| **Presentation** | UI screens, BLoC state machines, Riverpod providers for weather and navigation |
| **Domain** | Business rules, use cases, abstract repository contracts — no framework dependencies |
| **Data** | Concrete repository implementations: REST API calls via Dio and Supabase auth/storage |

### Design patterns used

| Pattern | Purpose |
|---|---|
| **BLoC** | Predictable, testable state management per feature |
| **Riverpod** | Lightweight providers for weather data and bottom nav state |
| **GetIt + Injectable** | Compile-safe dependency injection auto-generated at build time |
| **Dartz Either** | Functional error handling — `Either<Failure, Success>` eliminates exceptions |
| **Freezed** | Immutable data classes and union types for BLoC states and events |
| **GoRouter** | Declarative routing with auth guard and password recovery redirect |
| **Deep Linking** | Password recovery via `myapp://reset-password` custom URL scheme |

---

## 🛠️ Tech Stack

| Category | Technology | Version |
|---|---|---|
| UI Framework | Flutter | ≥ 3.x |
| Language | Dart | ≥ 3.x |
| State Management | flutter_bloc + Riverpod | 9.1 / 3.2 |
| Routing | GoRouter | 17.x |
| Deep Linking | app_links | 6.x |
| Authentication & DB | Supabase Flutter | 2.12.x |
| Google Sign-In | google_sign_in | 7.2.x |
| HTTP Client | Dio + PrettyDioLogger | 5.9.x |
| Dependency Injection | GetIt + Injectable | 9.x / 2.7.x |
| Functional Programming | Dartz | 0.10.x |
| Code Generation | Freezed + build_runner | 3.x |
| Location Services | Geolocator + Geocoding | 14.x / 3.x |
| Markdown Rendering | flutter_markdown | 0.7.x |
| Local Storage | shared_preferences | 2.5.x |
| File Handling | file_picker + open_filex | 10.x / 4.x |

---

## 🔒 Permissions

The app requests the following device permissions at runtime:

| Permission | Platform | Why it's needed |
|---|---|---|
| **Internet** | Android & iOS | Required for all API calls, Supabase auth, and weather data |
| **Location (Coarse)** | Android & iOS | Approximate location for fetching nearby weather data |
| **Location (Fine / GPS)** | Android & iOS | Precise coordinates for accurate, hyper-local weather |

> **Privacy:** Your location coordinates are used solely to fetch weather data and are never stored or shared beyond the weather API request.

---

<p align="center">
  Made with ❤️ for farmers everywhere &nbsp;·&nbsp; Built with Flutter
</p>
