import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_bar_detail_state.dart';
part 'tab_bar_detail_cubit.freezed.dart';

enum TabBarDetail { description, tnc }

class TabBarDetailCubit extends Cubit<TabBarDetailState> {
  TabBarDetailCubit()
      : super(const TabBarDetailState.initial(
          tabBarDetail: TabBarDetail.description,
        ));

  void changeTabBar(TabBarDetail tabBarDetail) {
    emit(
      state.copyWith(tabBarDetail: tabBarDetail),
    );
  }
}
