import 'package:fluent_ui/fluent_ui.dart';
import 'package:usv_hub_management/core/consts.dart';

class DisplayInfoContainer extends StatelessWidget {
  const DisplayInfoContainer({
    super.key,
    required this.infoToDisplay,
    required this.whatToDisplay,
    required this.icon,
  });
  final String infoToDisplay;
  final String whatToDisplay;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: WidgetStateProperty.resolveWith((states) {
        return AppColors.primary.withAlpha(50);
      }),
      title: Text(
        whatToDisplay,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        infoToDisplay,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 15,
        ),
      ),
      leading: Icon(
        icon,
        color: AppColors.white,
      ),
    );
  }
}
