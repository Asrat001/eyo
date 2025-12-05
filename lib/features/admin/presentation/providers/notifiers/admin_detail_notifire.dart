import 'package:eyo_bingo/core/utils/network_exceptions_utils.dart';
import 'package:eyo_bingo/features/admin/domain/repositories/super_admin_repository.dart';
import 'package:eyo_bingo/features/admin/presentation/providers/states/admin_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminDetailNotifier extends StateNotifier<AdminDetailState> {
  final SuperAdminRepository _repository;
  AdminDetailNotifier(this._repository) : super(AdminDetailState.initial());


Future<void> getAdminDetail(String adminId) async {
  state = state.copyWith(isLoading: true);
  final result = await _repository.getAdminDetail(adminId);
  result.when(
    success: (adminDetail) {
      state = state.copyWith(isLoading: false, adminDetail: adminDetail);
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