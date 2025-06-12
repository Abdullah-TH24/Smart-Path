class GridItemModel {
  final String assetName;
  final String title;
  final void Function()? onTap;
  GridItemModel({
    required this.assetName,
    required this.title,
    required this.onTap,
  });
}
