import '../index.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const RoundedIconButton({Key? key, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightGrey,
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
