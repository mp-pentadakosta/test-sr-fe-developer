import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_app_test/widgets/image_widget.dart';
import '../../../../domain/model/model_data_dummy.dart';
import '../../../../modules/detail_data/widget/tab_bar_detail/tab_bar_detail_cubit.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class TabBarDetailData extends StatelessWidget {
  final ModelDataDummy detailData;
  const TabBarDetailData({
    super.key,
    required this.detailData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarDetailCubit(),
      child: BlocBuilder<TabBarDetailCubit, TabBarDetailState>(
        builder: (context, state) {
          return SizedBox(
            height: context.mQHeight(0.84),
            child: DefaultTabController(
              length: 3,
              animationDuration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.backdrop,
                    indicatorColor: AppColors.primary,
                    dividerColor: Colors.transparent,
                    enableFeedback: false,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    labelStyle: context.titleSmall,
                    isScrollable: true,
                    tabs: const [
                      Tab(text: 'Deskripsi'),
                      Tab(text: 'S & K'),
                      Tab(text: 'Review'),
                    ],
                  ),
                  context.sbHeight(context.padding2),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _DescriptionTabData(detailData: detailData),
                        _TncTabData(detailData: detailData),
                        _ReviewTabData(detailData: detailData),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DescriptionTabData extends StatelessWidget {
  final ModelDataDummy detailData;
  const _DescriptionTabData({required this.detailData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ringkasan', style: context.titleSmall),
          context.sbHeight(context.padding0),
          Text(detailData.description, style: context.bodyLarge),
          context.sbHeight(context.padding3),
          Text('Fasilitas yang termasuk', style: context.titleSmall),
          context.sbHeight(context.padding0),
          Text(detailData.includedFacilities.join(', '),
              style: context.bodyLarge),
          context.sbHeight(context.padding3),
          Text('Fasilitas yang tidak termasuk', style: context.titleSmall),
          context.sbHeight(context.padding0),
          Text(detailData.excludedFacilities.join(', '),
              style: context.bodyLarge),
        ],
      ),
    );
  }
}

class _TncTabData extends StatelessWidget {
  final ModelDataDummy detailData;
  const _TncTabData({required this.detailData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Text(detailData.termsAndConditions, style: context.bodyLarge),
    );
  }
}

class _ReviewTabData extends StatelessWidget {
  final ModelDataDummy detailData;
  const _ReviewTabData({required this.detailData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            detailData.ratings.length,
            (index) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding2),
                  child: Container(
                    width: context.mQWidth(1),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(context.padding2),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.backdrop.withAlpha(30),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.padding2,
                      vertical: context.padding1 + context.padding0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ImageWidget(
                              image: detailData.ratings[index].photo,
                              height: context.padding6,
                              width: context.padding6,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            context.sbWidth(context.padding1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailData.ratings[index].name,
                                  style: context.titleSmall,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: detailData.ratings[index].rating
                                            .toString(),
                                        style: context.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' / 5',
                                        style: context.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        context.sbHeight(context.padding1),
                        Text(
                          detailData.ratings[index].review,
                          style: context.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                context.sbHeight(context.padding2),
              ],
            ),
          ),
          context.sbHeight(
            context.iPadding.bottom + context.padding4,
          ),
        ],
      ),
    );
  }
}
