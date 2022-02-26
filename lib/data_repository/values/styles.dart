
part of values;

enum ThemeState{orange, purple, cyan}

class StyleAppTheme {
  @protected
  ThemeState _themeState;

  StyleAppTheme._({required final ThemeState themeState }) :_themeState = themeState;
  StyleAppTheme.init() : this._(themeState: ThemeState.purple);
  StyleAppTheme.setter(ThemeState status) : this._(themeState: status);

  ThemeState get status => _themeState;




  ThemeData get theme {
    switch(status) {
      case ThemeState.orange:
        return _orangeTheme;
      case ThemeState.purple:
        return _purpleTheme;
      case ThemeState.cyan:
        return _specialTheme;
      default:
        return _purpleTheme;
    }
  }

  @protected
  static final _appBarTheme = AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    centerTitle: true,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18
    ),
    backgroundColor: Colors.deepPurple.withOpacity(0.4),
  );

  static final ColorScheme _colorScheme = ColorScheme.fromSwatch().copyWith(
    primary: Colors.cyan,
    primaryVariant: Colors.cyanAccent,
    secondary: Colors.teal,
    secondaryVariant: Colors.tealAccent,
    error: Colors.red,
  );


  static final ThemeData _purpleTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurpleAccent,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: _colorScheme,
    brightness: Brightness.dark,
    appBarTheme: _appBarTheme.copyWith(
      backgroundColor: Colors.deepPurple.withOpacity(0.4),
    ),

    //textTheme: const TextTheme(),
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,


  );

  final ThemeData _orangeTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.deepOrange.shade800,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: _colorScheme,
    brightness: Brightness.dark,
    appBarTheme: _appBarTheme.copyWith(
      backgroundColor: Colors.deepOrange.shade700.withOpacity(0.4),
    ),
    //textTheme: const TextTheme(),
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,

  );


  final ThemeData _specialTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.teal,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.cyanAccent),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.cyan,
    ),
    textTheme: const TextTheme(),
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
  );



}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}


