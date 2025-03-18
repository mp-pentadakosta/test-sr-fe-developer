import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/image_widget.dart';
import 'splash_cubit.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  static const routeName = '';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: _SplashBody(),
      ),
    );
  }
}

class _SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.isLogin) {
          // context.replace('/${HomeView.routeName}');
        } else {
          // context.replace(OnboardView.routeName);
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: ImageWidget(
              image: 'assets/img/Tengkuang.PNG',
              width: 200,
              height: 200,
            ),
          ),
        );
      },
    );
  }
}
