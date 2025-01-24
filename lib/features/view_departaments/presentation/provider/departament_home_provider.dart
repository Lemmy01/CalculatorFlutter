import 'dart:developer';

import 'package:desktop_math/features/view_departaments/domain/entities/course_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/usecases/get_course_usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/usecases/get_departaments_usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/usecases/get_semesters_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class DepartamentHomeProvider extends ChangeNotifier {
  final GetDepartamentsUsecase _getDepartamentsUsecase;
  final GetSemestersUsecase _getSemesterUsecase;
  final GetCoursesUsecase _getCoursesUsecase;
  DepartamentHomeProvider({
    required GetDepartamentsUsecase getDepartamentsUsecase,
    required GetSemestersUsecase getSemesterUsecase,
    required GetCoursesUsecase getCoursesUsecase,
  })  : _getDepartamentsUsecase = getDepartamentsUsecase,
        _getSemesterUsecase = getSemesterUsecase,
        _getCoursesUsecase = getCoursesUsecase;

  bool _isLoading = false;
  String? _errorMessage;
  final List<DepartamentEntity> _departaments = [];
  final List<CourseEntity> _courses = [];

  int? _selectedDepartamentIndex;

  final _semesters = <SemesterEntity>[];
  int? _selectedSemester;
  int? _selectedCourse;

  List<DepartamentEntity> get departaments => _departaments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get selectedDepartamentIndex => _selectedDepartamentIndex;
  int? get selectedSemester => _selectedSemester;
  int? get selectedCourse => _selectedCourse;

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

  Future<void> getSemesters() async {
    setIsLoading(true);

    String id = _departaments[_selectedDepartamentIndex!].id;
    (await _getSemesterUsecase.call(params: id)).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (semesters) {
        _semesters.clear();
        _semesters.addAll(semesters);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }

  Future<void> getCoursesFromRepo() async {
    setIsLoading(true);

    String id = _semesters[_selectedSemester!].id;
    (await _getCoursesUsecase.call(params: id)).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (courses) {
        _courses.clear();
        _courses.addAll(courses);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }

  List<CourseEntity> get courses => _courses;
  void addDepartament(DepartamentEntity departament) {
    _departaments.add(departament);
    notifyListeners();
  }

  void removeDepartament(DepartamentEntity departament) {
    _departaments.remove(departament);
    notifyListeners();
  }

  void setSelectedDepartament(int index) {
    _selectedDepartamentIndex = index;
    _selectedCourse = null;
    _selectedSemester = null;
    _courses.clear();
    _semesters.clear();
    notifyListeners();
  }

  DepartamentEntity? getSelectedDepartament() {
    if (_selectedDepartamentIndex == null) return null;
    log(_departaments.length.toString());
    if (_departaments.isEmpty) return null;
    return _departaments[_selectedDepartamentIndex!];
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  int getSemesterLenght() {
    return _semesters.length;
  }

  SemesterEntity getSemester(int index) {
    return _semesters[index];
  }

  void setSelectedSemester(int index) {
    _selectedSemester = index;
    _selectedCourse = null;
    _courses.clear();
    notifyListeners();
  }

  SemesterEntity? getSelectedSemesterEntity() {
    if (_selectedSemester == null) return null;
    return _semesters[_selectedSemester!];
  }

  void setSelectedCourse(int index) {
    _selectedCourse = index;
    notifyListeners();
  }

  CourseEntity? getSelectedCourseEntity() {
    if (_selectedCourse == null) return null;
    return _courses[_selectedCourse!];
  }
}
