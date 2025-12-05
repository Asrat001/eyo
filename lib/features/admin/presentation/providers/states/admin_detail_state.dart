import 'package:equatable/equatable.dart';

class AdminDetailState extends Equatable {
 final bool isLoading;
 final String?errorMessage;
 final Map<String,dynamic>?adminDetail;


  const AdminDetailState({
    this.isLoading = false,
    this.errorMessage,
    this.adminDetail,
  });


 factory AdminDetailState.initial() {
   return AdminDetailState();
 }


AdminDetailState copyWith({
  bool? isLoading,
  String? errorMessage,
  Map<String, dynamic>? adminDetail,
}) {
  return AdminDetailState(
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage ?? this.errorMessage,
    adminDetail: adminDetail ?? this.adminDetail,
  );
}



    @override
    List<Object?> get props => [isLoading,errorMessage,adminDetail];
}