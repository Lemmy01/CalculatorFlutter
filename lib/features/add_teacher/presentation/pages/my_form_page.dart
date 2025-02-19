import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/add_teacher/presentation/provider/form_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({
    super.key,
  });

  @override
  MyFormPageState createState() => MyFormPageState();
}

class MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>(); // Cheia formularului

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(
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
                        label: 'Enter your name:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'Name',
                          expands: false,
                          onChanged: (value) => provider.setName(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter your email:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'Email',
                          expands: false,
                          onChanged: (value) => provider.setEmail(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter your password:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: PasswordBox(
                          placeholder: 'Password',
                          onChanged: (value) => provider.setPassword(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter your Fother name:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'FatherName',
                          expands: false,
                          onChanged: (value) => provider.setFatherName(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter your Mother Name:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: TextBox(
                          placeholder: 'MotherName',
                          expands: false,
                          onChanged: (value) => provider.setMotherName(value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoLabel(
                        label: 'Enter your Phone Number:',
                        labelStyle: const TextStyle(
                          color: AppColors.grey,
                        ),
                        child: NumberBox(
                          value: provider.phoneNumber,
                          placeholder: 'Phone Number',
                          keyboardType: TextInputType.number,
                          mode: SpinButtonPlacementMode.none,
                          onChanged: (value) => provider.setPhoneNumber(value),
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
                      await provider.submitForm(context);

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
