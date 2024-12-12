import 'package:desktop_math/core/consts.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primaryFixed,
            AppColors.primary,
          ],
        ),
      ),
      child: child,
    );
  }
}
