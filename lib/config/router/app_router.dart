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
      path: GenderScreen.uri,
      name: GenderScreen.name,
      builder: (context, state) => const GenderScreen(),
    ),
    GoRoute(
      path: AgeScreen.uri,
      name: AgeScreen.name,
      builder: (context, state) => const AgeScreen(),
    ),
    GoRoute(
      path: CountryUniversitiesScreen.uri,
      name: CountryUniversitiesScreen.name,
      builder: (context, state) => const CountryUniversitiesScreen(),
    ),
    GoRoute(
      path: WeatherScreen.uri,
      name: WeatherScreen.name,
      builder: (context, state) => const WeatherScreen(),
    ),
    GoRoute(
      path: PokemonScreen.uri,
      name: PokemonScreen.name,
      builder: (context, state) => const PokemonScreen(),
    ),
    GoRoute(
      path: WordPressScreen.uri,
      name: WordPressScreen.name,
      builder: (context, state) => const WordPressScreen(),
    ),
    GoRoute(
      path: AboutMeScreen.uri,
      name: AboutMeScreen.name,
      builder: (context, state) => const AboutMeScreen(),
    ),
    
  ],
);