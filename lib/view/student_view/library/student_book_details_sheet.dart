// ignore_for_file:  use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smartpath/controller/library_controller/borrow_cubits/borrow_cubit.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';

class StudentBookDetailsSheet extends StatelessWidget {
  final BookModel book;
  final BorrowCubit borrowCubit;

  const StudentBookDetailsSheet({
    super.key,
    required this.book,
    required this.borrowCubit,
  });

  @override
  Widget build(BuildContext context) {
    var result;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: AppStyles.styleBold22()),
            const SizedBox(height: 8),
            Text("${'author'.tr}: ${book.author}"),
            const Divider(endIndent: 64),
            Text("${'category'.tr}: ${book.category}"),
            const Divider(endIndent: 64),
            Text("${'publisher'.tr}: ${book.publisher}"),
            const Divider(endIndent: 64),
            Text("${'shelf_location'.tr}: ${book.shelfLocation}"),
            const Divider(endIndent: 64),
            const SizedBox(height: 8),
            Text("${'description'.tr}: ${book.description}"),
            const SizedBox(height: 16),
            Center(
              child: BlocConsumer<BorrowCubit, BorrowState>(
                listener: (context, state) {
                  if (state is BorrowError) {
                    log('error happened while scanning');
                    Get.rawSnackbar(
                      message: 'Error happened',
                      duration: const Duration(milliseconds: 2),

                      snackPosition: SnackPosition.BOTTOM,
                    );

                    showSnackbar('Error', 'Error happened');
                  }
                  if (state is BorrowRequestSuccess) {
                    log('success');
                    Get.rawSnackbar(
                      message: 'your request sent successfully',
                      duration: const Duration(milliseconds: 2),

                      snackPosition: SnackPosition.BOTTOM,
                    );
                    showSnackbar('success', 'your request sent successfully');
                  }
                },
                builder: (BuildContext context, BorrowState state) {
                  if (state is BorrowLoading) {
                    return const SpinKitSpinningLines(color: Colors.indigo);
                  }

                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      result = await Get.to(
                        MobileScanner(
                          fit: BoxFit.contain,
                          onDetect: (barcodes) {
                            log(barcodes.barcodes.first.rawValue.toString());
                            Get.back(
                              result: barcodes.barcodes.first.rawValue
                                  .toString(),
                            );
                          },
                        ),
                      );
                      log(result ?? 'not scanned');
                      if (result != null) {
                        borrowCubit.borrowBook(result);
                      }
                    },
                    icon: const Icon(LucideIcons.scan), // Lucide scanQR icon
                    label: Text('scan_to_borrow'.tr),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
