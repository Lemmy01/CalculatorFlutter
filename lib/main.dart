import 'dart:ui';

import 'package:desktop_math/core/background.dart';
import 'package:desktop_math/features/add_teacher/presentation/cubit/form_provider.dart';
import 'package:desktop_math/features/users_page/presentation/pages/users_page.dart';
import 'package:desktop_math/features/view_departaments/presentation/provider/departament_home_provider.dart';
import 'package:desktop_math/features/view_departaments/presentation/pages/departament_home_page.dart';
import 'package:desktop_math/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:window_manager/window_manager.dart';

enum Operations { add, subtract, multiply, divide }

//flutter pub run build_runner watch --delete-conflicting-outputs
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBtIoiPaA98ubDHOKIwAtxutKuvmeORtAI",
      authDomain: "usv-hub.firebaseapp.com",
      projectId: "usv-hub",
      storageBucket: "usv-hub.appspot.com",
      messagingSenderId: "511355181571",
      appId: "1:511355181571:web:caeb2559d25a3ea4d24c36",
      measurementId: "G-MW33NV1B65",
    ),
  );

  configureDependencies();
  await windowManager.ensureInitialized();

  await windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Usv Hub Management');
    await windowManager.setBackgroundColor(Colors.transparent);

    // Set the window size to full screen
    await windowManager.setPosition(Offset.zero);

    // Disable resizing and hide title bar
    await windowManager.maximize();
    await windowManager.setMinimumSize(const Size(800, 600));
    // Dezactivează maximizarea
    //await windowManager.setMaximizable(false);

    // Dezactivează minimizarea
    // await windowManager.setMinimizable(false);

    // Dezactivează redimensionarea
    // await windowManager.setResizable(false);

    // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

    // Set the window to full screen (makes the window cover the entire screen)
    //  await windowManager.setFullScreen(true);

    // Show the window
    await windowManager.show();
  });

  runApp(const MyApp());
}

class CustomScrollBehavior extends FluentScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) {
        return FluentApp(
          scrollBehavior: CustomScrollBehavior(),
          theme: FluentThemeData(
              brightness: Brightness.light, accentColor: Colors.orange),
          darkTheme: FluentThemeData(
              brightness: Brightness.dark, accentColor: Colors.orange),
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FormProvider()),
              ChangeNotifierProvider(
                  create: (_) =>
                      getIt<DepartamentHomeProvider>()..getDepartaments()),
            ],
            child: const Background(
              child: MyHomePage(),
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  int index = 0;
  final viewKey = GlobalKey();

  @override
  void initState() {
    windowManager.addListener(this);

    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: viewKey,
      pane: NavigationPane(
          selected: index,
          onChanged: (i) => setState(() {
                index = i;
              }),
          displayMode: PaneDisplayMode.compact,
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.home),
              title: const Text('Home'),
              body: const DepartamentHomePage(),
            ),
            PaneItem(
              icon: const FaIcon(FontAwesomeIcons.userTie),
              title: const Text('Teachers'),
              body: const UsersPage(),
            ),
            PaneItem(
              //use Font Awsome Icons for the icon,
              icon: const FaIcon(FontAwesomeIcons.userGraduate),
              title: const Text('Students'),
              body: const Background(
                child: Center(
                  child: Text('Home'),
                ),
              ),
            ),
            PaneItem(
              //use Font Awsome Icons for the icon,
              icon: const FaIcon(FluentIcons.cancel),
              title: const Text('Close App'),
              onTap: () {
                windowManager.close();
              },
              body: const Background(child: SizedBox()),
            ),
          ]),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
          context: context,
          builder: (_) {
            return ContentDialog(
                title: const Text('Confirm close'),
                content: const Text('Are you sure want to close the app?'),
                actions: [
                  FilledButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.pop(context);
                      windowManager.destroy();
                    },
                  ),
                  FilledButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]);
          });
    }
  }
}

//flutter pub get && flutter pub run build_runner watch --delete-conflicting-outputs