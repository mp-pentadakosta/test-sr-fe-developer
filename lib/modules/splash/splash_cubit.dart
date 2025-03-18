import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/shared/constant.dart';
import '../../core/shared/shared_preferences.dart';

part 'splash_state.dart';

part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(const SplashState.initial(
          isLogin: false,
          isLoading: false,
        )) {
    checkLogin();
  }

  Future checkLogin() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    var token = await IStorage.getDataString(IConstant.token);
    if (token == null) {
      emit(state.copyWith(isLogin: false, isLoading: false));
    } else {
      emit(state.copyWith(isLogin: true, isLoading: false));
    }
  }
}
