part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    required bool isShowPassword,
    required bool isLoading,
    required bool isLoginSuccess,
  }) = _Initial;
}
