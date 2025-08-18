// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/library_controller/borrow_cubits/borrow_cubit.dart';
import 'package:smartpath/core/services/librarian_services/borrow_services.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/librarian_view/widgets/accept_button.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_loading_indicator.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';
import 'package:smartpath/view/librarian_view/widgets/reject_button.dart';

class LibrarianBorrowPendingRequests extends StatelessWidget {
  const LibrarianBorrowPendingRequests({super.key});
  static const filter = 'pending';

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime dueDate = now.add(const Duration(days: 5));
    final String dueDateFormat =
        "${dueDate.year}-${dueDate.month}-${dueDate.day}";
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BorrowCubit(BorrowServices())..fetchBorrowsOrders(filter: filter),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            LibrarianWaveAppBar(title: 'lib_grid_3'.tr),
            BlocConsumer<BorrowCubit, BorrowState>(
              listener: (context, state) {
                log(state.toString());
                if (state is BorrowError) {
                  showSnackbar('Error', state.message);
                }
                if (state is BorrowModifySuccess) {
                  showSnackbar('Info', 'Borrow modified successfully');
                  context.read<BorrowCubit>().fetchBorrowsOrders(
                    filter: filter,
                  );
                }
              },
              builder: (context, state) {
                if (state is BorrowLoading) {
                  return const SliverLibrarianLoadingIndicator();
                }
                if (state is BorrowLoaded) {
                  final borrows = state.borrowModel;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: borrows.length,
                      (context, index) {
                        return Column(
                          children: [
                            Card(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              elevation: 0,
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text(borrows[index].title),
                                subtitle: Text(
                                  borrows[index].borrower.fullName,
                                ),
                                trailing: Text(borrows[index].borrowStatus),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                color: Color.fromARGB(198, 241, 228, 215),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AcceptButton(
                                    id: borrows[index].id,
                                    dueDateFormat: dueDateFormat,
                                  ),
                                  RejectButton(id: borrows[index].id),
                                ],
                              ),
                            ),
                            const Gap(12),
                          ],
                        );
                      },
                    ),
                  );
                }
                if (state is BorrowError) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No data an error occured')),
                  );
                }
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Image.asset(AppAssets.noData),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
