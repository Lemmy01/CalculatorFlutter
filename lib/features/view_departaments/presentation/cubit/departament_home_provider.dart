import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';

class DepartamentHomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  final _departaments = <DepartamentEntity>[
    DepartamentEntity(id: '1', name: 'Mathematics', facultyId: '1'),
    DepartamentEntity(id: '2', name: 'Physics', facultyId: '1'),
    DepartamentEntity(id: '3', name: 'Chemistry', facultyId: '2'),
    DepartamentEntity(id: '4', name: 'Biology', facultyId: '2'),
    DepartamentEntity(id: '5', name: 'Computer Science', facultyId: '3'),
  ];
  int? _selectedDepartamentIndex;

  final _semesters = <SemesterEntity>[
    SemesterEntity(id: '1', semesterNumber: '1'),
    SemesterEntity(id: '2', semesterNumber: '2'),
    SemesterEntity(id: '3', semesterNumber: '3'),
    SemesterEntity(id: '4', semesterNumber: '4'),
    SemesterEntity(id: '5', semesterNumber: '5'),
    SemesterEntity(id: '6', semesterNumber: '6'),
  ];
  int? _selectedSemester;

  List<DepartamentEntity> get departaments => _departaments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get selectedDepartamentIndex => _selectedDepartamentIndex;
  int? get selectedSemester => _selectedSemester;

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
    notifyListeners();
  }

  DepartamentEntity getSelectedDepartament() {
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

  List<SemesterEntity> getSemesters() {
    return _semesters;
  }

  int getSemesterLenght() {
    return _semesters.length;
  }

  SemesterEntity getSemester(int index) {
    return _semesters[index];
  }

  void setSelectedSemester(int index) {
    _selectedSemester = index;
    notifyListeners();
  }

  SemesterEntity getSelectedSemesterEntity() {
    return _semesters[_selectedSemester!];
  }
}
