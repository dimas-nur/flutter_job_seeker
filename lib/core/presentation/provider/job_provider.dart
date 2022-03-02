import 'package:flutter/material.dart';

import '../../data/data.dart';

class JobProvider extends ChangeNotifier {
  final List<JobEntity> jobs;

  JobProvider() : jobs = JobEntity.generateDummyJobs(110) {
    jobs.take(10).forEach(
          (element) => element.isPopular = true,
        );
  }
}
