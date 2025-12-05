import 'package:equatable/equatable.dart';
import 'package:eyo_bingo/features/admin/data/models/analytics_model.dart';

class SuperAdminState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final AnalyticsResponse? analytics;

  const SuperAdminState({
    required this.isLoading,
    this.errorMessage,
    this.analytics,
  });

  SuperAdminState copyWith({
    bool? isLoading,
    String? errorMessage,
    AnalyticsResponse? analytics,
    bool clearError = false,
  }) {
    return SuperAdminState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      analytics: analytics ?? this.analytics,
    );
  }

  factory SuperAdminState.initial() {
    return const SuperAdminState(
      isLoading: false,
      errorMessage: null,
      analytics: null,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, analytics];
}
