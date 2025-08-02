import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smartpath/controller/librarian_controller/cubit/bar_code_cubit.dart';

class LibrarianBarCodeScan extends StatefulWidget {
  LibrarianBarCodeScan({super.key});

  @override
  State<LibrarianBarCodeScan> createState() => _LibrarianBarCodeScanState();
}

class _LibrarianBarCodeScanState extends State<LibrarianBarCodeScan> {
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
        log(result);
        if (result != null) {
          context.read<BarcodeCubitAdd>().setBarcode(result);
        }
      },
      child: const Icon(Icons.qr_code_2_outlined, size: 25),
    );
  }
}
