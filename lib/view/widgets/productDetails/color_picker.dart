import 'package:flutter/material.dart';
import 'package:shop_app/view/widgets/auth/container_under.dart';
class ColorsPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  const ColorsPicker({required  this.color,required this.outerBorder,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:outerBorder?Border.all(color: color,width: 2):null,
      ),
      child: Container(
    padding: const EdgeInsets.all(15),
    decoration:  BoxDecoration(
    shape: BoxShape.circle,
    color: color,
      ),
      ),
    );
  }
}
