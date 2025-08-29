part of 'medical_file_cubit.dart';

sealed class MedicalFileState {
  const MedicalFileState();
}

class MedicalFileInitial extends MedicalFileState {}

class MedicalFileLoading extends MedicalFileState {}

class MedicalFileSuccess extends MedicalFileState {}

class MedicalFileError extends MedicalFileState {
  final String message;

  const MedicalFileError(this.message);
}
