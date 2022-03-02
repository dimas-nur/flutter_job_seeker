import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/core/presentation/provider/job_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/constant.dart';
import '../../../core/core.dart';
import '../../../core/data/data.dart';
import '../../../core/data/entities/job_entity.dart';
import '../../../core/presentation/widgets/widgets.dart';
import '../../../detail/presentation/pages/detail_page.dart';
import '../presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeData _theme;

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
                expandedHeight: 108,
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
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(
                    overscroll: false,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _popularJobWidget(),
                        const SizedBox(
                          height: 8,
                        ),
                        _recommendationJobWidget(),
                      ],
                    ),
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
      padding: const EdgeInsets.all(24),
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

  Widget _appBarContent() {
    return Container(
      height: AppBar().preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            onTap: () {},
            icon: SvgPicture.asset(
              AppIcons.icCategory,
              width: 24,
              height: 24,
            ),
          ),
          CustomIconButton(
            onTap: () {},
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  const Expanded(
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: AppStrings.homeSearchHint,
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                    ),
                  ),
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
  }

  Widget _popularJobWidget() {
    return Column(
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
    );
  }

  Widget _recommendationJobWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            AppStrings.homeRecommendationJob,
            style: _theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
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

            return GridView.builder(
              itemCount: _jobs.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 236,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 124,
              ),
              itemBuilder: (context, index) {
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
            );
          },
        ),
      ],
    );
  }
}
