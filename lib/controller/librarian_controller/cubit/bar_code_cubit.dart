import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodeCubit extends Cubit<String?> {
  BarcodeCubit() : super(null);

  void setBarcode(String barcode) {
    emit(barcode);
  }

  void clearBarcode() {
    emit(null);
  }
}
