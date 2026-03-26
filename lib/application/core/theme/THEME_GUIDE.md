# App Theme System - Complete Guide

## 📋 Overview

A centralized theme system for the Farmer Assistance app that ensures consistency across all pages with a professional teal/green agricultural theme.

## 🎨 Theme Structure

```
lib/application/core/
├── theme/
│   └── app_theme.dart          # Central theme file with all colors, gradients, shadows
└── widgets/
    └── app_widgets.dart        # Reusable themed widgets
```

## 🌈 Color Palette

### Primary Colors

- **`AppTheme.primaryTeal`** (#00796B) - Main color for AppBars, buttons, accents
- **`AppTheme.lightTeal`** (#26A69A) - Gradients, hover states
- **`AppTheme.deepTeal`** (#004D40) - Dark text on light backgrounds
- **`AppTheme.successGreen`** (#4CAF50) - Success messages
- **`AppTheme.lightGreenAccent`** (#81C784) - Light accents

### Secondary Colors

- **`AppTheme.warningOrange`** (#FF9800) - Warnings
- **`AppTheme.errorRed`** (#F44336) - Errors
- **`AppTheme.infoBlue`** (#2196F3) - Info messages

### Background Colors

- **`AppTheme.backgroundColor`** (#F1FAF8) - Main app background
- **`AppTheme.cardBackground`** (white) - Card backgrounds
- **`AppTheme.lightGrey`** (#F5F5F5) - Section backgrounds

### Text Colors

- **`AppTheme.textPrimary`** (#212121) - Main text
- **`AppTheme.textSecondary`** (#757575) - Secondary text
- **`AppTheme.textHint`** (#9E9E9E) - Hints/placeholders
- **`AppTheme.textWhite`** - Text on dark backgrounds

## 📐 Spacing & Sizing

### Border Radius

```dart
AppTheme.radiusSmall   // 8px
AppTheme.radiusMedium  // 12px
AppTheme.radiusLarge   // 16px
AppTheme.radiusXLarge  // 24px
```

### Spacing

```dart
AppTheme.spacingXS   // 4px
AppTheme.spacingS    // 8px
AppTheme.spacingM    // 12px
AppTheme.spacingL    // 16px
AppTheme.spacingXL   // 20px
AppTheme.spacingXXL  // 24px
```

## 🎭 Gradients

### Pre-defined Gradients

```dart
// Primary teal gradient
AppTheme.primaryGradient

// Page background gradient
AppTheme.pageBackgroundGradient

// Light gradient for cards
AppTheme.lightGradient
```

## 🧩 Reusable Widgets

### 1. AppPageScaffold

Complete page structure with gradient background:

```dart
AppPageScaffold(
  title: 'Page Title',
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        // Your content
      ],
    ),
  ),
)
```

### 2. AppGradientHeader

Professional gradient header with icon:

```dart
AppGradientHeader(
  title: 'Crop Recommendation',
  subtitle: 'Get personalized crop suggestions based on soil and weather.',
  icon: Icons.grass,
  locationLabel: 'Dhaka, Bangladesh',
  showLocation: true,
)
```

### 3. AppCard

White card with consistent shadow:

```dart
AppCard(
  child: Column(
    children: [
      AppSectionHeader(
        title: 'Input Data',
        icon: Icons.edit,
      ),
      // Form fields
    ],
  ),
)
```

### 4. AppSectionHeader

Section titles with icons:

```dart
AppSectionHeader(
  title: 'Soil Information',
  icon: Icons.terrain,
)
```

### 5. AppResultCard

Beautiful gradient result display:

```dart
AppResultCard(
  title: 'Rice',
  emoji: '🌾',
  child: Column(
    children: [
      Text('Confidence: 85%'),
      // More result details
    ],
  ),
)
```

### 6. AppPrimaryButton

Styled primary button with loading state:

```dart
AppPrimaryButton(
  label: 'Get Recommendation',
  icon: Icons.analytics_outlined,
  onPressed: () => _handleSubmit(),
  isLoading: false,
)
```

### 7. AppSecondaryButton

Outlined secondary button:

```dart
AppSecondaryButton(
  label: 'Refresh Weather Data',
  icon: Icons.cloud_sync_outlined,
  onPressed: () => _refreshWeather(),
)
```

### 8. AppLoadingIndicator

Consistent loading spinner:

```dart
AppLoadingIndicator()  // Default size
AppLoadingIndicator(size: 30)  // Custom size
```

## 🔄 Migration Guide

### Before (Old Code)

```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xff00796B), Color(0xff26A69A)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: const Color(0xff00796B).withValues(alpha: 0.3),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Text('Hello'),
)
```

### After (New Code)

```dart
AppGradientHeader(
  title: 'Hello',
  subtitle: 'Welcome message',
  icon: Icons.home,
)
```

## 📱 Page Structure Template

```dart
import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/core/widgets/app_widgets.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Page Title',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            AppGradientHeader(
              title: 'Feature Name',
              subtitle: 'Description',
              icon: Icons.feature,
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Content Card
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSectionHeader(
                    title: 'Section',
                    icon: Icons.info,
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                  // Content
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Buttons
            AppPrimaryButton(
              label: 'Submit',
              icon: Icons.check,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎯 Quick Reference

### Colors

```dart
// Use this:
AppTheme.primaryTeal
// Instead of:
Color(0xff00796B)

// Use this:
AppTheme.textWhite.withValues(alpha: 0.9)
// Instead of:
Colors.white.withOpacity(0.9)
```

### Decorations

```dart
// Use this:
AppTheme.gradientContainer()
// Instead of:
BoxDecoration(gradient: LinearGradient(...), ...)

// Use this:
AppTheme.cardDecoration()
// Instead of:
BoxDecoration(color: Colors.white, borderRadius: ..., ...)
```

### Spacing

```dart
// Use this:
const SizedBox(height: AppTheme.spacingL)
// Instead of:
const SizedBox(height: 16)

// Use this:
padding: const EdgeInsets.all(AppTheme.spacingXL)
// Instead of:
padding: const EdgeInsets.all(20)
```

## ✅ Migration Checklist

For each page:

- [ ] Import AppTheme and AppWidgets
- [ ] Replace hardcoded colors with AppTheme colors
- [ ] Replace hardcoded spacing with AppTheme spacing
- [ ] Replace custom containers with AppCard
- [ ] Replace custom headers with AppGradientHeader
- [ ] Replace custom buttons with AppPrimaryButton/AppSecondaryButton
- [ ] Use AppPageScaffold for consistent structure
- [ ] Use AppSectionHeader for section titles
- [ ] Use AppLoadingIndicator for loading states

## 🚀 Benefits

1. **Consistency** - All pages look and feel the same
2. **Maintainability** - Change theme in one place
3. **Productivity** - Less code to write
4. **Scalability** - Easy to add new themed components
5. **Professional** - Clean, modern UI throughout

## 📝 Examples in Code

### Current Implementation

- ✅ Crop Recommendation page (uses new theme)
- ⚠️ Other pages (need migration)

### Migration Priority

1. High traffic pages (Home, Forecast)
2. Feature pages (Fertilizer, Yield, Water)
3. Secondary pages (Profile, Settings)

## 🔧 Customization

To customize the theme:

1. Open `app_theme.dart`
2. Modify colors in the color palette section
3. All pages automatically update!

To add new components:

1. Open `app_widgets.dart`
2. Add new widget following existing patterns
3. Use AppTheme constants for consistency

## 📖 Best Practices

1. **Always use AppTheme constants** instead of hardcoded values
2. **Use reusable widgets** instead of custom containers
3. **Keep spacing consistent** using AppTheme spacing constants
4. **Test on multiple screen sizes** to ensure responsiveness
5. **Follow the template** for new pages

---

**Note**: This theme system is designed to be flexible and easy to maintain. When in doubt, refer to the Crop Recommendation page as a reference implementation.
