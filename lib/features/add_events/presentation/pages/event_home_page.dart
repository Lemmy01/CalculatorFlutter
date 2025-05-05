import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usv_hub_management/core/background.dart';
import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/features/add_events/presentation/providers/event_form_provider.dart';
import 'package:usv_hub_management/features/add_events/presentation/providers/event_provider.dart';
import 'package:usv_hub_management/features/add_events/presentation/widgets/add_event_form.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:usv_hub_management/features/view_departaments/presentation/widgets/custom_button.dart';
import 'package:usv_hub_management/features/view_departaments/presentation/widgets/display_info_container.dart';
import 'package:usv_hub_management/injection.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EventHomePage extends StatefulWidget {
  const EventHomePage({super.key});

  @override
  State<EventHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<EventHomePage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Background(
      child: ScaffoldPage(content: Consumer<EventProvider>(
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
                                          create: (_) =>
                                              getIt<EventFormProvider>()
                                                ..setDepartamentId(
                                                    departamentEntity.id),
                                          builder: (context, child) =>
                                              const AddEventForm());
                                    });
                              },
                              title: "Add Event",
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
                                itemCount: provider.events.length,
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    tileColor:
                                        provider.selectedEventIndex == index
                                            ? WidgetStatePropertyAll(
                                                AppColors.onPrimary
                                                    .withValues(alpha: 0.5),
                                              )
                                            : const WidgetStatePropertyAll(
                                                AppColors.primaryFixed,
                                              ),
                                    title: Text(
                                      provider.events[index].title,
                                      style: const TextStyle(
                                          color: AppColors.white),
                                    ),
                                    subtitle: Text(
                                      provider.events[index].supporterName,
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
                            if (provider.selectedEvent != null)
                              Container(
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
                                        whatToDisplay: "Event title",
                                        infoToDisplay:
                                            provider.selectedEvent!.title,
                                      ),
                                      DisplayInfoContainer(
                                        icon: FluentIcons.mail,
                                        whatToDisplay: "Event supporter",
                                        infoToDisplay: provider
                                            .selectedEvent!.supporterName,
                                      ),
                                      DisplayInfoContainer(
                                        icon: FluentIcons.phone,
                                        whatToDisplay: "Start time",
                                        infoToDisplay: provider
                                            .selectedEvent!.startTime
                                            .toString(),
                                      ),
                                      DisplayInfoContainer(
                                        icon: FontAwesomeIcons.user,
                                        whatToDisplay: "End time",
                                        infoToDisplay: provider
                                            .selectedEvent!.endTime
                                            .toString(),
                                      ),
                                      DisplayInfoContainer(
                                        icon: FontAwesomeIcons.user,
                                        whatToDisplay: "Location",
                                        infoToDisplay: provider
                                            .selectedEvent!.classWhereHeld,
                                      ),
                                    ],
                                  )),
                            Expanded(child: Container()),
                          ],
                        ),
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

  final EventProvider provider;
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

                await provider.getEvents();
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
