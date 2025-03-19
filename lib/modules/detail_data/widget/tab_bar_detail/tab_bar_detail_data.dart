import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../modules/detail_data/widget/tab_bar_detail/tab_bar_detail_cubit.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class TabBarDetailData extends StatelessWidget {
  final String description;
  final String tnc;
  const TabBarDetailData({
    super.key,
    required this.description,
    required this.tnc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarDetailCubit(),
      child: BlocBuilder<TabBarDetailCubit, TabBarDetailState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding2),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(context.padding2),
                      onTap: () {
                        context
                            .read<TabBarDetailCubit>()
                            .changeTabBar(TabBarDetail.description);
                      },
                      child: SizedBox(
                        width: context.padding10 + context.padding2,
                        child: Column(
                          children: [
                            Text(
                              'Deskripsi',
                              style: context.titleSmall,
                            ),
                            Divider(
                              thickness: 2,
                              color:
                                  state.tabBarDetail == TabBarDetail.description
                                      ? AppColors.primary
                                      : AppColors.background,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    context.sbWidth(context.padding2),
                    InkWell(
                      borderRadius: BorderRadius.circular(context.padding2),
                      onTap: () {
                        context
                            .read<TabBarDetailCubit>()
                            .changeTabBar(TabBarDetail.tnc);
                      },
                      child: SizedBox(
                        width: context.padding9,
                        child: Column(
                          children: [
                            Text(
                              'S & K',
                              style: context.titleSmall,
                            ),
                            Divider(
                              thickness: 2,
                              color: state.tabBarDetail == TabBarDetail.tnc
                                  ? AppColors.primary
                                  : AppColors.background,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                context.sbHeight(context.padding2),
                if (state.tabBarDetail == TabBarDetail.description)
                  _DescriptionTabData(description: description),
                if (state.tabBarDetail == TabBarDetail.tnc)
                  _TncTabData(tnc: tnc),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DescriptionTabData extends StatelessWidget {
  final String description;
  const _DescriptionTabData({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(description);
  }
}

class _TncTabData extends StatelessWidget {
  final String tnc;
  const _TncTabData({required this.tnc});

  @override
  Widget build(BuildContext context) {
    return Text(tnc);
  }
}
