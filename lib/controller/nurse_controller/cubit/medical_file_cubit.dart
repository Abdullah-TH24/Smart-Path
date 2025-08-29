import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpath/core/services/nurse_services/medical_files_services.dart';

part 'medical_file_state.dart';

class MedicalFileCubit extends Cubit<MedicalFileState> {
  final MedicalFilesServices _service;

  MedicalFileCubit(this._service) : super(MedicalFileInitial());

  Future<void> addMedicalFile(Map<String, dynamic> data) async {
    emit(MedicalFileLoading());
    try {
      await _service.addMedicalFile(data);

      emit(MedicalFileSuccess());
    } catch (e) {
      emit(MedicalFileError(e.toString()));
    }
  }
}
