import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sr_app_test/core/extensions/context_extensions.dart';
import 'package:sr_app_test/core/theme/app_colors.dart';
import 'package:sr_app_test/domain/model/model_data_dummy.dart';
import 'package:sr_app_test/modules/detail_data/detail_data_cubit.dart';
import 'package:sr_app_test/modules/detail_data/widget/widget_package.dart';
import 'package:sr_app_test/widgets/image_widget.dart';

import 'widget/tab_bar_detail/tab_bar_detail_data.dart';

@RoutePage()
class DetailDataView extends StatelessWidget {
  static const routeName = 'detailData';

  final ModelDataDummy detailData;

  const DetailDataView({
    super.key,
    required this.detailData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailDataCubit(detailData: detailData),
      child: const _DetailDataBody(),
    );
  }
}

class _DetailDataBody extends StatelessWidget {
  const _DetailDataBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailDataCubit, DetailDataState>(
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: context.mQHeight(0.25),
                  floating: false,
                  pinned: true,
                  flexibleSpace: state.isLoading
                      ? const Skeletonizer(child: _WidgetImage())
                      : const _WidgetImage(),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.sbHeight(context.padding2),
                  if (state.isLoading)
                    const Skeletonizer(child: _TitleWidget()),
                  if (!state.isLoading) const _TitleWidget(),
                  context.sbHeight(context.padding2),
                  if (state.isLoading) const Skeletonizer(child: _WidgetDesc()),
                  if (!state.isLoading) const _WidgetDesc(),
                  context.sbHeight(context.padding1 + context.padding0),
                  Divider(
                    thickness: context.padding1,
                    height: context.padding1,
                    color: AppColors.background,
                  ),
                  if (state.isLoading)
                    Skeletonizer(
                      child: WidgetPackage(
                        listPricePackage: [
                          ...List.generate(
                            3,
                            (index) => PricePackage(
                              title: 'Lorem Ipsum',
                              description:
                                  'Lorem Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua',
                              excludedFacilities: [
                                'excludedFacilities',
                                'excludedFacilities',
                              ],
                              includedFacilities: [
                                'includedFacilities',
                                'includedFacilities',
                              ],
                              maxParticipants: 1,
                              price: 'IDR 20.000',
                              termsAndConditions:
                                  'Lorem Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua',
                            ),
                          )
                        ],
                      ),
                    ),
                  if (!state.isLoading)
                    WidgetPackage(
                      listPricePackage: state.detailData.pricePackage,
                    ),
                  context.sbHeight(context.iPadding.bottom + context.padding4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WidgetDesc extends StatelessWidget {
  const _WidgetDesc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailDataCubit, DetailDataState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.padding2),
              color: AppColors.background,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: context.titleSmall,
                ),
                context.sbHeight(context.padding1),
                Text(
                  state.detailData.description,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                context.sbHeight(context.padding1 + context.padding0),
                InkWell(
                  onTap: () {
                    context.showModalBottomSheetCustom(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TabBarDetailData(
                            detailData: state.detailData,
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Baca Selengkapnya',
                    style: context.titleMedium?.copyWith(
                      color: AppColors.elevationLevel(
                        ElevationType.level13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailDataCubit, DetailDataState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.detailData.title,
                style: context.headlineMedium,
              ),
              context.sbHeight(context.padding0),
              Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    size: context.padding2,
                    color: AppColors.primary,
                  ),
                  context.sbWidth(context.padding0),
                  Text(
                    state.detailData.location,
                    style: context.titleSmall,
                  ),
                ],
              ),
              context.sbHeight(context.padding0),
              Row(
                children: [
                  Icon(
                    Icons.emoji_events,
                    size: context.padding2,
                    color: AppColors.primary,
                  ),
                  context.sbWidth(context.padding0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${state.detailData.rating} ',
                          style: context.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              '/ 5.0 (${state.detailData.totalRating} reviews)',
                          style: context.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              context.sbHeight(context.padding0),
              Row(
                children: [
                  Icon(
                    Icons.people_sharp,
                    size: context.padding2,
                    color: AppColors.primary,
                  ),
                  context.sbWidth(context.padding0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${state.detailData.currentParticipants}',
                          style: context.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '/${state.detailData.maxParticipants}',
                          style: context.bodyMedium?.copyWith(),
                        ),
                        TextSpan(
                          text: ' Peserta saat ini',
                          style: context.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WidgetImage extends StatefulWidget {
  const _WidgetImage();

  @override
  State<_WidgetImage> createState() => _WidgetImageState();
}

class _WidgetImageState extends State<_WidgetImage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailDataCubit, DetailDataState>(
      builder: (context, state) {
        return SizedBox(
          width: context.mQWidth(1),
          height: context.mQHeight(0.35),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: state.detailData.photos.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    ImageWidget(
                      image: state.detailData.photos[index],
                      width: context.mQWidth(1),
                      height: context.mQHeight(0.35),
                    ),
                    Container(
                      width: context.mQWidth(1),
                      height: context.mQHeight(0.35),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withAlpha(100),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!state.isLoading)
                Positioned(
                  bottom: context.padding1,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _pointIndicator(
                      _currentIndex,
                      state.detailData.photos.length,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _pointIndicator(int index, int length) {
    return List.generate(
      length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 10,
          width: index == _currentIndex ? 14 : 10,
          decoration: BoxDecoration(
            color:
                index == _currentIndex ? AppColors.primary : AppColors.backdrop,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
