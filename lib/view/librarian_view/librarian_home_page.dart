// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smartpath/view/librarian_view/librarian_routes.dart';

class LibrarianHomePage extends StatefulWidget {
  LibrarianHomePage({super.key});

  @override
  State<LibrarianHomePage> createState() => _LibrarianHomePageState();
}

class _LibrarianHomePageState extends State<LibrarianHomePage> {
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            result = await Get.to(
              MobileScanner(
                fit: BoxFit.contain,
                onDetect: (barcodes) {
                  log(barcodes.barcodes.first.rawValue.toString());
                  Get.back(result: barcodes.barcodes.first.rawValue.toString());
                  setState(() {});
                },
              ),
            );
            log(result);
          },

          child: Text(result ?? 'Scan somthing'),
        ),
      ),
    );
  }
}
