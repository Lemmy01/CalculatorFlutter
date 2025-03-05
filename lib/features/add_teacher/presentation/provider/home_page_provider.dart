import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';
import 'package:desktop_math/features/add_teacher/domain/usecases/get_teacher_usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/usecases/get_departaments_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageProvider extends ChangeNotifier {
  final GetDepartamentsUsecase _getDepartamentsUsecase;
  final GetTeacherUsecase _getTeacherUsecase;

  HomePageProvider({
    required GetDepartamentsUsecase getDepartamentsUsecase,
    required GetTeacherUsecase getTeacherUsecase,
  })  : _getDepartamentsUsecase = getDepartamentsUsecase,
        _getTeacherUsecase = getTeacherUsecase;

  bool _isLoading = false;
  String? _errorMessage;
  final List<DepartamentEntity> _departaments = [];
  int? _selectedDepartamentIndex;
  int? _selectedTeacherIndex;
  final List<UserEntity> _teachers = [];

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
    _selectedTeacherIndex = value;
    notifyListeners();
  }

  //getters
  List<DepartamentEntity> get departaments => _departaments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get selectedDepartamentIndex => _selectedDepartamentIndex;
  List<UserEntity> get teachers => _teachers;
  UserEntity? get selectedTeacher =>
      _selectedTeacherIndex != null ? _teachers[_selectedTeacherIndex!] : null;
  int? get selectedTeacherIndex => _selectedTeacherIndex;
  DepartamentEntity? get selectedDepartament =>
      _selectedDepartamentIndex != null
          ? _departaments[_selectedDepartamentIndex!]
          : null;

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

  Future<void> getTeachers() async {
    setIsLoading(true);

    String departamentId = _departaments[_selectedDepartamentIndex!].id;
    (await _getTeacherUsecase.call(params: departamentId)).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (teachers) {
        _teachers.clear();
        _teachers.addAll(teachers);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }

  Future<void> clear() async {
    _departaments.clear();
    _teachers.clear();
    _selectedDepartamentIndex = null;
    _selectedTeacherIndex = null;
    notifyListeners();
  }
}
