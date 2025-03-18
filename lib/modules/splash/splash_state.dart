part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial({
    required bool isLoading,
    required bool isLogin,
  }) = _Initial;
}
