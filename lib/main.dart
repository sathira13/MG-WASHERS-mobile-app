import 'package:car_wash/firebase_options.dart';
import 'package:car_wash/models/service.dart';
import 'package:car_wash/screens/home_screen.dart';
import 'package:car_wash/screens/make_booking.dart';
import 'package:car_wash/screens/sign_in_screen.dart';
import 'package:car_wash/screens/sign_up_screen.dart';
import 'package:car_wash/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/make-booking',
      builder: (BuildContext context, GoRouterState state) {
        final Service data = state.extra as Service;
        return MakeBookingScreen(
          data: data,
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Lato",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffd8a656)),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
