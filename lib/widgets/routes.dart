import 'package:flutter/material.dart';

import '../Legal/Term and Condtion.dart';
import '../Legal/legalNotice.dart';
import '../Legal/privacyPolicy.dart';
import '../views/about.dart';
import '../views/faq.dart';
import '../views/home.dart';
import '../views/newDgnesin.dart';
import '../views/product order/productSize.dart';


class Routes {
  static const String home = '/HomeView';
  static const String howItWorks = '/how-it-works';
  static const String pricing = '/pricing';
  static const String technology = '/technology';
  static const String about = '/about';
  static const String faq = '/faq';
  static const String labwearOS = '/labwearOS';
  static const String legalNotice = '/LegalNoticePage';
  static const String privacyPolicy = '/PrivacyPolicy';
  static const String termsConditions = '/terms-conditions';
  static const String productGuide = '/product-guide';
  static const String userManual = '/user-manual';
  static const String labwearOsBrochure = '/ClothingGridPage';
  static const String support = '/support';
  static const String sales = '/sales';
  static const String generalInquiries = '/general-inquiries';
  static const String socialMedia = '/social-media';

  // Add dynamic route generation based on clothing text
  static String generateRouteName(String clothingType) {
    return '/$clothingType'; // Example: /T-Shirt, /Hoodie
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case howItWorks:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case about:
        return MaterialPageRoute(builder: (_) => TeamPage());
      case faq:
        return MaterialPageRoute(builder: (_) => FAQPage());
      case labwearOS:
        return MaterialPageRoute(builder: (_) => Design());
      case legalNotice:
        return MaterialPageRoute(builder: (_) => const LegalNoticePage());
      case privacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyPolicy());
      case termsConditions:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsPage());
      case '/T-Shirt':
        return MaterialPageRoute(builder: (_) => TShirtPage());
      // case '/Hoodie':
      //   return MaterialPageRoute(builder: (_) => HoodiePage());
      // case '/Crewneck':
      //   return MaterialPageRoute(builder: (_) => CrewneckPage());
      // case '/Zip-Hoodie':
      //   return MaterialPageRoute(builder: (_) => ZipHoodiePage());
      // case '/Long Sleeve':
      //   return MaterialPageRoute(builder: (_) => LongSleevePage());
      // case '/Tank Top':
      //   return MaterialPageRoute(builder: (_) => TankTopPage());
      // case '/Sweatpants I':
      //   return MaterialPageRoute(builder: (_) => SweatpantsIPage());
      // case '/Sweatpants II':
      //   return MaterialPageRoute(builder: (_) => SweatpantsIIPage());
      // case '/Shorts':
      //   return MaterialPageRoute(builder: (_) => ShortsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
