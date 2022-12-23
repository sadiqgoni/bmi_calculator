import '../index.dart';

class PrimaryCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  const PrimaryCard(
      {Key? key,
      required this.child,
      this.height,
      this.width,
      this.margin,
      this.color = AppColors.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
