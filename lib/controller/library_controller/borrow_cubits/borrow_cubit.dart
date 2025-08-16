import 'dart:developer';

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

      if (filter == 'all') {
        emitFilteredBorrows(allBorrows);
        return;
      }

      final filteredList = filterBorrows(allBorrows, filter);
      emitFilteredBorrows(filteredList);
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
      log('borrow book process started');
      await borrowServices.borrowBook(serialnum);
      emit(BorrowRequestSuccess());
    } catch (e) {
      emit(BorrowError(e.toString()));
      log(e.toString());
    }
  }

  //helper function for filtering the borrows
  List<BorrowModel> filterBorrows(List<BorrowModel> allBorrows, String filter) {
    return allBorrows
        .where((element) => element.borrowStatus == filter)
        .toList();
  }

  void emitFilteredBorrows(List<BorrowModel> borrows) {
    borrows.isNotEmpty ? emit(BorrowLoaded(borrows)) : emit(BorrowInitial());
  }
}
