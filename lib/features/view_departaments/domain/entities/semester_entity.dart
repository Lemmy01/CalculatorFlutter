import 'package:fluent_ui/fluent_ui.dart';

class SemesterEntity extends ChangeNotifier {
  String id;
  String semesterNumber;

  SemesterEntity({
    required this.id,
    required this.semesterNumber,
  });
}
