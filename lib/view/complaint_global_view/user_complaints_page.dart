import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/global/complaints_controller/complaints_cubit.dart';
import 'package:smartpath/core/services/global/complaint_service.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_colors.dart';
import 'package:smartpath/view/complaint_global_view/widgets/complaint_card_widget.dart';
import 'package:smartpath/view/complaint_global_view/widgets/complaint_dialog_widget.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_loading_indicator.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class UserComplaintsPage extends StatelessWidget {
  const UserComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LibrarianWaveAppBar(title: 'lib_grid_7'.tr),
          BlocProvider(
            create: (_) =>
                ComplaintsCubit(ComplaintService())..fetchUserComplaints(),
            child: BlocConsumer<ComplaintsCubit, ComplaintsState>(
              listener: (context, state) {
                if (state is ComplaintDeleted) {
                  showSnackbar('success'.tr, 'delete_complaint_success'.tr);
                  context.read<ComplaintsCubit>().fetchUserComplaints();
                }
                if (state is ComplaintEdited) {
                  showSnackbar('success'.tr, 'edit_complaint_success'.tr);
                  context.read<ComplaintsCubit>().fetchUserComplaints();
                }
                if (state is ComplaintsError) {
                  showSnackbar('error'.tr, state.message);
                }
              },
              builder: (context, state) {
                if (state is ComplaintsLoading || state is ComplaintDeleted) {
                  return const SliverLoadingIndicator();
                }
                if (state is ComplaintsLoaded) {
                  return SliverList.builder(
                    itemCount: state.complaints.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.dialog(
                            ComplaintDialog(
                              complaint: state.complaints[index],
                              cubit: context.read<ComplaintsCubit>(),
                            ),
                          );
                        },
                        child: ComplaintCardWidget(
                          title: state.complaints[index].category,
                        ),
                      );
                    },
                  );
                }
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: Image.asset(AppAssets.noData),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
