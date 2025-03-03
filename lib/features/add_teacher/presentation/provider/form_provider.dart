// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/add_students/domain/usecases/add_student_usecase.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';
import 'package:desktop_math/features/add_teacher/domain/usecases/add_teacher_usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class FormProvider extends ChangeNotifier {
  final AddTeacherUsecase _addTeacherUsecase;
  final AddStudentUsecase _addStudentUsecase;

  bool? _isLoading;
  String? _isError;
  String? _name;
  String? _email;
  String? _password;
  DepartamentEntity? _departament;
  String? _semesterId;
  int? _phoneNumber;
  String? _fatherName;
  String? _motherName;

  FormProvider(
      {required AddTeacherUsecase addTeacherUsecase,
      required AddStudentUsecase addStudentUsecase})
      : _addStudentUsecase = addStudentUsecase,
        _addTeacherUsecase = addTeacherUsecase;

  bool? get isLoading => _isLoading;
  String? get isError => _isError;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  int? get phoneNumber => _phoneNumber;
  DepartamentEntity? get departament => _departament;
  String? get fatherName => _fatherName;
  String? get motherName => _motherName;

  void setIsLoading(bool? value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSemesterId(String? value) {
    _semesterId = value;
    notifyListeners();
  }

  void setDepartament(DepartamentEntity? value) {
    _departament = value;
    notifyListeners();
  }

  void setIsError(String? value) {
    _isError = value;
    notifyListeners();
  }

  void setName(String? value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String? value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String? value) {
    _password = value;
    notifyListeners();
  }

  void setPhoneNumber(int? value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setFatherName(String? value) {
    _fatherName = value;
    notifyListeners();
  }

  void setMotherName(String? value) {
    _motherName = value;
    notifyListeners();
  }

  void reset() {
    _isLoading = null;
    _isError = null;
    _name = null;
    _email = null;
    _password = null;
    notifyListeners();
  }

  bool validateData() {
    return _name != null &&
        _email != null &&
        _password != null &&
        _phoneNumber != null &&
        // _departament != null &&
        _fatherName != null &&
        _motherName != null &&
        _phoneNumber.toString().length == 10;
  }

  Future<void> submitForm(BuildContext context, bool isTeacher) async {
    setIsLoading(true);

    UserEntity user = UserEntity(
      id: '',
      name: _name!,
      email: _email!,
      phoneNumber: _phoneNumber!,
      fatherName: _fatherName!,
      motherName: _motherName!,
    );
    if (isTeacher) {
      (await _addTeacherUsecase.call(params: {
        AppArguments.userEntity: user,
        AppArguments.departament: _departament!.id,
        AppArguments.password: _password,
      }))
          .fold(
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
              content: const Text('Teacher created succesfully'),
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
    } else {
      (await _addStudentUsecase.call(params: {
        AppArguments.userEntity: user,
        AppArguments.semesterId: _semesterId,
        AppArguments.password: _password,
      }))
          .fold(
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
              content: const Text('Teacher created succesfully'),
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
    }

    notifyListeners();
    setIsLoading(false);
  }
}
