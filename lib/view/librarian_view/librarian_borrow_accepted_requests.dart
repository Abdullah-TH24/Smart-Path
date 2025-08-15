// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/librarian_controller/borrow_cubits/borrow_cubit.dart';
import 'package:smartpath/core/services/librarian_services/borrow_services.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/view/librarian_view/widgets/accepted_request_list_tile.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_loading_indicator.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianBorrowAcceptedRequests extends StatelessWidget {
  const LibrarianBorrowAcceptedRequests({super.key});
  static const filter = 'accepted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BorrowCubit(BorrowServices())..fetchBorrowsOrders(filter: filter),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            LibrarianWaveAppBar(title: 'lib_grid_4'.tr),
            BlocBuilder<BorrowCubit, BorrowState>(
              builder: (context, state) {
                if (state is BorrowLoading) {
                  return const LibrarianLoadingIndicator();
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
                              child: AcceptedRequestListTile(
                                borrows: borrows[index],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              height: 5,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                color: Color.fromARGB(143, 65, 216, 78),
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
