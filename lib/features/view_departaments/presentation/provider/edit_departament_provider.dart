// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

import 'package:usv_hub_management/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/usecases/add_semester_usecase.dart';

@injectable
class EditDepartamentProvider extends ChangeNotifier {
  AddSemesterUsecase addSemesterUsecase;
  bool? _isLoading = false;
  bool? _addSemester = false;
  int? _newSemesterNumber;

  EditDepartamentProvider({
    required this.addSemesterUsecase,
  });

  final _semesters = <SemesterEntity>[];

  List<SemesterEntity> get semesters => _semesters;
  bool? get isLoading => _isLoading;
  bool? get addSemester => _addSemester;
  int? get newSemesterNumber => _newSemesterNumber;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setNewSemesterNumber(int? number) {
    _newSemesterNumber = number;
    notifyListeners();
  }

  void setSemesters(List<SemesterEntity> semesters) {
    _semesters.clear();
    _semesters.addAll(semesters);
    notifyListeners();
  }

  void switchAddSemester() {
    _addSemester = !_addSemester!;
    notifyListeners();
  }

  Future<void> addSemesterInFirebase() async {
    setLoading(true);

    SemesterEntity semester = SemesterEntity(
      departamentId: _semesters.first.departamentId,
      id: '',
      semesterNumber: _newSemesterNumber!,
    );

    (await addSemesterUsecase.call(params: semester)).fold(
      (failure) {
        log(failure.message);
      },
      (success) {
        log('Semester added');
        _semesters
          ..add(semester)
          ..sort((a, b) => a.semesterNumber.compareTo(b.semesterNumber));
        _newSemesterNumber = null;
        switchAddSemester();
      },
    );

    setLoading(false);
  }
}
