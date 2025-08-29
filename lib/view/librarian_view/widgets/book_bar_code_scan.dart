import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smartpath/controller/library_controller/books_cubits/bar_code_cubit.dart';

class BookBarCodeScan extends StatefulWidget {
  const BookBarCodeScan({super.key});

  @override
  State<BookBarCodeScan> createState() => _BookBarCodeScanState();
}

class _BookBarCodeScanState extends State<BookBarCodeScan> {
  var result;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 45),
        backgroundColor: Colors.brown,
        foregroundColor: const Color.fromARGB(198, 241, 231, 220),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      onPressed: () async {
        result = await Get.to(
          MobileScanner(
            fit: BoxFit.contain,
            onDetect: (barcodes) {
              log(barcodes.barcodes.first.rawValue.toString());
              Get.back(result: barcodes.barcodes.first.rawValue.toString());
            },
          ),
        );
        // log(result);
        if (result != null) {
          context.read<BarcodeCubit>().setBarcode(result);
        }
      },
      child: const Icon(Icons.qr_code_2_outlined, size: 25),
    );
  }
}
