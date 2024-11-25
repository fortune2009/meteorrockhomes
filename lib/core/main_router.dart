import '../shared/utils/all_packages.dart';
import 'bottom_nav.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutePaths.splash:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNav());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
