import 'dart:math';

import 'package:equatable/equatable.dart';

import '../data.dart';

class JobEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final List<String> responsibilities;
  final JobCategoryEntity timeStatus;
  final JobCategoryEntity locationStatus;
  final List<JobCategoryEntity> categories;
  final CompanyEntity company;
  final JobSalaryEntity jobSalary;
  bool isPopular;
  bool isBookmarked;

  JobEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.responsibilities,
    required this.timeStatus,
    required this.locationStatus,
    this.categories = const [],
    required this.company,
    required this.jobSalary,
    this.isPopular = false,
    this.isBookmarked = false,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      responsibilities,
      timeStatus,
      locationStatus,
      categories,
      company,
      jobSalary,
      isPopular,
      isBookmarked,
    ];
  }

  JobEntity copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? responsibilities,
    JobCategoryEntity? timeStatus,
    JobCategoryEntity? locationStatus,
    List<JobCategoryEntity>? categories,
    CompanyEntity? company,
    JobSalaryEntity? jobSalary,
    bool? isPopular,
    bool? isBookmarked,
  }) {
    return JobEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      responsibilities: responsibilities ?? this.responsibilities,
      timeStatus: timeStatus ?? this.timeStatus,
      locationStatus: locationStatus ?? this.locationStatus,
      categories: categories ?? this.categories,
      company: company ?? this.company,
      jobSalary: jobSalary ?? this.jobSalary,
      isPopular: isPopular ?? this.isPopular,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  static List<JobEntity> generateDummyJobs(int length) => List.generate(
        length,
        (index) {
          return (_listDummyBaseJob..shuffle()).first().copyWith(id: index);
        },
      );

  // Base Job

  static JobEntity _dummyBaseJob() {
    final isFullTime = Random().nextBool();
    final isOnsite = Random().nextBool();
    final randomLevel = Random().nextInt(4);

    return JobEntity(
      id: 0,
      name: 'name',
      description: 'description',
      responsibilities: const [
        'responsibilities',
      ],
      timeStatus:
          isFullTime ? JobCategoryEntity.fullTime : JobCategoryEntity.partTime,
      locationStatus:
          isOnsite ? JobCategoryEntity.onsite : JobCategoryEntity.remote,
      categories: [
        if (randomLevel == 0) JobCategoryEntity.senior,
        if (randomLevel == 1) JobCategoryEntity.junior
      ],
      company: (CompanyEntity.dummyCompanies.toList()..shuffle()).first,
      jobSalary: randomLevel == 0
          ? JobSalaryEntity.dummySenior.randomExtra()
          : randomLevel == 1
              ? JobSalaryEntity.dummyJunior.randomExtra()
              : JobSalaryEntity.dummyJunior.randomExtra(),
    );
  }

  static final _listDummyBaseJob = [
    _dummyMobileEngineer,
    _dummyWebEngineer,
    _dummyGraphicDesigner,
    _dummyItSupportEngineer,
    _dummySystemAnalyst,
    _dummyDataScientist,
  ];

  static JobEntity _dummyMobileEngineer() {
    final _baseJob = _dummyBaseJob();
    final _name =
        '${_baseJob.categories.contains(JobCategoryEntity.senior) ? 'Senior ' : _baseJob.categories.contains(JobCategoryEntity.junior) ? 'Junior ' : ''}Mobile Engineer';

    return _baseJob.copyWith(
      name: _name,
      description:
          "Mobile engineers design, develop, and implement software programs for smartphones and other mobile devices. They often specialize in a certain type of operating system, such as Android or iOS. They use data-driven insights to guide development of programs and apps that fill a user need. They create specifications and detailed plans, write code, oversee testing and debugging, and play an active role in the rollout and launch. They commonly work in close collaboration with other engineers, designers, R&D, analysts, and other teams and stakeholders. \n\nMobile engineers typically have at least a bachelor’s degree in an engineering or computer science field. They generally have a background in engineering or computer programming. Proficiency with common programming languages is required, and experience with automated testing tools on a mobile platform is helpful.",
      responsibilities: [
        'Experience with Android Software Development and Android Studio.',
        'Fluency in interfacing and unit testing.',
        'Is comfortable debugging and working with object oriented programming.',
        'Elevate code into the development, test, and production environments on schedule.',
        'Manage the design and architecture of modules in the overall product.',
        'Direct internal and external resources in software development to deliver assigned modules.',
        'Assist with troubleshooting production problems, root cause analysis, and debugging.',
        'Actively engage in development activities associated with develop new solutions and refining current solutions.',
        'Maintain constant communication within IT and other business units.',
        'Contribute to build top quality engineering teams and technology practices.',
      ],
    );
  }

  static JobEntity _dummyWebEngineer() {
    final _baseJob = _dummyBaseJob();
    final _name =
        '${_baseJob.categories.contains(JobCategoryEntity.senior) ? 'Senior ' : _baseJob.categories.contains(JobCategoryEntity.junior) ? 'Junior ' : ''}Web Engineer';

    return _baseJob.copyWith(
      name: _name,
      description:
          'We are looking for a skilled web developer who will be responsible for developing and/or designing websites for our company. You will be working alongside a team of other developers in creating, maintaining, and updating our websites. \n\nIn order for you to succeed in this role, you will need to be proficient in JavaScript, HTML, CSS, and have solid knowledge and experience in programming applications.',
      responsibilities: [
        'Solid knowledge and experience in programming applications.',
        'Proficient in JavaScript, HTML, CSS.',
        'Proficient in My SQL.',
        'Website and software application designing, building, or maintaining.',
        'Knowledge of programming language and technical terminology.',
        'Able to develop ideas and processes and clearly express them.',
        'Using scripting or authoring languages, management tools, content creation tools, applications, and digital media.',
        'Conferring with teams to resolve conflicts, prioritize needs, develop content criteria, or choose solutions.',
        'Directing or performing Website updates.',
        'Developing or validating test routines and schedules to ensure that test cases mimic external interfaces and address all browser and device types.',
        'Editing, writing, or designing Website content, and directing team members who produce content.',
        'Maintaining an understanding of the latest Web applications and programming practices through education, study, and participation in conferences, workshops, and groups.',
      ],
    );
  }

  static JobEntity _dummyGraphicDesigner() {
    final _baseJob = _dummyBaseJob();
    final _name =
        '${_baseJob.categories.contains(JobCategoryEntity.senior) ? 'Senior ' : _baseJob.categories.contains(JobCategoryEntity.junior) ? 'Junior ' : ''}Graphic Designer';

    return _baseJob.copyWith(
      name: _name,
      description:
          'We are seeking a new graphic designer to join our team. You will be designing a wide variety of things across digital and offline media. To be successful in this position, you’ll be a self-starter, capable of delivering brilliant creative ideas, and show amazing attention to detail.',
      responsibilities: [
        'Experience as a graphic designer or in related field.',
        'Demonstrable graphic design skills with a strong portfolio.',
        'Proficiency with required desktop publishing tools, including Photoshop, InDesign Quark, and Illustrator.',
        'A strong eye for visual composition.',
        'Effective time management skills and the ability to meet deadlines.',
        'Able to give and receive constructive criticism.',
        'Understanding of marketing, production, website design, corporate identity, product packaging, advertisements, and multimedia design.',
        'Experience with computer-aided design.',
        'Planning concepts by studying relevant information and materials.',
        'Illustrating concepts by designing examples of art arrangement, size, type size and style and submitting them for approval.',
        'Preparing finished art by operating necessary equipment and software.',
        'Coordinating with outside agencies, art services, web designer, marketing, printers, and colleagues as necessary.',
        'Contributing to team efforts by accomplishing tasks as needed.',
        'Creating a wide range of graphics and layouts for product illustrations, company logos, and websites with software such as photoshop.',
        'Reviewing final layouts and suggesting improvements when necessary.',
      ],
    );
  }

  static JobEntity _dummyItSupportEngineer() {
    final _baseJob = _dummyBaseJob();
    final _name =
        '${_baseJob.categories.contains(JobCategoryEntity.senior) ? 'Senior ' : _baseJob.categories.contains(JobCategoryEntity.junior) ? 'Junior ' : ''}IT Support Engineer';

    return _baseJob.copyWith(
      name: _name,
      description:
          'We are looking to hire a skilled IT support engineer to assist our clients with all IT related technical support issues. As an IT support engineer, you will meet with clients to determine the nature of the problem, diagnose hardware or software issues, provide effective assistance, and maintain strong customer relationships. You may also be required to install new software applications and train clients on proper application use.\n\nTo ensure success as an IT support engineer, you should have in-depth knowledge of business software and hardware systems, excellent troubleshooting skills, and high-level interpersonal skills. Ultimately, a top-class IT support engineer resolves all IT issues quickly and effectively while maintaining a good relationship with the client.',
      responsibilities: [
        'Installing and configuring client computer systems.',
        'Responding to client IT support requests.',
        'Meeting with clients to diagnose software, networking, or hardware issues.',
        'Providing technical support on-site or via remote-access systems.',
        'Offering solutions that meet the needs of the client.',
        'Repairing hardware malfunctions, software issues, and networking problems.',
        'Maintaining good client relations.',
        'Tracking and managing work records.',
        'Compiling job reports.',
        'Proven work experience as a technical support engineer.',
        'Knowledge of web services, API, and IP-based protocols.',
        'Experience with scripting languages such as Perl or Shell.',
        'Knowledge of computer hardware and networking systems.',
        'Good time management skills.',
        'Good interpersonal skills.',
        'Ability to troubleshoot complex hardware and software issues.',
        'Excellent written and verbal communication skills.',
        'Ability to think critically.',
      ],
    );
  }

  static JobEntity _dummySystemAnalyst() {
    final _baseJob = _dummyBaseJob();
    final _name =
        '${_baseJob.categories.contains(JobCategoryEntity.senior) ? 'Senior ' : _baseJob.categories.contains(JobCategoryEntity.junior) ? 'Junior ' : ''}System Analyst';

    return _baseJob.copyWith(
      name: _name,
      description:
          "We are seeking a skilled systems analyst to improve our organization's IT systems. You will be responsible for analyzing our current systems to find any flaws or inefficiencies, and planning solutions to resolve all issues and ensure long-term effectiveness.\n\nTo be successful in this role, you should have an in-depth knowledge of available IT solutions, and an analytical mind capable of solving complex problems. Top systems analysts will also have strong communication skills, with an ability to explain solutions clearly.",
      responsibilities: [
        'Evaluating current IT systems, including hardware, software, and network features.',
        'Communicating with management and employees to determine system requirements.',
        'Planning new systems that address any issues with the current systems.',
        'Preparing cost-benefit analysis reports for all proposed upgrades.',
        'Collaborating with the IT team to implement your plan.',
        'Testing the new systems to validate that they are working as expected.',
        'Reporting back on all improvements made, as well as any setbacks.',
        'Creating training processes and documentation to teach others how to use new systems.',
        'Keeping up to date with the latest developments in information systems.',
        'Ensuring that all budget and timeline constraints are met.',
        'Degree in computer science, information systems, or relevant field.',
        'Prior experience as a systems analyst or in a similar position.',
        'Business-related qualifications a plus.',
        'Strong analytical and problem-solving skills.',
        'Excellent communication skills.',
        'Ability to work well in a team.',
      ],
    );
  }

  static JobEntity _dummyDataScientist() {
    final _baseJob = _dummyBaseJob();
    final _name =
        '${_baseJob.categories.contains(JobCategoryEntity.senior) ? 'Senior ' : _baseJob.categories.contains(JobCategoryEntity.junior) ? 'Junior ' : ''}Data Scientist';

    return _baseJob.copyWith(
      name: _name,
      description:
          "We are looking to hire a highly creative data scientist to address data analytics challenges in our organization, to collect large volumes of data from varying sources, clean and interpret data, create solutions to overcome challenges, and communicate with interested parties.\n\nTo succeed in this position; you need to be curious, creative, and tech-savvy. You need to stay up to date with data programming software and apps, have an outstanding understanding of statistics and mathematics and be proficient in writing algorithms. Top candidates will be persistent and have excellent analytical and problem-solving skills.",
      responsibilities: [
        'Having meetings with team members regarding projects.',
        'Collecting and interpreting data.',
        'Automating and integrating processes.',
        'Researching solutions to overcome data analytics challenges.',
        'Developing complex mathematical models that integrate business rules and requirements.',
        'Creating machine learning models.',
        'Communicating and meeting with engineers, IT teams, and other interested parties.',
        'Sharing complex ideas verbally and visually in an understandable manner with non-technical stakeholders.',
        'A MSc or PhD degree in applied mathematics or statistics.',
        'Advanced coursework in machine learning and programming.',
        'Experience using data visualization tools.',
        'Experience with data querying languages, and statistical or mathematical software.',
        'Proficient in writing algorithms, and knowing when to apply them.',
        'Excellent understanding of statistics, multivariable calculus, and linear algebra.',
        'Outstanding communication skills.',
      ],
    );
  }
}
