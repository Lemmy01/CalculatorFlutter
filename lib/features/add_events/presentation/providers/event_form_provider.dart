// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:usv_hub_management/features/add_events/domain/entities/event_entity.dart';
import 'package:usv_hub_management/features/add_events/domain/usecases/add_event_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventFormProvider extends ChangeNotifier {
  final AddEventUsecase _addEventUsecase;

  bool? _isLoading;
  String? _isError;
  String? _title;
  String? _departamentId;
  String? _classWhereHeld;
  String? _supporterName;
  DateTime? _startTime;
  DateTime? _endTime;
  DateTime? _date;

  EventFormProvider({
    required AddEventUsecase addEventUsecase,
  }) : _addEventUsecase = addEventUsecase;

  bool? get isLoading => _isLoading;
  String? get isError => _isError;

  String? get title => _title;
  String? get departamentId => _departamentId;
  String? get classWhereHeld => _classWhereHeld;
  String? get supporterName => _supporterName;
  DateTime? get startTime => _startTime;
  DateTime? get endTime => _endTime;
  DateTime? get date => _date;

  void setDate(DateTime? value) {
    _date = value;
    notifyListeners();
  }

  void setTitle(String? value) {
    _title = value;
    notifyListeners();
  }

  void setDepartamentId(String? value) {
    _departamentId = value;
    notifyListeners();
  }

  void setClassWhereHeld(String? value) {
    _classWhereHeld = value;
    notifyListeners();
  }

  void setSupporterName(String? value) {
    _supporterName = value;
    notifyListeners();
  }

  void setStartTime(DateTime? value) {
    _startTime = value;
    notifyListeners();
  }

  void setEndTime(DateTime? value) {
    _endTime = value;
    notifyListeners();
  }

  void setIsError(String? value) {
    _isError = value;
    notifyListeners();
  }

  void setIsLoading(bool? value) {
    _isLoading = value;
    notifyListeners();
  }

  void reset() {
    _isLoading = null;
    _isError = null;
    _title = null;
    _departamentId = null;
    _classWhereHeld = null;
    _supporterName = null;
    _startTime = null;
    _endTime = null;
    _isError = null;
    _isLoading = null;
    _departamentId = null;
    notifyListeners();
  }

  bool validateData() {
    return _title != null &&
        _departamentId != null &&
        _classWhereHeld != null &&
        _supporterName != null &&
        _startTime != null &&
        _endTime != null;
  }

  Future<void> submitForm(
    BuildContext context,
  ) async {
    setIsLoading(true);

    DateTime startDate = DateTime(
      _date!.year,
      _date!.month,
      _date!.day,
      _startTime!.hour,
      _startTime!.minute,
    );
    DateTime endDate = DateTime(
      _date!.year,
      _date!.month,
      _date!.day,
      _endTime!.hour,
      _endTime!.minute,
    );
    EventEntity event = EventEntity(
      id: '',
      departamentId: _departamentId!,
      title: _title!,
      startTime: startDate,
      endTime: endDate,
      classWhereHeld: _classWhereHeld!,
      supporterName: _supporterName!,
    );

    (await _addEventUsecase.call(params: event)).fold(
      (failure) async {
        await displayInfoBar(context, builder: (context, close) {
          return InfoBar(
            title: const Text('Error'),
            content: Text(failure.message),
            action: IconButton(
              icon: const Icon(FluentIcons.clear),
              onPressed: close,
            ),
            severity: InfoBarSeverity.warning,
          );
        });
      },
      (_) async {
        await displayInfoBar(context, builder: (context, close) {
          return InfoBar(
            title: const Text('Succes'),
            content: const Text('Event created succesfully'),
            action: IconButton(
              icon: const Icon(FluentIcons.clear),
              onPressed: close,
            ),
            severity: InfoBarSeverity.warning,
          );
        });
        reset();
        // if (context.mounted) Navigator.pop(context);
      },
    );

    notifyListeners();
    setIsLoading(false);
  }
}
