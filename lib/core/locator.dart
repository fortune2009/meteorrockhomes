import '../shared/utils/all_packages.dart';
import 'bottom_nav_model.dart';

BuildContext? locatorContext;

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
  // ChangeNotifierProvider(create: (_) => HomeViewModel()),
];
