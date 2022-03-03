import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../detail/detail.dart';
import '../home/home.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.bookmarkTittle,
          style: _theme.textTheme.bodyText1?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          overscroll: false,
        ),
        child: CustomScrollView(
          slivers: [
            Consumer<JobProvider>(
              builder: (_, value, child) {
                final _jobs =
                    value.jobs.where((job) => job.isBookmarked).toList();

                if (_jobs.isNotEmpty) {
                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
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
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 148,
                      ),
                    ),
                  );
                } else {
                  return SliverPadding(
                    padding: const EdgeInsets.all(36),
                    sliver: SliverToBoxAdapter(
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
                              AppStrings.emptyBookmarkTitle,
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
                              AppStrings.emptyBookmarkDescription,
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
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
