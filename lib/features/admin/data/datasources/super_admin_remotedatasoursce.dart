import 'package:eyo_bingo/core/data/models/bingo/user_model.dart';
import 'package:eyo_bingo/core/models/api_response.dart';
import 'package:eyo_bingo/core/service/dio_service.dart';
import 'package:eyo_bingo/core/utils/network_exceptions_utils.dart';
import 'package:eyo_bingo/features/admin/data/models/analytics_model.dart';
import 'package:logger/logger.dart';

class SuperAdminRemoteDataSource {
  final DioHttpClient _dioClient;
  final Logger _logger = Logger();

  SuperAdminRemoteDataSource(this._dioClient);

  Future<ApiResponse<List<UserModel>>> getAdmins() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/admin-management/admins');

      final admins = (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${admins.length} admins');
      return ApiResponse.success(data: admins);
    } catch (e) {
      _logger.e('Failed to get admins', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse<AnalyticsResponse>> getAnalytics() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/admin-management/analytics');

      final analytics = AnalyticsResponse.fromJson(response.data);
      _logger.i('Retrieved analytics');
      return ApiResponse.success(data: analytics);
    } catch (e) {
      _logger.e('Failed to get super admin analytics', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> addCreditsToAdmin(
    String adminId,
    int credits,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/admin-credits/add',
            data: {'adminId': adminId, 'credits': credits},
          );

      _logger.i('Added $credits credits to admin: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to add credits to admin', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> subtractCreditsFromAdmin(
    String adminId,
    int credits,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/admin-credits/subtract',
            data: {'adminId': adminId, 'credits': credits},
          );

      _logger.i('Subtracted $credits credits from admin: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to subtract credits from admin', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> setAdminCredits(
    String adminId,
    int credits,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/admin-credits/set',
            data: {'adminId': adminId, 'credits': credits},
          );

      _logger.i('Set admin credits to $credits: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to set admin credits', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> setGameCost(
    String adminId,
    String gameType,
    int cost,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/game-cost',
            data: {'adminId': adminId, 'gameType': gameType, 'cost': cost},
          );

      _logger.i('Set game cost to $cost for game type $gameType: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to set game cost', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }



  Future<ApiResponse<Map<String, dynamic>>> getAdminDetail(String adminId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/admin-management/admins/$adminId/analytics');

      _logger.i('Retrieved admin detail for admin: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to get admin detail', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
