class ProfileTileItemModel {
  final String title;
  final String image;
  final void Function()? onTap;

  ProfileTileItemModel({
    required this.title,
    required this.image,
    required this.onTap,
  });
}
