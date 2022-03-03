import 'package:flutter/material.dart';

import '../../data/data.dart';

class JobProvider extends ChangeNotifier {
  final List<JobEntity> jobs;

  JobProvider() : jobs = JobEntity.generateDummyJobs(110) {
    jobs.take(10).forEach(
          (element) => element.isPopular = true,
        );
  }

  void bookmark(int id) {
    final job = jobs.firstWhere((element) => element.id == id);

    job.isBookmarked = !job.isBookmarked;

    notifyListeners();
  }
}
