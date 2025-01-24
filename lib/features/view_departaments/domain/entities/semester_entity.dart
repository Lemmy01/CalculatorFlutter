import 'package:fluent_ui/fluent_ui.dart';

class SemesterEntity extends ChangeNotifier {
  String id;
  int semesterNumber;
  String departamentId;
  SemesterEntity({
    required this.id,
    required this.semesterNumber,
    required this.departamentId,
  });
}
