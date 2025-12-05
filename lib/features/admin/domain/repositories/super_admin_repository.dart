import 'package:eyo_bingo/core/models/api_response.dart';
import 'package:eyo_bingo/features/admin/data/models/analytics_model.dart';

abstract class SuperAdminRepository {
  Future<ApiResponse<AnalyticsResponse>> getAnalytics();
  Future<ApiResponse<Map<String, dynamic>>> getAdminDetail(String adminId);
  Future<ApiResponse<Map<String, dynamic>>> addCreditsToAdmin(
    String adminId,
    int credits,
  );
  Future<ApiResponse<Map<String, dynamic>>> subtractCreditsFromAdmin(
    String adminId,
    int credits,
  );
  Future<ApiResponse<Map<String, dynamic>>> setAdminCredits(
    String adminId,
    int credits,
  );
  Future<ApiResponse<Map<String, dynamic>>> setGameCost(
    String adminId,
    String gameType,
    int cost,
  );
}
