import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/widgets/book_cover.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(198, 241, 228, 215),
      shadowColor: Colors.brown.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Expanded(flex: 2, child: BookCover()),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleBold16(),
                    ),
                    const Gap(16),
                    Text(
                      'by ${book.author}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleRegular14(),
                    ),
                    const Gap(8),
                    Text(
                      'category: ${book.category}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleRegular14(),
                    ),
                    const Gap(8),
                    Text(
                      'publisher: ${book.publisher}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleRegular14(),
                    ),
                    const Gap(8),
                    Text(
                      'Shelf: ${book.shelfLocation}',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleRegular14(),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(4),
          ],
        ),
      ),
    );
  }
}
