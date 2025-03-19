part of 'detail_data_cubit.dart';

@freezed
class DetailDataState with _$DetailDataState {
  const factory DetailDataState.initial({
    required ModelDataDummy detailData,
    required bool isLoading,
  }) = _Initial;
}
