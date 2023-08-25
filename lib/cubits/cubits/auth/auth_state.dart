part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthUnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String errorText;

  AuthErrorState({required this.errorText});

  @override
  List<Object?> get props => [];
}

class AuthSendCodeSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthConfirmCodeSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoggedState extends AuthState {
  @override
  List<Object?> get props => [];
}
