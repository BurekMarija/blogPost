enum LoginAction {
  loginAnon,
  loginWithEmail,
  register,
  logout,
  setUser,
  setError,
}

enum Types { switchauthtype }

class LoginWithEmail{
  final String email;
  final String password;
  LoginWithEmail({ required this.email, required this.password});
}
class Logout{
  final int broj;
  Logout({required this.broj});
}

class RegisterUser{
  final String email;
  final String password;
  RegisterUser({ required this.email, required this.password});
}