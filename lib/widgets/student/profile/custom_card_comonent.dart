import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String data;
  final TextStyle? style;
  const CustomCard({
    super.key,
    required this.icon,
    required this.data,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(data, style: style),
      ),
    );
  }
}
