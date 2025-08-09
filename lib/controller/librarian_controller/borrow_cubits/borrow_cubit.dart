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
      if (filter == 'pending') {
        final List<BorrowModel> pendingBorrows = allBorrows
            .where((element) => element.borrowStatus == 'pending')
            .toList();
        print(pendingBorrows);
        pendingBorrows.isNotEmpty
            ? emit(BorrowLoaded(pendingBorrows))
            : emit(BorrowInitial());
      }
      if (filter == 'accepted') {
        final List<BorrowModel> approvedBorrows = allBorrows
            .where((element) => element.borrowStatus == 'accepted')
            .toList();
        approvedBorrows.isNotEmpty
            ? emit(BorrowLoaded(approvedBorrows))
            : emit(BorrowInitial());
      }
      if (filter == 'rejected') {
        final List<BorrowModel> rejectedBorrows = allBorrows
            .where((element) => element.borrowStatus == 'rejected')
            .toList();
        print(rejectedBorrows);
        rejectedBorrows.isNotEmpty
            ? emit(BorrowLoaded(rejectedBorrows))
            : emit(BorrowInitial());
      }
      if (filter == 'returned') {
        final List<BorrowModel> returnedBorrows = allBorrows
            .where((element) => element.borrowStatus == 'returned')
            .toList();
        returnedBorrows.isNotEmpty
            ? emit(BorrowLoaded(returnedBorrows))
            : emit(BorrowInitial());
      }
      if (filter == 'all') {
        allBorrows.isNotEmpty
            ? emit(BorrowLoaded(allBorrows))
            : emit(BorrowInitial());
      }
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
