part of 'login_cubit.dart';

class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginValidateState extends LoginState {
  final bool isValidate;

  LoginValidateState(this.isValidate);
}

class LoginSuccesful extends LoginState {
  final LoginResponseModel model;
  LoginSuccesful(this.model);
}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed({required this.message});
}

class LoginLoading extends LoginState {
  final bool isLoading;
  LoginLoading(this.isLoading);
}
