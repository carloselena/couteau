import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      //TODO: name: HomeScreen.name
      //builder: (context, state) => const HomeScreen(),
    ),
    //TODO: all other routes
  ],
);