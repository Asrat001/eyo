import 'package:eyo_bingo/core/utils/network_exceptions_utils.dart';
import 'package:eyo_bingo/features/admin/domain/repositories/super_admin_repository.dart';
import 'package:eyo_bingo/features/admin/presentation/providers/states/super_admin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuperAdminNotifier extends StateNotifier<SuperAdminState> {
  final SuperAdminRepository _superAdminRepository;

  SuperAdminNotifier(this._superAdminRepository)
    : super(SuperAdminState.initial());

  Future<void> getAnalytics() async {
    state = state.copyWith(isLoading: true);
    final result = await _superAdminRepository.getAnalytics();
    result.when(
      success: (analytics) {
        state = state.copyWith(isLoading: false, analytics: analytics);
      },
      failure: (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: NetworkExceptions.getErrorMessage(failure),
        );
      },
    );
  }
}
