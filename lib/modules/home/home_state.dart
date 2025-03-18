part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.initial({
    required bool isLoading,
  }) = _Initial;
}
