import 'package:driver_app/src/views/screens/legal_terms.dart';
import 'package:driver_app/src/views/screens/earnings_screen.dart';
import 'package:flutter/material.dart';

import 'src/models/screen_argument.dart';
import 'src/views/screens/auth/driver_status.dart';
import 'src/views/screens/auth/forgot_password_screen.dart';
import 'src/views/screens/auth/login_screen.dart';
import 'src/views/screens/auth/sign_up_screen.dart';
import 'src/views/screens/chat.dart';
import 'src/views/screens/home_screen.dart';
import 'src/views/screens/profile_screen.dart';
import 'src/views/screens/settings_screen.dart';
import 'src/views/screens/ride.dart';
import 'src/views/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    ScreenArgument? argument;
    if (settings.arguments != null) {
      argument = settings.arguments as ScreenArgument;
    }
    switch (settings.name) {
      case '/Home':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            saveLocation: argument?.arguments['saveLocation'] ?? false,
          ),
        );
      case '/Profile':
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case '/Settings':
        return MaterialPageRoute(
          builder: (context) => SettingScreen(),
        );
      case '/Splash':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case '/Login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/Earnings':
        return MaterialPageRoute(
          builder: (context) => const EarningsScreen(),
        );
      case '/Signup':
        return MaterialPageRoute(
          builder: (context) =>
              SignupScreen(edit: argument?.arguments['edit'] ?? false),
        );
      case '/DriverStatus':
        return MaterialPageRoute(
          builder: (context) => DriverStatusScreen(
            argument!.arguments['status'],
            observation: argument.arguments['observation'],
          ),
        );
      case '/ForgotPassword':
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case '/Ride':
        return MaterialPageRoute(
          builder: (context) => RideScreen(
            rideId: argument!.arguments['rideId'] ?? '',
            showButtons: argument.arguments['showButtons'] ?? true,
          ),
        );
      case '/Chat':
        return MaterialPageRoute(
          builder: (context) => ChatScreen(argument!.arguments['rideId'] ?? ''),
        );
      case '/Termos':
        return MaterialPageRoute(
          builder: (context) => LegalTermsWidget(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: SafeArea(
              child: Text('Route Error'),
            ),
          ),
        );
    }
  }
}
