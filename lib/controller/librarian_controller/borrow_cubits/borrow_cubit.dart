import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpath/core/services/librarian_services/borrow_services.dart';
import 'package:smartpath/models/librarian_model/borrow_model.dart';

part 'borrow_state.dart';

class BorrowCubit extends Cubit<BorrowState> {
  final BorrowServices borrowServices;
  BorrowCubit(this.borrowServices) : super(BorrowInitial());

  Future fetchBorrowsOrders({required String filter}) async {
    try {
      emit(BorrowLoading());
      final allBorrows = await borrowServices.fetchBorrowsOrders();
      if (filter == 'pending') {
        final List<BorrowModel> pendingBorrows = allBorrows
            .where((element) => element.borrowStatus == 'pending')
            .toList();
        emit(BorrowLoaded(pendingBorrows));
      }
      if (filter == 'accepted') {
        final List<BorrowModel> approvedBorrows = allBorrows
            .where((element) => element.borrowStatus == 'accepted')
            .toList();
        emit(BorrowLoaded(approvedBorrows));
      }
      if (filter == 'rejected') {
        final List<BorrowModel> rejectedBorrows = allBorrows
            .where((element) => element.borrowStatus == 'rejected')
            .toList();
        emit(BorrowLoaded(rejectedBorrows));
      }
      if (filter == 'returned') {
        final List<BorrowModel> returnedBorrows = allBorrows
            .where((element) => element.borrowStatus == 'returned')
            .toList();
        emit(BorrowLoaded(returnedBorrows));
      }

      emit(BorrowLoaded(allBorrows));
    } catch (e) {
      emit(BorrowError(e.toString()));
    }
  }

  Future modifyBorrow(Map<String, dynamic> modifyInfo) async {
    try {
      emit(BorrowLoading());
      await borrowServices.modifyBorrow(modifyInfo);
      emit(BorrowModifySuccess());
    } catch (e) {
      emit(BorrowError(e.toString()));
    }
  }

  Future borrowBook(String serialnum) async {
    try {
      emit(BorrowLoading());
      await borrowServices.borrowBook(serialnum);
      emit(BorrowRequestSuccess());
    } catch (e) {
      emit(BorrowError(e.toString()));
    }
  }
}
