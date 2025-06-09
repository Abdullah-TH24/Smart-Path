class HomeGridItemModel {
  final String title;
  final String image;
  final void Function()? onTap;
  HomeGridItemModel({
    required this.onTap,
    required this.title,
    required this.image,
  });
}
