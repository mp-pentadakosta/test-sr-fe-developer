part of 'list_data_cubit.dart';

@freezed
class ListDataState with _$ListDataState {
  const factory ListDataState.initial({
    required List<ModelDataDummy> listData,
    required bool isLoading,
  }) = _Initial;
}
