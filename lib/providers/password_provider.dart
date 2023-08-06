import 'package:flutter/widgets.dart';

class PasswordProvider with ChangeNotifier {
  bool _isObscure = true;
  bool _isObscureOldPassword = true;
  bool _isObscureNewPassword = true;
  bool _isObscureConfirmPassword = true;


  bool get isObscure {
    return _isObscure;
  }
  bool get isObscureOldPassword {
    return _isObscureOldPassword;
  }
  bool get isObscureNewPassword {
    return _isObscureNewPassword;
  }
  bool get isObscureConfirmPassword {
    return _isObscureConfirmPassword;
  }


  void toggleIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
  void toggleIsObscureOldPassword() {
    _isObscureOldPassword = !_isObscureOldPassword;
    notifyListeners();
  }
  void toggleIsObscureNewPassword() {
    _isObscureNewPassword = !_isObscureNewPassword;
    notifyListeners();
  }
  void toggleIsObscureConfirmPassword() {
    _isObscureConfirmPassword = !_isObscureConfirmPassword;
    notifyListeners();
  }
}
