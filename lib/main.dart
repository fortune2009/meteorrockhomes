import 'package:meteorrockhome/shared/utils/all_packages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RouteObserverProvider(
    child: const MyApp(
      appKey: ValueKey<String>('root'),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({this.appKey}) : super(key: appKey);
  final ValueKey<String>? appKey;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(logicalWidth() == 0 ? 360.0 : logicalWidth()!,
          logicalHeight() == 0 ? 772.0 : logicalHeight()!),
      // designSize: ScreenUtil.defaultSize,
      builder: (context, Widget? child) => MultiProvider(
        // builder: () => MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          // useInheritedMediaQuery: true,
          title: 'Meteor Rock Home',
          debugShowCheckedModeBanner: false,
          // home: const LoginScreen(),
          onGenerateRoute: MainRouter.generateRoute,
          theme: ThemeData(
            fontFamily: 'EuclidCircularA',
            // splashFactory: InkRipple.splashFactory, // Default ripple behavior
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
