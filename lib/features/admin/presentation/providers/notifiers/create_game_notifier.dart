import 'package:eyo_bingo/core/utils/network_exceptions_utils.dart';
import 'package:eyo_bingo/features/admin/domain/repositories/admin_repository.dart';
import 'package:eyo_bingo/features/admin/presentation/providers/states/create_game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateGameNotifier extends StateNotifier<CreateGameState> {
  final AdminRepository _repository;
  CreateGameNotifier(this._repository) : super(CreateGameState.initial());

  Future<void> createGame({
    required int maxPlayers,
    required int autoCallInterval,
    required double playerEntryFee,
    required int profitPercentage,
    required String selectedPattern,
    required String selectedMode,
  }) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.createGame(
      maxPlayers: maxPlayers,
      winningPattern: selectedPattern,
      autoCallInterval: autoCallInterval,
      markingMode: selectedMode,
      playerEntryFee: playerEntryFee,
      profitPercentage: profitPercentage,
    );
    result.when(
      success: (_) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void setSelectedPattern(String pattern) {
    state = state.copyWith(selectedPattern: pattern);
  }

  void setSelectedMode(String mode) {
    state = state.copyWith(selectedMode: mode);
  }

  void resetState() {
    state = state.copyWith(isSuccess: false, clearError: true);
  }
}
