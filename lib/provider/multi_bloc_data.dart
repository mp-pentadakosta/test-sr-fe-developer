import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../modules/home/home_cubit.dart';
import '../modules/profile/profile_cubit.dart';

List<SingleChildWidget> providersData = [
  BlocProvider(create: (context) => HomeCubit()),
  BlocProvider(create: (context) => ProfileCubit()),
];
