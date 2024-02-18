part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  RegisterInitial();
}

class RegisterValidate extends RegisterState {
  final bool isValid;

  RegisterValidate(this.isValid);
}

class RegisterSuccessful extends RegisterState {
  final String message;
  RegisterSuccessful({required this.message});
}

class RegisterFailed extends RegisterState {
  final String message;
  RegisterFailed({required this.message});
}

class RegisterIsLoading extends RegisterState {
  final bool isLoading;

  RegisterIsLoading(this.isLoading);
}
