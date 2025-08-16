import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpath/core/services/global/complaint_service.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  final ComplaintService complaintsService;
  ComplaintsCubit(this.complaintsService) : super(ComplaintsInitial());

  Future<void> addComplaint(Map<String, dynamic> complaintData) async {
    try {
      emit(ComplaintsLoading());
      await complaintsService.sendComplaint(complaintData);
      emit(ComplaintSended());
    } catch (e) {
      emit(ComplaintsError(e.toString()));
    }
  }
}
