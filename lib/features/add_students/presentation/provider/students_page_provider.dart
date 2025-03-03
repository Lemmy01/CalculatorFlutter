import 'package:desktop_math/features/add_students/domain/usecases/get_students_usecase.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/usecases/get_departaments_usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/usecases/get_semesters_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class StudentPageProvider extends ChangeNotifier {
  final GetDepartamentsUsecase _getDepartamentsUsecase;
  final GetStudentsUsecase _getStudentsUsecase;
  final GetSemestersUsecase _getSemestersUsecase;

  StudentPageProvider({
    required GetDepartamentsUsecase getDepartamentsUsecase,
    required GetStudentsUsecase getTeacherUsecase,
    required GetSemestersUsecase getSemestersUsecase,
  })  : _getDepartamentsUsecase = getDepartamentsUsecase,
        _getSemestersUsecase = getSemestersUsecase,
        _getStudentsUsecase = getTeacherUsecase;

  bool _isLoading = false;
  String? _errorMessage;
  final List<DepartamentEntity> _departaments = [];
  int? _selectedDepartamentIndex;
  int? _selectedStudentIndex;
  final List<UserEntity> _students = [];
  final _semesters = <SemesterEntity>[];
  int? _selectedSemester;

  //setters
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  void setSelectedDepartamentIndex(int? value) {
    _selectedDepartamentIndex = value;
    notifyListeners();
  }

  void addDepartament(DepartamentEntity departament) {
    _departaments.add(departament);
    notifyListeners();
  }

  void removeDepartament(DepartamentEntity departament) {
    _departaments.remove(departament);
    notifyListeners();
  }

  void setDepartament(List<DepartamentEntity> departaments) {
    _departaments.clear();
    _departaments.addAll(departaments);
    notifyListeners();
  }

  void setSelectedTeacherIndex(int? value) {
    _selectedStudentIndex = value;
    notifyListeners();
  }

  void setSelectedSemester(int? value) {
    _selectedSemester = value;
    notifyListeners();
  }

  void setSemesters(List<SemesterEntity> semesters) {
    _semesters.clear();
    _semesters.addAll(semesters);
    notifyListeners();
  }

  //getters
  List<SemesterEntity> get semesters => _semesters;
  int? get selectedSemester => _selectedSemester;
  List<DepartamentEntity> get departaments => _departaments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get selectedDepartamentIndex => _selectedDepartamentIndex;
  List<UserEntity> get students => _students;
  UserEntity? get selectedTeacher =>
      _selectedStudentIndex != null ? _students[_selectedStudentIndex!] : null;
  int? get selectedTeacherIndex => _selectedStudentIndex;
  DepartamentEntity? get selectedDepartament =>
      _selectedDepartamentIndex != null
          ? _departaments[_selectedDepartamentIndex!]
          : null;

  int getSemesterLenght() {
    return _semesters.length;
  }

  SemesterEntity getSemester(int index) {
    return _semesters[index];
  }

  //api calls
  Future<void> getDepartaments() async {
    setIsLoading(true);

    (await _getDepartamentsUsecase.call()).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (departaments) {
        _departaments.clear();
        _departaments.addAll(departaments);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }

  Future<void> getStudents() async {
    setIsLoading(true);
    _selectedStudentIndex = null;
    String semesterId = _semesters[_selectedSemester!].id;
    (await _getStudentsUsecase.call(params: semesterId)).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (teachers) {
        _students.clear();
        _students.addAll(teachers);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }

  Future<void> getSemesters() async {
    setIsLoading(true);

    String departamentId = _departaments[_selectedDepartamentIndex!].id;
    (await _getSemestersUsecase.call(params: departamentId)).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (semesters) {
        _semesters.clear();
        _semesters
          ..addAll(semesters)
          ..sort((a, b) => a.semesterNumber.compareTo(b.semesterNumber));
      },
    );

    notifyListeners();
    setIsLoading(false);
  }
}
