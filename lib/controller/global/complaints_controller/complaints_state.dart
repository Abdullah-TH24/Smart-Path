part of 'complaints_cubit.dart';

abstract class ComplaintsState {
  const ComplaintsState();
}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintSended extends ComplaintsState {}

class ComplaintsError extends ComplaintsState {
  final String message;

  ComplaintsError(this.message);
}
