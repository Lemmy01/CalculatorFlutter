import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/features/add_events/presentation/providers/event_form_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class AddEventForm extends StatefulWidget {
  const AddEventForm({
    super.key,
  });

  @override
  AddEventFormState createState() => AddEventFormState();
}

class AddEventFormState extends State<AddEventForm> {
  final _formKey = GlobalKey<FormState>(); // Cheia formularului

  @override
  Widget build(BuildContext context) {
    return Consumer<EventFormProvider>(
      builder: (context, provider, child) => provider.isLoading != null
          ? const Center(
              child: ProgressBar(),
            )
          : ContentDialog(
              title: const Text('Formular de contact'),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Optimizează pe înălțime
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoLabel(
                        label: 'Enter title:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'Title',
                          expands: false,
                          onChanged: (value) => provider.setTitle(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter supporter name:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'Name',
                          expands: false,
                          onChanged: (value) =>
                              provider.setSupporterName(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter a date:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: DatePicker(
                          header: 'Pick a date',
                          selected: provider.date,
                          onChanged: (time) => provider.setDate(time),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter Start Time:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TimePicker(
                          header: 'Pick a date',
                          selected: provider.startTime,
                          onChanged: (time) => provider.setStartTime(time),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter End Time:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TimePicker(
                          header: 'Pick a date',
                          selected: provider.endTime,
                          onChanged: (time) => provider.setEndTime(time),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter class where held:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'Class where held',
                          expands: false,
                          onChanged: (value) =>
                              provider.setClassWhereHeld(value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Button(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: !provider.validateData()
                        ? WidgetStateProperty.all(AppColors.grey)
                        : null,
                  ),
                  onPressed: () async {
                    if (provider.validateData()) {
                      await provider.submitForm(
                        context,
                      );

                      if (context.mounted &&
                          provider.isLoading == false &&
                          provider.isError == null) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
    );
  }
}
