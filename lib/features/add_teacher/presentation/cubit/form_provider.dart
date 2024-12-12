// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FormProvider extends ChangeNotifier {
  bool? _isLoading;
  String? _isError;
  String? _name;
  String? _email;
  String? _password;
  DepartamentEntity? _departament;
  int? _phoneNumber;

  FormProvider({
    bool? isLoading,
    String? isError,
    String? name,
    String? email,
    String? password,
    int? phoneNumber,
    DepartamentEntity? departament,
  })  : _isLoading = isLoading,
        _isError = isError,
        _name = name,
        _email = email,
        _password = password,
        _phoneNumber = phoneNumber,
        _departament = departament;

  bool? get isLoading => _isLoading;
  String? get isError => _isError;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  int? get phoneNumber => _phoneNumber;
  DepartamentEntity? get departament => _departament;

  void setIsLoading(bool? value) {
    _isLoading = value;
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

  void reset() {
    _isLoading = null;
    _isError = null;
    _name = null;
    _email = null;
    _password = null;
    notifyListeners();
  }

  Future<void> submitForm(BuildContext context) async {
    //validate data
    if (_name == null ||
        _email == null ||
        _password == null ||
        _phoneNumber == null && _departament == null) {
      setIsError('Please fill all fields');
      return;
    }
    if (_name!.isEmpty || _email!.isEmpty || _password!.isEmpty) {
      setIsError('Please fill all fields');
      return;
    }

    if (_password!.length < 6) {
      setIsError('Password must be at least 6 characters');
      return;
    }

    if (_name!.length < 3) {
      setIsError('Name must be at least 3 characters');
      return;
    }

    if (!_email!.contains('@')) {
      setIsError('Invalid email');
      return;
    }

    setIsLoading(true);

    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text('Form submitted'),
          content: Text('Name: $_name\nEmail: $_email'),
          actions: [
            Button(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );

    setIsLoading(false);
  }
}
