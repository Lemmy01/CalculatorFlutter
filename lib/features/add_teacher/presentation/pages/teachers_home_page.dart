import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usv_hub_management/core/background.dart';
import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/features/add_teacher/presentation/widgets/my_form_widget.dart';
import 'package:usv_hub_management/features/add_teacher/presentation/provider/form_provider.dart';
import 'package:usv_hub_management/features/add_teacher/presentation/provider/home_page_provider.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:usv_hub_management/features/view_departaments/presentation/provider/departament_home_provider.dart';
import 'package:usv_hub_management/features/view_departaments/presentation/widgets/custom_button.dart';
import 'package:usv_hub_management/features/view_departaments/presentation/widgets/display_info_container.dart';
import 'package:usv_hub_management/injection.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TeachersHomePage extends StatefulWidget {
  const TeachersHomePage({super.key});

  @override
  State<TeachersHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeachersHomePage> {
  late HomePageProvider _provider;
  @override
  void initState() {
    _provider = context.read<HomePageProvider>();
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
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Background(
      child: ScaffoldPage(content: Consumer<HomePageProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: ProgressBar());
          }
          return ResponsiveBuilder(
            builder:
                (BuildContext context, SizingInformation sizingInformation) {
              if (sizingInformation.isDesktop) {
                return Padding(
                  padding: EdgeInsets.all(w * 0.01),
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
                                      color: AppColors.white,
                                      FluentIcons.search),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.015),
                      DepartamentRow(provider: provider),
                      SizedBox(height: h * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (provider.selectedDepartamentIndex != null)
                            CustomButton(
                              w: w,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      DepartamentEntity departamentEntity =
                                          provider.selectedDepartament!;
                                      return ChangeNotifierProvider(
                                          create: (_) => getIt<FormProvider>()
                                            ..setDepartament(departamentEntity),
                                          builder: (context, child) =>
                                              const MyFormWidget(
                                                isTeacher: true,
                                              ));
                                    });
                              },
                              title: "Add teacher",
                              color: AppColors.onTertiaryContainer,
                            ),
                          CustomButton(
                            w: w,
                            onPressed: () {
                              provider.setSelectedDepartamentIndex(null);
                              provider.setSelectedTeacherIndex(null);
                            },
                            title: "Clear selection",
                            color: AppColors.onSecondary,
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.015),
                      if (provider.selectedDepartamentIndex != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              // decoration: BoxDecoration(
                              //   color: AppColors.secondary,
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              height: h > 600 ? h * 0.65 : h * 0.6,
                              width: w > 800 ? w * 0.2 : w * 0.3,
                              child: ListView.builder(
                                itemCount: provider.teachers.length,
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    tileColor:
                                        provider.selectedTeacherIndex == index
                                            ? WidgetStatePropertyAll(
                                                AppColors.onPrimary
                                                    .withValues(alpha: 0.5),
                                              )
                                            : const WidgetStatePropertyAll(
                                                AppColors.primaryFixed,
                                              ),
                                    title: Text(
                                      provider.teachers[index].name,
                                      style: const TextStyle(
                                          color: AppColors.white),
                                    ),
                                    subtitle: Text(
                                      provider.teachers[index].email,
                                      style: const TextStyle(
                                          color: AppColors.white),
                                    ),
                                    onPressed: () {
                                      provider.setSelectedTeacherIndex(index);
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: w * 0.1),
                            if (provider.selectedTeacher != null)
                              Container(
                                  // decoration: BoxDecoration(
                                  //   color: AppColors.primaryContainer,
                                  //   borderRadius: BorderRadius.circular(10),
                                  // ),

                                  height: h > 600 ? h * 0.65 : h * 0.6,
                                  width: w > 800 ? w * 0.4 : w * 0.3,
                                  padding: EdgeInsets.all(w * 0.01),
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DisplayInfoContainer(
                                        icon: FontAwesomeIcons.user,
                                        whatToDisplay: "Teacher name",
                                        infoToDisplay:
                                            provider.selectedTeacher!.name,
                                      ),
                                      DisplayInfoContainer(
                                        icon: FluentIcons.mail,
                                        whatToDisplay: "Teacher email",
                                        infoToDisplay:
                                            provider.selectedTeacher!.email,
                                      ),
                                      DisplayInfoContainer(
                                        icon: FluentIcons.phone,
                                        whatToDisplay: "Teacher phone",
                                        infoToDisplay: provider
                                            .selectedTeacher!.phoneNumber
                                            .toString(),
                                      ),
                                      DisplayInfoContainer(
                                        icon: FontAwesomeIcons.user,
                                        whatToDisplay: "Teacher father name",
                                        infoToDisplay: provider
                                            .selectedTeacher!.fatherName,
                                      ),
                                      DisplayInfoContainer(
                                        icon: FontAwesomeIcons.user,
                                        whatToDisplay: "Teacher mother name",
                                        infoToDisplay: provider
                                            .selectedTeacher!.motherName,
                                      ),
                                    ],
                                  )),
                            Expanded(child: Container()),
                          ],
                        ),
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       provider.getSelectedDepartament() != null
                      //           ? SelectSemester(
                      //               h: h,
                      //               provider: provider,
                      //             )
                      //           : Container(),
                      //       provider.getSelectedSemesterEntity() != null &&
                      //               provider.getSelectedDepartament() != null &&
                      //               provider.selectedCourse != null
                      //           ? Container(
                      //               decoration: BoxDecoration(
                      //                 color: AppColors.secondary,
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //               height: h > 600 ? h * 0.65 : h * 0.6,
                      //               width: w > 800 ? w * 0.3 : w * 0.4,
                      //               child: const SingleChildScrollView(
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text("Course name: <NUME>"),
                      //                     Text("Department: <DEPARTAMENT>"),
                      //                     Text("Semester: <SEMESTRU>"),
                      //                     Text("Numar credite : <NUMAR>"),
                      //                     Text("Profesor: <PROFESOR>"),
                      //                     Text("Assistent: <ASISTENT>"),
                      //                     Text(
                      //                         "Numar de cursuri: <NUMAR_CURSURI>"),
                      //                   ],
                      //                 ),
                      //               ),
                      //             )
                      //           : Container(),
                      //       provider.getSelectedSemesterEntity() != null &&
                      //               provider.getSelectedDepartament() != null
                      //           ? Column(
                      //               children: [
                      //                 Padding(
                      //                   padding: EdgeInsets.only(right: w * 0.01),
                      //                   child: FilledButton(
                      //                     style: ButtonStyle(
                      //                       backgroundColor:
                      //                           WidgetStateProperty.resolveWith(
                      //                               (states) {
                      //                         if (states.isHovered) {
                      //                           return AppColors
                      //                               .onTertiaryContainer
                      //                               .withValues(1);
                      //                         }
                      //                         if (states.isPressed) {
                      //                           return AppColors
                      //                               .onTertiaryContainer
                      //                               .withValues(alpha: 0.5);
                      //                         }
                      //                         return AppColors.onTertiaryContainer
                      //                             .withValues(alpha: 0.5);
                      //                       }),
                      //                     ),
                      //                     child: const Text("Add a new Course"),
                      //                     onPressed: () {},
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: w > 1000 ? w * 0.15 : w * 0.25,
                      //                   height: h > 600 ? h * 0.65 : h * 0.6,
                      //                   child: ListView.builder(
                      //                     itemCount: provider.courses.length,
                      //                     itemBuilder: (_, index) {
                      //                       bool isSelected =
                      //                           provider.selectedCourse == index;
                      //                       CourseEntity course =
                      //                           provider.courses[index];
                      //                       return ListTile(
                      //                         title: Text(
                      //                           course.title,
                      //                           style: TextStyle(
                      //                             color: isSelected
                      //                                 ? AppColors.white
                      //                                 : AppColors.white
                      //                                     .withValues(alpha: 0.5),
                      //                           ),
                      //                         ),
                      //                         subtitle: Text(
                      //                           course.courseCredits.toString(),
                      //                           style: TextStyle(
                      //                             color: isSelected
                      //                                 ? AppColors.white
                      //                                 : AppColors.white
                      //                                     .withValues(alpha: 0.5),
                      //                           ),
                      //                         ),
                      //                         onPressed: () {
                      //                           provider.setSelectedCourse(index);
                      //                         },
                      //                       );
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             )
                      //           : Container(),
                      //     ],
                      //   ),
                    ],
                  ),
                );
              }
              return Container(
                color: AppColors.red,
                height: h,
              );
            },
          );
        },
      )),
    );
  }
}

class DepartamentRow extends StatelessWidget {
  const DepartamentRow({super.key, required this.provider});

  final HomePageProvider provider;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.departaments.length,
        itemBuilder: (context, index) {
          final departament = provider.departaments[index];
          final isSelected = provider.selectedDepartamentIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Add spacing between items
            child: GestureDetector(
              onTap: () async {
                provider.setSelectedDepartamentIndex(index);

                await provider.getTeachers();
              },
              child: Container(
                padding: EdgeInsets.all(width * 0.005),
                width: width * 0.2, // Adjust the width of each item
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.onPrimary
                      : AppColors.primaryFixed, // Example background color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      departament.name,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
