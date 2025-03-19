import 'package:usv_hub_management/core/background.dart';
import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/features/login/presentation/provider/login_provider.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  LoginPagePageState createState() => LoginPagePageState();
}

class LoginPagePageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Background(
        child: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final _formKey = GlobalKey<FormState>(); // Cheia formularului
  final classTypeKey = GlobalKey<SplitButtonState>();
  final classFreqKey = GlobalKey<SplitButtonState>();
  final dayOfWeekKey = GlobalKey<SplitButtonState>();

  late LoginProvider _provider;
  @override
  void initState() {
    _provider = context.read<LoginProvider>();
    _provider.addListener(showErrorFunc);
    super.initState();
  }

  void showErrorFunc() async {
    if (context.read<LoginProvider>().getErrorMessage != null) {
      String message = context.read<LoginProvider>().getErrorMessage!;
      if (mounted) {
        context.read<LoginProvider>().clearErrorMessage();
      }
      await displayInfoBar(context, builder: (_, close) {
        return InfoBar(
          title: const Text('Login Error'),
          content: Text(
            message,
            style: const TextStyle(color: AppColors.black),
          ),
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
          severity: InfoBarSeverity.warning,
        );
      });
    }
  }

  @override
  void dispose() {
    _provider.removeListener(showErrorFunc);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Consumer<LoginProvider>(
      builder: (context, provider, child) => provider.isLoading
          ? const Center(
              child: ProgressBar(),
            )
          : Center(
              child: Container(
                // height: h * 0.25,
                width: w * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisSize:
                                  MainAxisSize.min, // Optimizează pe înălțime
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(w * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoLabel(
                                        label: 'Email',
                                        labelStyle: const TextStyle(
                                          color: AppColors.black,
                                        ),
                                        child: TextBox(
                                            placeholder: 'Email',
                                            expands: false,
                                            onChanged: (value) {
                                              provider.setEmail(value);
                                            }),
                                      ),
                                      const SizedBox(height: 16),
                                      InfoLabel(
                                        label: 'Password',
                                        labelStyle: const TextStyle(
                                          color: AppColors.black,
                                        ),
                                        child: TextBox(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: true,
                                            placeholder: 'Password',
                                            expands: false,
                                            onChanged: (value) {
                                              provider.setPassword(value);
                                            }),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Button(
                                            child: const Text('Login'),
                                            onPressed: () {
                                              provider.login();
                                              // Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class EnumDropdown extends StatelessWidget {
  const EnumDropdown({
    super.key,
    required this.splitButtonKey,
    required this.enu,
    required this.onSelected,
    required this.textValue,
  });

  final GlobalKey<SplitButtonState> splitButtonKey;
  final List<Enum> enu;
  final Function(Enum) onSelected;
  final String? textValue;

  @override
  Widget build(BuildContext context) {
    return SplitButton(
      key: splitButtonKey,
      flyout: FlyoutContent(
        constraints: const BoxConstraints(maxWidth: 200.0),
        child: Wrap(
          direction: Axis.vertical,
          runSpacing: 10.0,
          spacing: 8.0,
          children: enu.map((value) {
            return Button(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(4.0),
                ),
              ),
              onPressed: () {
                onSelected(value);
              },
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          borderRadius: const BorderRadiusDirectional.horizontal(
            start: Radius.circular(4.0),
          ),
        ),
        padding:
            const EdgeInsets.only(left: 8.0, right: 15, top: 4.0, bottom: 4.0),
        child: Text(textValue == null ? "Select" : textValue!,
            style: const TextStyle(color: AppColors.black)),
      ),
    );
  }
}
