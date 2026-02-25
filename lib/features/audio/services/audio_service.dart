import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../models/audio_models.dart';

class AudioApiService {
  final ApiClient _apiClient;

  AudioApiService(this._apiClient);

  // Get audio categories - matching React Native implementation
  Future<List<AudioCategory>> getAudioCategories() async {
    try {
      final response = await _apiClient.get('/user/categories');

      print('Audio categories response: ${response.data}');

      // React Native expects response.data.data.Category
      if (response.data != null && response.data['data'] != null) {
        final data = response.data['data'];

        // The categories are in the 'Category' field
        if (data['Category'] != null) {
          final categoriesList = data['Category'] as List;
          final categories = categoriesList.map((json) {
            // Add S3 URL to icon if it exists
            if (json['icon'] != null && !json['icon'].startsWith('http')) {
              json['icon'] = 'https://critical-alpha-web.s3.us-west-1.amazonaws.com/${json['icon']}';
            }
            return AudioCategory.fromJson(json);
          }).toList();
          return categories;
        }
      }

      // Fallback if structure is different
      if (response.data is List) {
        return (response.data as List)
            .map((json) => AudioCategory.fromJson(json))
            .toList();
      }

      throw Exception('Invalid response structure');
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Error fetching categories: $e');
    }
  }

  // Get audio tracks for a category - matching React Native implementation
  Future<List<AudioTrack>> getAudioTracks(String categoryId) async {
    try {
      // React Native uses GET with query parameter
      final response = await _apiClient.get(
        '/user/categories/audios?category_id=$categoryId'
      );

      print('Audio tracks response: ${response.data}');

      // React Native expects response.data.data.AudioByCategory
      if (response.data != null && response.data['data'] != null) {
        final data = response.data['data'];

        // The tracks are in the 'AudioByCategory' field
        if (data['AudioByCategory'] != null) {
          final tracksList = data['AudioByCategory'] as List;
          final tracks = tracksList.map((json) {
            // Add S3 URL to audio_file if it exists
            if (json['audio_file'] != null && !json['audio_file'].startsWith('http')) {
              json['audio_file'] = 'https://critical-alpha-web.s3.us-west-1.amazonaws.com/${json['audio_file']}';
            }
            // Add S3 URL to icon if it exists (the API returns 'icon' instead of 'thumbnail')
            if (json['icon'] != null && !json['icon'].startsWith('http')) {
              json['icon'] = 'https://critical-alpha-web.s3.us-west-1.amazonaws.com/${json['icon']}';
            }
            // Also handle thumbnail if it exists
            if (json['thumbnail'] != null && !json['thumbnail'].startsWith('http')) {
              json['thumbnail'] = 'https://critical-alpha-web.s3.us-west-1.amazonaws.com/${json['thumbnail']}';
            }
            return AudioTrack.fromJson(json);
          }).toList();
          return tracks;
        }
      }

      // Fallback if structure is different
      if (response.data is List) {
        return (response.data as List)
            .map((json) => AudioTrack.fromJson(json))
            .toList();
      }

      throw Exception('Invalid response structure');
    } catch (e) {
      print('Error fetching audio tracks: $e');
      throw Exception('Error fetching audio tracks: $e');
    }
  }

  // Update play count or track progress
  Future<void> updateTrackProgress({
    required String trackId,
    required int position,
    int? playCount,
  }) async {
    try {
      await _apiClient.post('/user/track-progress', data: {
        'track_id': trackId,
        'position': position,
        'play_count': playCount,
      });
    } catch (e) {
      // Silently fail - this is not critical
      print('Failed to update track progress: $e');
    }
  }

  // Mark track as favorite
  Future<void> toggleFavorite(String trackId, bool isFavorite) async {
    try {
      await _apiClient.post('/user/favorite-track', data: {
        'track_id': trackId,
        'is_favorite': isFavorite,
      });
    } catch (e) {
      throw Exception('Error toggling favorite: $e');
    }
  }
}