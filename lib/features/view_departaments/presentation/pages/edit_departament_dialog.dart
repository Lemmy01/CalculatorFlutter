import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/view_departaments/presentation/provider/edit_departament_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class EditDepartamentDialog extends StatefulWidget {
  const EditDepartamentDialog({
    super.key,
  });

  @override
  EditDepartamentDialogState createState() => EditDepartamentDialogState();
}

class EditDepartamentDialogState extends State<EditDepartamentDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EditDepartamentProvider>(
      builder: (context, provider, child) => provider.isLoading != null &&
              provider.isLoading == true
          ? const Center(
              child: ProgressBar(),
            )
          : ContentDialog(
              title: Row(
                children: [
                  const Text('Edit Departament'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(FluentIcons.add),
                    onPressed: () {
                      provider.switchAddSemester();
                    },
                  ),
                ],
              ),
              content: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    if (provider.addSemester!)
                      Column(
                        children: [
                          NumberBox(
                            value: provider.newSemesterNumber,
                            placeholder: 'Semester number',
                            keyboardType: TextInputType.number,
                            mode: SpinButtonPlacementMode.none,
                            onChanged: (value) {
                              provider.setNewSemesterNumber(value);
                            },
                          ),
                          const SizedBox(height: 10),
                          Button(
                            onPressed: () {
                              provider.addSemesterInFirebase();
                            },
                            child: const Text('Add Semester'),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.semesters.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            tileColor: WidgetStatePropertyAll(
                              AppColors.grey.withOpacity(0.2),
                            ),
                            title: Text(
                              "Semestrul ${provider.semesters[index].semesterNumber}",
                              style: const TextStyle(color: AppColors.black),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Button(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                FilledButton(
                  // style: ButtonStyle(
                  //   backgroundColor: !provider.validateData()
                  //       ? WidgetStateProperty.all(AppColors.grey)
                  //       : null,
                  // ),
                  onPressed: () async {
                    // TODO: Procesează datele formularului
                  },
                  child: const Text('Apply'),
                ),
              ],
            ),
    );
  }
}
