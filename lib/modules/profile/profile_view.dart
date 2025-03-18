import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/button_widget/button_widget.dart';
import '../../widgets/image_widget.dart';
import 'profile_cubit.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  static const routeName = 'profile';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (!state.isLogin) {
            // context.replace(LoginView.routeName);
          }
        },
        builder: (context, state) {
          return _ProfileViewBody();
        },
      ),
    );
  }
}

class _ProfileViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.read<ProfileCubit>().logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.padding2,
          right: context.padding2,
          bottom: context.padding2 + context.iPadding.bottom,
          top: context.padding2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.name ?? '',
                            style: context.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            state.email ?? '',
                            style: context.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'VIP',
                                  style: context.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.background,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(width: context.padding2),
                ImageWidget(
                  height: 100,
                  width: 100,
                  image:
                      'https://c4.wallpaperflare.com/wallpaper/865/301/276/anime-solo-leveling-sung-jin-woo-hd-wallpaper-preview.jpg',
                  borderRadius: BorderRadius.circular(100),
                ),
              ],
            ),
            IButton.elevated(
              label: 'Logout',
              onPressed: () {
                context.read<ProfileCubit>().logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
