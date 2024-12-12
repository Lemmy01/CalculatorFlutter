import 'package:desktop_math/core/background.dart';
import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/view_departaments/presentation/cubit/departament_home_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DepartamentHomePage extends StatefulWidget {
  const DepartamentHomePage({super.key});

  @override
  State<DepartamentHomePage> createState() => _DepartamentHomePageState();
}

class _DepartamentHomePageState extends State<DepartamentHomePage> {
  late DepartamentHomeProvider _provider;
  @override
  void initState() {
    _provider = context.read<DepartamentHomeProvider>();
    // Set a listener to the provider's isError property
    _provider.addListener(showDialogIfError);
    super.initState();
  }

  void showDialogIfError() async {
    if (context.read<DepartamentHomeProvider>().errorMessage != null) {
      await showDialog<String>(
        context: context,
        builder: (_) => ContentDialog(
          title: const Text('An error occurred'),
          content: Text(
            context.read<DepartamentHomeProvider>().errorMessage!,
          ),
          actions: [
            FilledButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      if (mounted) {
        context.read<DepartamentHomeProvider>().setErrorMessage(null);
      }
    }
  }

  @override
  void dispose() {
    // Remove the listener
    _provider.removeListener(showDialogIfError);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: ScaffoldPage(content: Consumer<DepartamentHomeProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: ProgressBar());
          }
          return Padding(
            padding: EdgeInsets.all(0.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextBox(
                              placeholder: 'Search departament',
                              expands: false,
                              onChanged: (value) {},
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                                color: AppColors.white, FluentIcons.search),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 1.w),
                          child: FilledButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.resolveWith((states) {
                                if (states.isHovered) {
                                  return AppColors.onTertiaryContainer
                                      .withOpacity(1);
                                }
                                if (states.isPressed) {
                                  return AppColors.onTertiaryContainer
                                      .withOpacity(0.5);
                                }
                                return AppColors.onTertiaryContainer
                                    .withOpacity(0.5);
                              }),
                            ),
                            child: const Text("Add a new Faculty"),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.w),
                          child: FilledButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.resolveWith((states) {
                                if (states.isHovered) {
                                  return AppColors.onTertiaryContainer
                                      .withOpacity(1);
                                }
                                if (states.isPressed) {
                                  return AppColors.onTertiaryContainer
                                      .withOpacity(0.5);
                                }
                                return AppColors.onTertiaryContainer
                                    .withOpacity(0.5);
                              }),
                            ),
                            child: const Text("Add a new Departament"),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),
                SizedBox(
                  width: 100.w,
                  height: 10.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.departaments.length,
                    itemBuilder: (context, index) {
                      final departament = provider.departaments[index];
                      final isSelected =
                          provider.selectedDepartamentIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0), // Add spacing between items
                        child: GestureDetector(
                          onTap: () {
                            provider.setSelectedDepartament(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(0.5.w),
                            width: 20.w, // Adjust the width of each item
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.onPrimary
                                  : AppColors
                                      .primaryFixed, // Example background color
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  departament.name,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  departament.facultyId,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const Expanded(child: SizedBox()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FilledButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.resolveWith(
                                                (states) {
                                          if (states.isHovered) {
                                            return AppColors.onSecondary
                                                .withOpacity(0.5);
                                          }
                                          if (states.isPressed) {
                                            return AppColors.onSecondary;
                                          }
                                          return AppColors.onSecondary;
                                        }),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(FluentIcons.edit),
                                          Text('Edit'),
                                        ],
                                      ),
                                      onPressed: () {
                                        // Your button action here
                                      },
                                    ),
                                    SizedBox(width: 0.5.w),
                                    FilledButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.resolveWith(
                                                (states) {
                                          if (states.isHovered) {
                                            return AppColors.error
                                                .withOpacity(1);
                                          }
                                          if (states.isPressed) {
                                            return AppColors.error
                                                .withOpacity(0.5);
                                          }
                                          return AppColors.error
                                              .withOpacity(0.5);
                                        }),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(FluentIcons.delete),
                                          Text('Delete'),
                                        ],
                                      ),
                                      onPressed: () {
                                        // Your button action here
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 70.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semesters',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                ),
                                itemCount: provider.getSemesterLenght(),
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      provider.setSelectedSemester(index);
                                    },
                                    child: Card(
                                        backgroundColor:
                                            provider.selectedSemester == index
                                                ? AppColors.onSecondary
                                                : AppColors.secondary,
                                        child: Text(
                                          provider
                                              .getSemester(index)
                                              .semesterNumber,
                                        )),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
