import 'package:flutter/foundation.dart';
import 'package:calenurse_app/domain/user/user.dart';
import 'package:calenurse_app/services/auth_service.dart';

class AuthStore with ChangeNotifier, DiagnosticableTreeMixin {
  final User _user = User(
      id: '2351838c-7c11-4670-b08e-fd49865c997e',
      name: 'Dana Vallejos',
      email: 'enfermera@acalenurse.pe',
      type: 'Nurse',
      area: 'Ginecologia',
      areaId: '5f39c7e5-5e61-43ab-818e-0a1699369f83',
      photoUrl:
          'https://media.licdn.com/dms/image/C4E03AQHRj-FW4YyW0w/profile-displayphoto-shrink_200_200/0/1656041131139?e=2147483647&v=beta&t=XJvJbfhzzAJDAMAGngiEbfB0hcQ99vQP6OjO76HrsaI');

  User get user => _user;

  void setUser(User user) {
    _user.id = user.id;
    _user.name = user.name;
    _user.email = user.email;
    _user.type = user.type;
    _user.area = user.area;
    _user.photoUrl = user.photoUrl;
    _user.areaId = user.areaId;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    try {
      AuthService authService = AuthService();
      User user;
      user = await authService.login(username, password);
      setUser(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('user', _user));
  }
}
