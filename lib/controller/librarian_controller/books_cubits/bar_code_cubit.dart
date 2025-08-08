import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodeCubitAdd extends Cubit<String?> {
  BarcodeCubitAdd() : super(null);

  void setBarcode(String barcode) {
    emit(barcode);
  }

  void clearBarcode() {
    emit(null);
  }
}
