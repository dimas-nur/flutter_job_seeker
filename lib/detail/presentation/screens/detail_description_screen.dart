import 'package:flutter/material.dart';

import '../../../core/core.dart';

class DetailDescriptionScreen extends StatefulWidget {
  final JobEntity job;

  const DetailDescriptionScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  _DetailDescriptionScreenState createState() =>
      _DetailDescriptionScreenState();
}

class _DetailDescriptionScreenState extends State<DetailDescriptionScreen> {
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(
        scrollbars: false,
        overscroll: false,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'About this job',
              style: _theme.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ExpandableText(
              text: widget.job.description,
              trimLines: 4,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Job Responsibilities',
              style: _theme.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ...widget.job.responsibilities.map(
              (text) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryDark.withOpacity(.3),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
