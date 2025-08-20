part of 'complaints_cubit.dart';

abstract class ComplaintsState {
  const ComplaintsState();
}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintsLoaded extends ComplaintsState {
  final List<ComplaintModel> complaints;

  ComplaintsLoaded({required this.complaints});
}

class ComplaintSended extends ComplaintsState {}

class ComplaintDeleted extends ComplaintsState {}

class ComplaintEdited extends ComplaintsState {}

class ComplaintsError extends ComplaintsState {
  final String message;

  ComplaintsError(this.message);
}
