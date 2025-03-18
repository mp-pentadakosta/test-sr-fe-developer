import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/shared/shared_preferences.dart';
import '../../shared/constant.dart';

part 'profile_state.dart';

part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(const ProfileState.initial(
          isLogin: true,
        )) {
    getUser();
  }

  Future getUser() async {
    var name = await IStorage.getDataString(IConstantData.username);
    var email = await IStorage.getDataString(IConstantData.email);
    if (name != null) {
      emit(state.copyWith(name: name));
    }
    if (email != null) {
      emit(state.copyWith(email: email));
    }
  }

  Future logout() async {
    await IStorage.removeAllData();
    emit(const ProfileState.initial(isLogin: false));
  }
}
