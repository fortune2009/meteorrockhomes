import 'dart:ui';
import 'package:meteorrockhome/shared/utils/all_packages.dart';

///design height(responsiveness)
double? logicalHeight() {
  final largestPhysicalSize = PlatformDispatcher.instance.views
      .map((v) => v.physicalSize)
      .reduce((curr, next) =>
          curr.width * curr.height > next.width * next.height ? curr : next);

  final devicePixelRatio =
      PlatformDispatcher.instance.views.map((v) => v.devicePixelRatio).first;
  return largestPhysicalSize.height / devicePixelRatio;
}

///design width(responsiveness)
double? logicalWidth() {
  final largestPhysicalSize = PlatformDispatcher.instance.views
      .map((v) => v.physicalSize)
      .reduce((curr, next) =>
          curr.width * curr.height > next.width * next.height ? curr : next);

  final devicePixelRatio =
      PlatformDispatcher.instance.views.map((v) => v.devicePixelRatio).first;
  return largestPhysicalSize.width / devicePixelRatio;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
