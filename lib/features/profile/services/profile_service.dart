import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../../core/errors/failures.dart';

class ProfileService {
  final ApiClient _apiClient = ApiClient();

  // Change Username
  Future<Map<String, dynamic>> changeUsername(String username) async {
    try {
      final response = await _apiClient.post(
        '/self/change_username',
        data: {
          'username': username,
        },
      );

      return {
        'success': response.data['success'] ?? response.statusCode == 200,
        'message': response.data['message'] ?? 'Username updated successfully',
        'data': response.data,
      };
    } on AppException catch (e) {
      return {'success': false, 'message': e.message};
    } on DioException catch (e) {
      final message = (e.response?.data is Map
              ? (e.response!.data as Map)['message']?.toString()
              : null) ??
          'Failed to update username. Please try again.';
      return {'success': false, 'message': message};
    } catch (e) {
      return {
        'success': false,
        'message': 'Failed to update username. Please try again.',
      };
    }
  }

  // Change Email
  Future<Map<String, dynamic>> changeEmail(String email) async {
    try {
      final response = await _apiClient.post(
        '/self/change_email',
        data: {
          'email': email,
        },
      );

      return {
        'success': response.data['success'] ?? true,
        'message': response.data['message'] ?? 'Email updated successfully',
        'data': response.data,
      };
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['message'] != null) {
        return {
          'success': false,
          'message': e.response!.data['message'],
        };
      }
      return {
        'success': false,
        'message': 'Failed to update email',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred',
      };
    }
  }

  // Change Password
  Future<Map<String, dynamic>> changePassword(String password) async {
    try {
      final response = await _apiClient.post(
        '/self/change_password',
        data: {
          'password': password,
        },
      );

      return {
        'success': response.statusCode == 200,
        'message': response.data['message'] ?? 'Password updated successfully',
        'data': response.data,
      };
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['message'] != null) {
        return {
          'success': false,
          'message': e.response!.data['message'],
        };
      }
      return {
        'success': false,
        'message': 'Failed to update password',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred',
      };
    }
  }

  // Upload Profile Picture
  Future<Map<String, dynamic>> uploadProfilePicture(String imagePath) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
      });

      final response = await _apiClient.post(
        '/self/upload_profile_picture',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      return {
        'success': response.statusCode == 200,
        'message': response.data['message'] ?? 'Profile picture updated successfully',
        'data': response.data,
      };
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? 'Failed to upload profile picture',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred while uploading',
      };
    }
  }
}