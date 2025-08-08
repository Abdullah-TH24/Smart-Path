import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/controller/librarian_controller/borrow_cubits/borrow_cubit.dart';
import 'package:smartpath/core/services/librarian_services/borrow_services.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_loading_indicator.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianBorrowRequests extends StatelessWidget {
  const LibrarianBorrowRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BorrowCubit(BorrowServices())..fetchBorrowsOrders(filter: 'all'),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            LibrarianWaveAppBar(title: 'lib_grid_3'.tr),
            BlocConsumer<BorrowCubit, BorrowState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is BorrowLoading) {
                  return const LibrarianLoadingIndicator();
                }
                if (state is BorrowLoaded) {
                  final borrows = state.borrowModel;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(borrows[index].user.name),
                          subtitle: Text(borrows[index].user.email),
                          trailing: Text(borrows[index].borrowStatus),
                        ),
                      );
                    }),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No state yet.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
