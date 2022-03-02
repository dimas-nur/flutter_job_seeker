import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../core/presentation/provider/job_provider.dart';
import '../../../detail/presentation/pages/detail_page.dart';
import '../presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeData _theme;

  final _searchController = TextEditingController();

  bool _isSearchJob = false;

  Timer? _searchDebounce;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                expandedHeight: 84,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: _flexibleWidget(),
                ),
              )
            ];
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _searchWidget(),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(
                    overscroll: false,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      if (_isSearchJob)
                        _searchJobWidget()
                      else ...[
                        _popularJobWidget(),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 8,
                          ),
                        ),
                        ..._recommendationJobWidget(),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flexibleWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Dimas!',
                  style: _theme.textTheme.bodyText1?.copyWith(
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  AppStrings.homeGreeting,
                  style: _theme.textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CustomIconButton(
            onTap: () {
              context.showUnderDevelopment();
            },
            icon: SvgPicture.asset(
              AppIcons.icNotification,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchWidget() {
    return StatefulBuilder(
      builder: (context, localSetState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      AppProperties.shadow,
                    ],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.icSearch,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          decoration: const InputDecoration(
                            hintText: AppStrings.homeSearchHint,
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                          onChanged: (value) {
                            _searchDebounce?.cancel();

                            _searchDebounce = Timer(
                              const Duration(milliseconds: 300),
                              () {
                                setState(() {
                                  _isSearchJob = value.trim().isNotEmpty;
                                });
                              },
                            );

                            localSetState(() {});
                          },
                          onSubmitted: (value) {
                            _searchDebounce?.cancel();

                            setState(() {
                              _isSearchJob = value.trim().isNotEmpty;
                            });
                          },
                        ),
                      ),
                      if (_searchController.text.trim().isNotEmpty) ...[
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            _searchDebounce?.cancel();

                            setState(() {
                              _searchController.clear();
                              _isSearchJob = false;
                            });
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            size: 24,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              CustomIconButton(
                width: 48,
                height: 48,
                backgroundColor: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  context.showUnderDevelopment();
                },
                icon: SvgPicture.asset(
                  AppIcons.icFilter,
                  width: 24,
                  height: 24,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _popularJobWidget() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              AppStrings.homePopularJob,
              style: _theme.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Consumer<JobProvider>(
            builder: (context, value, child) {
              final _popularJobs = value.jobs
                  .where(
                    (element) => element.isPopular,
                  )
                  .toList();

              return SizedBox(
                height: 180,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final job = _popularJobs[index];

                    return ItemJobPopular(
                      job: job,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(
                                jobId: job.id,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 16,
                    );
                  },
                  itemCount: _popularJobs.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _recommendationJobWidget() {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            AppStrings.homeRecommendationJob,
            style: _theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Consumer<JobProvider>(
        builder: (context, value, child) {
          final _jobs = value.jobs
              .where(
                (element) => !element.isPopular,
              )
              .toList();

          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final job = _jobs[index];

                  return ItemJob(
                    job: job,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailPage(
                              jobId: job.id,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                childCount: _jobs.length,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 236,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 124,
              ),
            ),
          );
        },
      ),
    ];
  }

  Widget _searchJobWidget() {
    final _keyword = _searchController.text.trim();

    return Consumer<JobProvider>(
      builder: (context, value, child) {
        final _jobs = value.jobs.where(
          (job) {
            final _jobCategories = [
              job.timeStatus,
              job.locationStatus,
              ...job.categories,
            ].join(' - ');

            return !job.isPopular &&
                (job.name.toLowerCase().contains(_keyword.toLowerCase()) ||
                    _jobCategories
                        .toLowerCase()
                        .contains(_keyword.toLowerCase()) ||
                    job.company.name
                        .toLowerCase()
                        .contains(_keyword.toLowerCase()) ||
                    job.company.location
                        .toLowerCase()
                        .contains(_keyword.toLowerCase()));
          },
        ).toList();

        if (_jobs.isNotEmpty) {
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final job = _jobs[index];

                  return ItemJobPopular(
                    job: job,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailPage(
                              jobId: job.id,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                childCount: _jobs.length,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 148,
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SvgPicture.asset(
                        AppIllustrations.illResult,
                        // width: 124,
                        height: 124,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      child: Text(
                        AppStrings.emptyResultTitle,
                        style: _theme.textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Flexible(
                      child: Text(
                        AppStrings.emptyResultDescription,
                        style: _theme.textTheme.bodyText1?.copyWith(
                          fontSize: 18,
                          color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
