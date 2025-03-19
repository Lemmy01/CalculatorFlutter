import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/features/login/domain/usecases/is_loged_usecase.dart';
import 'package:usv_hub_management/features/login/domain/usecases/login_usecase.dart';
import 'package:usv_hub_management/features/login/domain/usecases/logout_usecase.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginProvider extends ChangeNotifier {
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  final IsLogedInUsecase _isLogedInUsecase;

  LoginProvider(
      this._loginUsecase, this._logoutUsecase, this._isLogedInUsecase);

  String? _errorMessage;
  bool _isLoading = false;
  String? _email;
  String? _password;
  bool _isLogedIn = false;

  String? get getErrorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  String? get getEmail => _email;
  String? get getPassword => _password;
  bool get isLogedIn => _isLogedIn;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login() async {
    if (_email == null || _password == null) {
      _errorMessage = 'Email and password are required';
      notifyListeners();
      return;
    }
    if (!_email!.contains('@') || !_email!.contains('.')) {
      _errorMessage = 'Invalid email';
      notifyListeners();
      return;
    }

    if (_password!.length < 6) {
      _errorMessage = 'Password must be at least 6 characters';
      notifyListeners();
      return;
    }

    setLoading(true);
    Map<String, String> data = {
      AppTextConst.email: _email!,
      AppTextConst.password: _password!,
    };
    final result = await _loginUsecase(params: data);
    result.fold((l) {
      _errorMessage = l.message;
      setLoading(false);
    }, (r) {
      _errorMessage = null;
      _isLogedIn = true;
      setLoading(false);
    });
    notifyListeners();
  }

  void logout() async {
    _isLoading = true;
    (await _logoutUsecase(params: null)).fold((l) {
      _errorMessage = l.message;
    }, (r) {
      _errorMessage = null;
      _isLogedIn = false;
      clearProvider();
    });
    _isLoading = false;
    notifyListeners();
  }

  Future<void> checkLogin() async {
    final result = await _isLogedInUsecase(params: null);

    result.fold((l) {
      _errorMessage = l.message;
      _isLogedIn = false;
    }, (r) {
      _errorMessage = null;
      _isLogedIn = r;
    });
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void clearProvider() {
    _email = null;
    _password = null;
    _errorMessage = null;
    _isLogedIn = false;
    notifyListeners();
  }
}
