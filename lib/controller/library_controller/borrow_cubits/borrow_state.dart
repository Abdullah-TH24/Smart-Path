part of 'borrow_cubit.dart';

sealed class BorrowState {}

final class BorrowInitial extends BorrowState {}

final class BorrowLoading extends BorrowState {}

final class BorrowLoaded extends BorrowState {
  final List<BorrowModel> borrowModel;
  BorrowLoaded(this.borrowModel);
}

final class BorrowRequestSuccess extends BorrowState {}

final class BorrowModifySuccess extends BorrowState {}

final class BorrowError extends BorrowState {
  final String message;
  BorrowError(this.message);
}
