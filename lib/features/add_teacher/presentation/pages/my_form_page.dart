import 'package:desktop_math/core/background.dart';
import 'package:desktop_math/features/add_teacher/presentation/cubit/form_provider.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  MyFormPageState createState() => MyFormPageState();
}

class MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>(); // Cheia formularului

  @override
  void initState() {
    // Set a listener to the provider's isError property
    context.read<FormProvider>().addListener(() async {
      if (context.read<FormProvider>().isError != null) {
        await showDialog<String>(
          context: context,
          builder: (_) => ContentDialog(
            title: const Text('An error occurred'),
            content: Text(
              context.read<FormProvider>().isError!,
            ),
            actions: [
              FilledButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
        if (mounted) context.read<FormProvider>().setIsError(null);
      }
    });
    super.initState();
  }

  final departaments = <DepartamentEntity>[
    DepartamentEntity(id: '1', name: 'Mathematics', facultyId: '1'),
    DepartamentEntity(id: '2', name: 'Physics', facultyId: '1'),
    DepartamentEntity(id: '3', name: 'Chemistry', facultyId: '2'),
    DepartamentEntity(id: '4', name: 'Biology', facultyId: '2'),
    DepartamentEntity(id: '5', name: 'Computer Science', facultyId: '3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ScaffoldPage(
        content: Center(
          child: Card(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: 400, // Dimensiune fixă pentru card
              child: Consumer<FormProvider>(
                builder: (context, provider, child) => provider.isLoading !=
                        null
                    ? const Center(
                        child: ProgressBar(),
                      )
                    : SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize:
                                MainAxisSize.min, // Optimizează pe înălțime
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoLabel(
                                label: 'Enter your name:',
                                child: TextBox(
                                  placeholder: 'Name',
                                  expands: false,
                                  onChanged: (value) => provider.setName(value),
                                ),
                              ),
                              const SizedBox(height: 16),
                              InfoLabel(
                                label: 'Enter your email:',
                                child: TextBox(
                                  placeholder: 'Email',
                                  expands: false,
                                  onChanged: (value) =>
                                      provider.setEmail(value),
                                ),
                              ),
                              const SizedBox(height: 16),
                              InfoLabel(
                                label: 'Enter your password:',
                                child: PasswordBox(
                                  placeholder: 'Password',
                                  onChanged: (value) =>
                                      provider.setPassword(value),
                                ),
                              ),
                              const SizedBox(height: 16),
                              InfoLabel(
                                label: 'Enter your Fother name:',
                                child: TextBox(
                                  placeholder: 'FatherName',
                                  expands: false,
                                  onChanged: (value) => provider.setName(value),
                                ),
                              ),
                              const SizedBox(height: 16),
                              InfoLabel(
                                label: 'Enter your Mother Name:',
                                child: TextBox(
                                  placeholder: 'MotherName',
                                  expands: false,
                                  onChanged: (value) => provider.setName(value),
                                ),
                              ),
                              const SizedBox(height: 16),
                              InfoLabel(
                                label: 'Enter your Phone Number:',
                                child: NumberBox(
                                  value: provider.phoneNumber,
                                  placeholder: 'Phone Number',
                                  keyboardType: TextInputType.number,
                                  mode: SpinButtonPlacementMode.none,
                                  onChanged: (value) =>
                                      provider.setPhoneNumber(value),
                                ),
                              ),
                              const SizedBox(height: 16),
                              InfoLabel(
                                label: 'Type a departament name',
                                child: AutoSuggestBox<DepartamentEntity>(
                                  placeholder: 'Departaments',
                                  items: departaments.map((cat) {
                                    return AutoSuggestBoxItem<
                                        DepartamentEntity>(
                                      value: cat,
                                      label: cat.name,
                                    );
                                  }).toList(),
                                  onSelected: (item) {
                                    provider.setDepartament(item.value);
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Buton de trimitere
                              Align(
                                alignment: Alignment.centerRight,
                                child: Button(
                                  onPressed: () {
                                    provider.submitForm(context);
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
