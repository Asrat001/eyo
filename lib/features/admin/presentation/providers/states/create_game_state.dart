import 'package:equatable/equatable.dart';

class CreateGameState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? error;
  final String selectedPattern;
  final String selectedMode;

  const CreateGameState({
    required this.isLoading,
    this.error,
    required this.isSuccess,
    required this.selectedPattern,
    required this.selectedMode,
  });

  CreateGameState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    String? selectedPattern,
    String? selectedMode,
    bool clearError = false,
  }) {
    return CreateGameState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      isSuccess: isSuccess ?? this.isSuccess,
      selectedPattern: selectedPattern ?? this.selectedPattern,
      selectedMode: selectedMode ?? this.selectedMode,
    );
  }

  factory CreateGameState.initial() {
    return const CreateGameState(
      isLoading: false,
      isSuccess: false,
      error: null,
      selectedPattern: 'any-line',
      selectedMode: 'auto',
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    error,
    isSuccess,
    selectedPattern,
    selectedMode,
  ];
}
