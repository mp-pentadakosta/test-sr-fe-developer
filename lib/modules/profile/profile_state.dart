part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    required bool isLogin,
    String? name,
    String? email,
  }) = _Initial;
}
