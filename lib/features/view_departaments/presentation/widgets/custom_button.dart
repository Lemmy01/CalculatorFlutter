import 'package:fluent_ui/fluent_ui.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.w,
    required this.onPressed,
    required this.title,
    required this.color,
  });

  final double w;
  final Function() onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: w * 0.01),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.isHovered) {
              return color.withOpacity(1);
            }
            if (states.isPressed) {
              return color.withOpacity(0.5);
            }
            return color.withOpacity(0.5);
          }),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
