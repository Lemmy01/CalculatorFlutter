import 'package:desktop_math/core/consts.dart';
import 'package:fluent_ui/fluent_ui.dart';

class SelectSemester extends StatelessWidget {
  const SelectSemester({
    super.key,
    required this.h,
    required this.lenght,
    required this.onTap,
    required this.selectedSemester,
    required this.getTitle,
  });

  final double h;
  final int lenght;
  final Function(int) onTap;
  final int? selectedSemester;
  final String Function(int) getTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: h * 0.4,
      height: h > 600 ? h * 0.65 : h * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Semesters',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: lenght, // ,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: Card(
                        backgroundColor: selectedSemester == index //
                            ? AppColors.onSecondary
                            : AppColors.secondary,
                        child: Text(
                          getTitle(
                              index), // provider.getSemester(index).semesterNumber.toString(),
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
