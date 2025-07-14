import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/events/custom_text_button.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class StudentPortfolioPage extends StatelessWidget {
  const StudentPortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> reactions = [
      'assets/images/love.png',
      'assets/images/haha.png',
      'assets/images/like.png',
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'grid_item_name_7'.tr, enableLeading: false),
          SliverToBoxAdapter(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:
                  (context, index) => SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.indigo[100],
                                child: const Icon(LucideIcons.user2),
                              ),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Abdullah TH',
                                    style: AppStyles.styleMedium14(),
                                  ),
                                  Text(
                                    'Sponsored',
                                    style: AppStyles.styleRegular12().copyWith(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            'Lorem ipsum, dolor sit amet consectetur adipisi cing elit Eligendi, vero quos!',
                            style: AppStyles.styleRegular14(),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 300,
                              width: Get.width,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                    height: 300,
                                    child: Image.network(
                                      'https://i.pinimg.com/736x/3d/f8/99/3df899e99c7f832524a9a7b92bcba112.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 300,
                                    child: Image.network(
                                      'https://www.denverpost.com/wp-content/uploads/2017/03/film-bossbaby-review-adv31-0923825e-14be-11e7-833c-503e1f6394c9.jpg?w=599',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 300,
                                    child: Image.network(
                                      'https://i.pinimg.com/736x/29/8a/48/298a4816d22231f7a7cd54c7017843e2.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 30,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 2.5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                                child: const Text(
                                  '2 / 3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 25,
                                width: 100,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                    reactions.length,
                                    (index) => Positioned(
                                      left: index * 15,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,
                                        child: ClipOval(
                                          child: Image.asset(
                                            reactions[index],
                                            width: 20,
                                            height: 20,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '125 Comments',
                                    style: AppStyles.styleRegular12().copyWith(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const Gap(7.5),
                                  Text(
                                    '25 Shares',
                                    style: AppStyles.styleRegular12().copyWith(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          padding: const EdgeInsetsGeometry.only(
                            left: 5,
                            right: 5,
                          ),
                          child: const Divider(color: Colors.black54),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextButton(
                              title: 'Like',
                              icon: Icons.thumb_up_alt_outlined,
                              onPressed: () {},
                            ),
                            CustomTextButton(
                              title: 'Comment',
                              icon: Icons.mode_comment_outlined,
                              onPressed: () {},
                            ),
                            CustomTextButton(
                              title: 'Share',
                              icon: LucideIcons.share2,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              separatorBuilder:
                  (context, index) =>
                      Container(height: 10, color: Colors.indigo[100]),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
