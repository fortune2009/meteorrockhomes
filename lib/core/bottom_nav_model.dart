import 'package:meteorrockhome/modules/favourite/favorite.dart';
import 'package:meteorrockhome/modules/home/home.dart';
import 'package:meteorrockhome/modules/message/messages.dart';
import 'package:meteorrockhome/modules/profile/profile.dart';
import 'package:meteorrockhome/modules/search/search.dart';

import '../shared/utils/all_packages.dart';

class BottomNavModel extends ChangeNotifier {
  int _currentIndex = 2;
  int get currentIndex => _currentIndex;

  final List<Widget> _children = [
    const SearchEstate(),
    const MessagePage(),
    const Home(),
    const FavoritePage(),
    const Profile(),
  ];

  List<Widget> get children => _children;

  updateIndex(int index, context) {
    _currentIndex = index;
    HapticFeedback.mediumImpact();
    notifyListeners();
  }
}
