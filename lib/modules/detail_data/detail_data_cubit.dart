import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/model_data_dummy.dart';

part 'detail_data_state.dart';
part 'detail_data_cubit.freezed.dart';

class DetailDataCubit extends Cubit<DetailDataState> {
  DetailDataCubit({
    required ModelDataDummy detailData,
  }) : super(
          DetailDataState.initial(
            isLoading: false,
            detailData: detailData,
          ),
        ) {
    getDetail(detailData);
  }

  Future<void> getDetail(ModelDataDummy detailData) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false, detailData: detailData));
  }
}
