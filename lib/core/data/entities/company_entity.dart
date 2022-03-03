import 'package:equatable/equatable.dart';

import '../../constant/constant.dart';

class CompanyEntity extends Equatable {
  final String name;
  final String location;
  final String logo;

  const CompanyEntity({
    required this.name,
    required this.location,
    required this.logo,
  });

  @override
  List<Object> get props => [name, location, logo];

  CompanyEntity copyWith({
    String? name,
    String? address,
    String? logo,
  }) {
    return CompanyEntity(
      name: name ?? this.name,
      location: address ?? this.location,
      logo: logo ?? this.logo,
    );
  }

  static const dummyCompanies = [
    dummyAirbnb,
    dummyHewlettPackard,
    dummyTrello,
    dummyIbm,
    dummyTripadvisor,
    dummyDiscord,
    dummyIntel,
    dummyPayPal,
    dummyTwitch,
    dummyEaSports,
    dummyITunes,
    dummyTwitter,
    dummyFacebook,
    dummyLinkedIn,
    dummyReddit,
    dummyUber,
    dummyWeChat,
    dummyFirefox,
    dummyMailchimp,
    dummySlack,
    dummyWhatsApp,
    dummyGitLab,
    dummySoundCloud,
    dummySpotify,
    dummyGojek,
    dummyYouTube,
    dummyHeroku,
    dummyTelegram,
  ];

  static const dummyAirbnb = CompanyEntity(
    name: 'Airbnb',
    location: 'California, United States',
    logo: UrlImages.imgCompanyAirbnb,
  );
  static const dummyHewlettPackard = CompanyEntity(
    name: 'Hewlett Packard',
    location: 'California, United States',
    logo: UrlImages.imgCompanyHp,
  );
  static const dummyTrello = CompanyEntity(
    name: 'Trello',
    location: 'New York, United States',
    logo: UrlImages.imgCompanyTrello,
  );
  static const dummyIbm = CompanyEntity(
    name: 'IBM',
    location: 'New York, United States',
    logo: UrlImages.imgCompanyIbm,
  );
  static const dummyTripadvisor = CompanyEntity(
    name: 'Tripadvisor',
    location: 'Massachusetts, United States',
    logo: UrlImages.imgCompanyTripadvisor,
  );

  static const dummyDiscord = CompanyEntity(
    name: 'Discord',
    location: 'San Francisco, United States',
    logo: UrlImages.imgCompanyDiscord,
  );
  static const dummyIntel = CompanyEntity(
    name: 'Intel',
    location: 'California, United States',
    logo: UrlImages.imgCompanyIntel,
  );
  static const dummyPayPal = CompanyEntity(
    name: 'PayPal',
    location: 'California, United States',
    logo: UrlImages.imgCompanyPayPal,
  );
  static const dummyTwitch = CompanyEntity(
    name: 'Twitch',
    location: 'Washington, United States',
    logo: UrlImages.imgCompanyTwitch,
  );
  static const dummyEaSports = CompanyEntity(
    name: 'EA Sports',
    location: 'California, United States',
    logo: UrlImages.imgCompanyEa,
  );

  static const dummyITunes = CompanyEntity(
    name: 'iTunes',
    location: 'California, United States',
    logo: UrlImages.imgCompanyItunes,
  );
  static const dummyTwitter = CompanyEntity(
    name: 'Twitter',
    location: 'California, United States',
    logo: UrlImages.imgCompanyTwitter,
  );
  static const dummyFacebook = CompanyEntity(
    name: 'Facebook',
    location: 'San Francisco, United States',
    logo: UrlImages.imgCompanyFacebook,
  );
  static const dummyLinkedIn = CompanyEntity(
    name: 'LinkedIn',
    location: 'California, United States',
    logo: UrlImages.imgCompanyLinkedin,
  );
  static const dummyReddit = CompanyEntity(
    name: 'Reddit',
    location: 'California, United States',
    logo: UrlImages.imgCompanyReddit,
  );

  static const dummyUber = CompanyEntity(
    name: 'Uber Technologies Inc',
    location: 'California, United States',
    logo: UrlImages.imgCompanyUber,
  );
  static const dummyWeChat = CompanyEntity(
    name: 'WeChat',
    location: 'New York, United States',
    logo: UrlImages.imgCompanyWechat,
  );
  static const dummyFirefox = CompanyEntity(
    name: 'Firefox',
    location: 'Washington, United States',
    logo: UrlImages.imgCompanyFirefox,
  );
  static const dummyMailchimp = CompanyEntity(
    name: 'Mailchimp',
    location: 'Georgia, United States',
    logo: UrlImages.imgCompanyMailchimp,
  );
  static const dummySlack = CompanyEntity(
    name: 'Slack Technologies',
    location: 'Texas, United States',
    logo: UrlImages.imgCompanySlack,
  );

  static const dummyWhatsApp = CompanyEntity(
    name: 'WhatsApp',
    location: 'California, United States',
    logo: UrlImages.imgCompanyWhatsapp,
  );
  static const dummyGitLab = CompanyEntity(
    name: 'GitLab',
    location: 'Arizona, United States',
    logo: UrlImages.imgCompanyGitlab,
  );
  static const dummySoundCloud = CompanyEntity(
    name: 'SoundCloud',
    location: 'Berlin, Germany',
    logo: UrlImages.imgCompanySoundcloud,
  );
  static const dummyMicrosoft = CompanyEntity(
    name: 'Microsoft Corporation',
    location: 'Washington, United States',
    logo: UrlImages.imgCompanyMicrosoft,
  );
  static const dummySpotify = CompanyEntity(
    name: 'Spotify',
    location: 'Stockholm, Sweden',
    logo: UrlImages.imgCompanySpotify,
  );

  static const dummyGojek = CompanyEntity(
    name: 'Gojek',
    location: 'Jakarta, Indonesia',
    logo: UrlImages.imgCompanyGojek,
  );
  static const dummySteam = CompanyEntity(
    name: 'Steam',
    location: 'California, United States',
    logo: UrlImages.imgCompanySteam,
  );
  static const dummyYouTube = CompanyEntity(
    name: 'YouTube',
    location: 'California, United States',
    logo: UrlImages.imgCompanyYoutube,
  );
  static const dummyHeroku = CompanyEntity(
    name: 'Heroku',
    location: 'California, United States',
    logo: UrlImages.imgCompanyHeroku,
  );
  static const dummyTelegram = CompanyEntity(
    name: 'Telegram',
    location: ' Dubai, UAE',
    logo: UrlImages.imgCompanyTelegram,
  );
}
