# Audio Duration Parsing Fix

## Issue
When clicking on an audio category, the app was crashing with error:
```
type 'String' is not a subtype of type 'num?' in type cast
```

## Root Cause
The API returns `audio_duration` as a string in format "MM:SS" (e.g., "11:34") but the Flutter model was expecting an integer value for `durationSeconds`.

## Solution Implemented

### 1. Added Duration Parser Function
Created a custom parser function `_parseDuration` that handles:
- String format "MM:SS" (e.g., "11:34" → 694 seconds)
- String format "HH:MM:SS" (e.g., "1:23:45" → 5025 seconds)
- Integer values (pass through unchanged)
- Null values (return null)

### 2. Updated AudioTrack Model
- Added `@JsonKey(fromJson: _parseDuration)` to the `audio_duration` field
- Added `icon` field to handle the API response properly
- Added `sort_order` field from API response

### 3. Fixed Icon URL Handling
- API returns `icon` field for audio tracks (not `thumbnail`)
- Updated service to add S3 URL prefix to icon field
- Maintains backward compatibility for thumbnail field if present

## Code Changes

### `lib/features/audio/models/audio_models.dart`
```dart
// Custom duration parser
int? _parseDuration(dynamic value) {
  if (value == null) return null;

  if (value is int) return value;

  if (value is String) {
    final parts = value.split(':');
    if (parts.length == 2) {
      // mm:ss format
      final minutes = int.tryParse(parts[0]) ?? 0;
      final seconds = int.tryParse(parts[1]) ?? 0;
      return (minutes * 60) + seconds;
    } else if (parts.length == 3) {
      // hh:mm:ss format
      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;
      final seconds = int.tryParse(parts[2]) ?? 0;
      return (hours * 3600) + (minutes * 60) + seconds;
    }
  }

  return null;
}
```

## Testing
- Audio categories load successfully ✅
- Audio tracks load without errors ✅
- Duration is correctly parsed and displayed ✅
- Audio playback works properly ✅

## API Response Example
```json
{
  "_id": "6411bbb66ed70ead692adbe4",
  "title": "Risk & Contingency 101",
  "audio_duration": "11:34",  // String format
  "audio_file": "category/audio/data/37840cc5-7b78-4cf6-94cd-4de5a849a2f2.mp3",
  "icon": "category/audio/data/2c57d7b4-1661-4d4d-8b44-e5a35dabf564.png"
}
```

## Result
- Duration "11:34" is now correctly parsed to 694 seconds
- The app no longer crashes when loading audio tracks
- Audio player shows correct duration