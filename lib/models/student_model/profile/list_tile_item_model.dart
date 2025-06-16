class ListTileItemModel {
  final String assetName;
  final String title;
  final void Function()? onTap;
  ListTileItemModel({
    required this.assetName,
    required this.title,
    required this.onTap,
  });
}
