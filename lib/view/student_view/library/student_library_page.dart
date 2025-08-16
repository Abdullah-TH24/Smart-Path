import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/library_controller/books_cubits/books_cubit.dart';
import 'package:smartpath/controller/library_controller/borrow_cubits/borrow_cubit.dart';
import 'package:smartpath/core/services/librarian_services/books_service.dart';
import 'package:smartpath/core/services/librarian_services/borrow_services.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/student_view/library/student_book_card.dart';
import 'package:smartpath/view/student_view/library/student_book_details_sheet.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';

class StudentLibraryPage extends StatelessWidget {
  const StudentLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    log(prefs!.getString('token')!);
    return CustomScrollView(
      slivers: [
        AppBarComponent(data: 'library'.tr, enableLeading: false),
        SliverToBoxAdapter(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    BooksCubit(BooksService())..fetchAvailableBooks(),
              ),
              BlocProvider(create: (context) => BorrowCubit(BorrowServices())),
            ],
            child: BlocConsumer<BooksCubit, BooksState>(
              listener: (context, state) {
                if (state is BooksError) {
                  showSnackbar('error', state.message);
                }
                if (state is BooksLoaded) {
                  if (state.books.isEmpty) {
                    showSnackbar('info', 'no books');
                  }
                }
              },
              builder: (context, state) {
                if (state is BooksLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .6,
                    child: const Center(
                      child: SpinKitSpinningLines(color: Colors.indigo),
                    ),
                  );
                } else if (state is BooksLoaded) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 5,
                        ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        final borrowCubit = context.read<BorrowCubit>();
                        showModalBottomSheet(
                          context: context,
                          barrierColor: Colors.indigo.withAlpha(25),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => BlocProvider.value(
                            value: borrowCubit,
                            child: StudentBookDetailsSheet(
                              book: state.books[index],
                              borrowCubit: borrowCubit,
                            ),
                          ),
                        );
                      },
                      child: StudentBookCard(bookModel: state.books[index]),
                    ),
                    itemCount: state.books.length,
                  );
                } else if (state is BooksError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No state yet.')),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
