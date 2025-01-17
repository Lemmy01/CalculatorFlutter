import 'package:desktop_math/core/background.dart';
import 'package:fluent_ui/fluent_ui.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  final _formKey = GlobalKey<FormState>(); // Cheia formularului

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: ScaffoldPage(
          content: Column(
        children: [Row()],
      )),
    );
  }
}
