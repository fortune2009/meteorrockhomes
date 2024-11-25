// ignore_for_file: constant_identifier_names

const String IMAGEPATH = "assets/images";
const String SVGPATH = "assets/svg";
const String LOTTIEPATH = "assets/lottie";
const String GIFPATH = "assets/gif";

class ImageAssets {
  static const String profile = "$IMAGEPATH/profile.png";
  static const List<String> gridPictures = [
    "$IMAGEPATH/bedroom.png",
    "$IMAGEPATH/living-room.png",
    "$IMAGEPATH/floor.png",
    "$IMAGEPATH/window.png"
  ];
}

class SvgAssets {
  /// bottom nav
  static const navigationSvgs = [
    "$SVGPATH/search-fill.svg",
    "$SVGPATH/message.svg",
    "$SVGPATH/home-fill.svg",
    "$SVGPATH/heart-fill.svg",
    "$SVGPATH/user-fill.svg"
  ];

  /// Home
  static const String location = "$SVGPATH/location.svg";
  static const String forward = "$SVGPATH/forward-arrow.svg";
  static const String search = "$SVGPATH/search.svg";

  /// Search
  static const List<String> optionIcons = [
    "$SVGPATH/layer.svg",
    "$SVGPATH/price.svg",
    "$SVGPATH/infrastructure.svg",
    "$SVGPATH/cosy.svg",
  ];
  static const String stack = "$SVGPATH/layer.svg";
  static const String filter = "$SVGPATH/filter.svg";
  static const String send = "$SVGPATH/send.svg";
  static const String list = "$SVGPATH/list.svg";
}

class LottieAssets {
  // static const String success = "$LOTTIEPATH/success.json";
}

class GifAssets {
  // static const String box = "$GIFPATH/box.gif";
}
