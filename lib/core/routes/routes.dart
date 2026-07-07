import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ety/features/intro/onboarding/onboarding_screen.dart';
import 'package:se7ety/features/intro/splash/splash_screen.dart';
import 'package:se7ety/features/intro/welcome/welcome_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String doctorRegistration = '/doctorRegistration';
  static const String mainPatient = '/mainPatient';
  static const String specializationSearch = '/specializationSearch';
  static const String homeSearch = '/homeSearch';
  static const String doctorProfile = '/doctorProfile';
  static const String bookingScreen = '/bookingScreen';
  static const String settings = '/settings';

  static final routes = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      // GoRoute(
      //   path: login,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => AuthCubit(),
      //     child: LoginScreen(userType: state.extra as UserTypeEnum),
      //   ),
      // ),
      // GoRoute(
      //   path: register,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => AuthCubit(),
      //     child: RegisterScreen(userType: state.extra as UserTypeEnum),
      //   ),
      // ),
      // GoRoute(
      //   path: doctorRegistration,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => UpdateDoctorProfileCubit(),
      //     child: UpdateDoctorProfileScreen(),
      //   ),
      // ),
    ],
  );
}
