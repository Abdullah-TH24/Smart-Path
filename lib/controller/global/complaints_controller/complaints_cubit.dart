import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpath/core/services/global/complaint_service.dart';
import 'package:smartpath/models/global/complaint_model.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  final ComplaintService _complaintsService;
  ComplaintsCubit(this._complaintsService) : super(ComplaintsInitial());

  Future<void> sendComplaint(Map<String, dynamic> complaintData) async {
    try {
      emit(ComplaintsLoading());
      await _complaintsService.sendComplaint(complaintData);
      emit(ComplaintSended());
    } catch (e) {
      emit(ComplaintsError(e.toString()));
    }
  }

  Future<void> fetchUserComplaints() async {
    try {
      emit(ComplaintsLoading());
      final complaints = await _complaintsService.getComplaints();
      if (complaints == null || complaints.isEmpty) {
        emit(ComplaintsInitial());
        return;
      }
      emit(ComplaintsLoaded(complaints: complaints));
    } catch (e) {
      emit(ComplaintsError(e.toString()));
    }
  }

  Future<void> editComplaint(Map<String, dynamic> complaintData) async {
    try {
      emit(ComplaintsLoading());
      await _complaintsService.updateComplaint(complaintData);
      emit(ComplaintEdited());
    } catch (e) {
      log(e.toString());
      emit(ComplaintsError(e.toString()));
    }
  }

  Future<void> deleteComplaint(num id) async {
    try {
      emit(ComplaintsLoading());
      await _complaintsService.deleteComplaint(id);
      emit(ComplaintDeleted());
    } catch (e) {
      log(e.toString());
      emit(ComplaintsError(e.toString()));
    }
  }
}
