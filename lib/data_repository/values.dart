library values;
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

//export 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'values/strings.dart';
part 'values/styles.dart';
part 'values/dimens.dart';

class Styles extends Cubit<StyleAppTheme> {
  Styles({StyleAppTheme? style}) : super(style ?? StyleAppTheme.init());

  ThemeState get status => state.status;
  ThemeData get theme => state.theme;

  void changeTheme(ThemeState themeState){
    emit(StyleAppTheme.setter(themeState));
  }

  void toggleTheme(){
    if(status == ThemeState.orange) {
      emit(StyleAppTheme.setter(ThemeState.purple));
    }
    else {
      emit(StyleAppTheme.setter(ThemeState.orange));
    }
  }

}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}
