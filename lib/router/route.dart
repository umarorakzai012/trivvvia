import 'package:go_router/go_router.dart';
import 'package:trivvvia/screens/home.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
