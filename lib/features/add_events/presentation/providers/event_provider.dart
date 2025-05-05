import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';
import 'package:usv_hub_management/features/add_events/domain/usecases/get_events_usecase.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/usecases/get_departaments_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventProvider extends ChangeNotifier {
  final GetDepartamentsUsecase _getDepartamentsUsecase;
  final GetEventsUsecase _getEventsUsecase;

  EventProvider({
    required GetDepartamentsUsecase getDepartamentsUsecase,
    required GetEventsUsecase getEventsUsecase,
  })  : _getDepartamentsUsecase = getDepartamentsUsecase,
        _getEventsUsecase = getEventsUsecase;

  bool _isLoading = false;
  String? _errorMessage;
  final List<DepartamentEntity> _departaments = [];
  int? _selectedDepartamentIndex;
  int? _selectedEventIndex;
  final List<EventEntity> _events = [];

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
    _selectedEventIndex = value;
    notifyListeners();
  }

  //getters
  List<DepartamentEntity> get departaments => _departaments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get selectedDepartamentIndex => _selectedDepartamentIndex;
  List<EventEntity> get events => _events;
  EventEntity? get selectedEvent =>
      _selectedEventIndex != null ? _events[_selectedEventIndex!] : null;
  int? get selectedEventIndex => _selectedEventIndex;
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

  Future<void> getEvents() async {
    setIsLoading(true);

    String departamentId = _departaments[_selectedDepartamentIndex!].id;
    (await _getEventsUsecase.call(params: departamentId)).fold(
      (failure) {
        setErrorMessage(failure.message);
      },
      (teachers) {
        _events.clear();
        _events.addAll(teachers);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }

  Future<void> clear() async {
    _departaments.clear();
    _events.clear();
    _selectedDepartamentIndex = null;
    _selectedEventIndex = null;
    notifyListeners();
  }
}
