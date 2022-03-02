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
    final randomLevel = Random().nextInt(2);

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
    _dummyGameEngineer,
  ];

  static JobEntity _dummyMobileEngineer() => _dummyBaseJob().copyWith(
        name: 'Mobile Engineer',
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

  static JobEntity _dummyWebEngineer() => _dummyBaseJob().copyWith(
        name: 'Web Engineer',
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

  static JobEntity _dummyGraphicDesigner() => _dummyBaseJob().copyWith(
        name: 'Graphic Designer',
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

  static JobEntity _dummyGameEngineer() => _dummyBaseJob().copyWith(
        name: 'Game Engineer',
        description:
            'We are currently looking for a Unity Gameplay Programmer to join The Walking Dead Empires. The ideal candidate must have experience in commercial game development with expertise for pioneering game play systems. Must have a creative and hands-on attitude amplified by an entrepreneurial spirit for technical excellence. This is a fantastic opportunity to change the play-to earn blockchain gaming space on our TWDE team with your hands-on skills and energy.',
        responsibilities: [
          'Work with other programmers and design to implement various aspects of the game, from AI to UI and anything in between.',
          'Translate requirements into complicated but clean and efficient code.',
          'Produce prototypes of gameplay ideas and features.',
          'Develop schedules and determine milestones.',
          'Be involved in the process of creating technical design and technical architecture of the game and single features.',
          'Detection, identification and resolution and document technical specifications.',
          'Propose sensible code refactoring and reduce technical debt.',
          '“Polish” the game, maintain code, fix bugs and iron out any problems.',
          'Hands-on experience with Unity and C# and other programming languages.',
          'Expertise in the development of new games with 1 or more shipped titles.',
          'Up-to-date with the latest gaming trends, techniques, best practices and technologies.',
          'Expert level programming skills.',
          'US pacific time zone required (margins of flexibility within 3-4 hours).',
          'Positive and articulate communication and interpersonal skills both spoken and written.',
          'Brilliant imagination complimented by reliability and execution.',
          'Self-motivated, stellar work ethic, fun collaborator.',
          'Excited by problem-solving.',
        ],
      );
}
