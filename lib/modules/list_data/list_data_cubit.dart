import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/model/model_data_dummy.dart';
import '../../dummy/list_data_dummy.dart';

part 'list_data_state.dart';
part 'list_data_cubit.freezed.dart';

class ListDataCubit extends Cubit<ListDataState> {
  ListDataCubit()
      : super(const ListDataState.initial(
          isLoading: false,
          listData: [],
        ));

  Future<void> getListData() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false, listData: listDataDummy));
  }
}
