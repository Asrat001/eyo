import 'package:eyo_bingo/core/models/api_response.dart';
import 'package:eyo_bingo/features/admin/data/datasources/super_admin_remotedatasoursce.dart';
import 'package:eyo_bingo/features/admin/data/models/analytics_model.dart';
import 'package:eyo_bingo/features/admin/domain/repositories/super_admin_repository.dart';

class SuperAdminRepositoryImpl implements SuperAdminRepository {
  final SuperAdminRemoteDataSource _remoteDataSource;

  SuperAdminRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<AnalyticsResponse>> getAnalytics() {
    return _remoteDataSource.getAnalytics();
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> addCreditsToAdmin(
    String adminId,
    int credits,
  ) {
    return _remoteDataSource.addCreditsToAdmin(adminId, credits);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> subtractCreditsFromAdmin(
    String adminId,
    int credits,
  ) {
    return _remoteDataSource.subtractCreditsFromAdmin(adminId, credits);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> setAdminCredits(
    String adminId,
    int credits,
  ) {
    return _remoteDataSource.setAdminCredits(adminId, credits);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> setGameCost(
    String adminId,
    String gameType,
    int cost,
  ) {
    return _remoteDataSource.setGameCost(adminId, gameType, cost);
  }


  @override
  Future<ApiResponse<Map<String, dynamic>>> getAdminDetail(String adminId) {
    return _remoteDataSource.getAdminDetail(adminId);
  }
}
