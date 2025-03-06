import 'package:couteau/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/genre',
      name: GenreScreen.name,
      builder: (context, state) => const GenreScreen(),
    ),
    GoRoute(
      path: '/age',
      name: AgeScreen.name,
      builder: (context, state) => const AgeScreen(),
    ),
    GoRoute(
      path: '/country_universities',
      name: CountryUniversitiesScreen.name,
      builder: (context, state) => const CountryUniversitiesScreen(),
    ),
    GoRoute(
      path: '/weather',
      name: WeatherScreen.name,
      builder: (context, state) => const WeatherScreen(),
    ),
    GoRoute(
      path: '/pokemon',
      name: PokemonScreen.name,
      builder: (context, state) => const PokemonScreen(),
    ),
    GoRoute(
      path: '/wordpress',
      name: WordPressScreen.name,
      builder: (context, state) => const WordPressScreen(),
    ),
    GoRoute(
      path: '/about_me',
      name: AboutMeScreen.name,
      builder: (context, state) => const AboutMeScreen(),
    ),
    
  ],
);