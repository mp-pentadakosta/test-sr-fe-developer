import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(const LoginState.initial(
          isShowPassword: false,
          isLoading: false,
          isLoginSuccess: false,
        ));

  void showPassword() {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  Future<void> login() async {}
}
