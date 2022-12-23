import '../index.dart';

class GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double height;
  const GenderCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.color,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      height: height,
      color: color,
      margin: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70,
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.0,
              color: AppColors.lightGrey,
            ),
          )
        ],
      ),
    );
  }
}
