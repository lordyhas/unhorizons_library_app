import 'package:exploress_repository/exploress_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unh_biblio/data_repository/bloc_controller.dart';
import 'package:unh_biblio/data_repository/values.dart';
import 'package:unh_biblio/routes.dart';
import 'package:unh_biblio/src/background_image.dart';
import 'package:unh_biblio/src/home_page.dart';
//import 'package:unh_biblio/src/settings/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
//import 'package:get/get.dart';
//import 'package:utils_component/utils_component.dart';

part 'login_form.dart';

part 'button_and_input.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool createAccount = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => LoginCubit(
        context.read<AuthenticationRepository>(),
      ),
      child: BackgroundUI(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SizedBox(
              child: Container(
                height: size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.3),
                      Theme.of(context).primaryColor.withOpacity(0.5),
                      Theme.of(context).primaryColor.withOpacity(0.7),
                      Theme.of(context).primaryColor.withOpacity(0.9),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: !kIsWeb? null : const NeverScrollableScrollPhysics(),
                  child: BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state.status.isSubmissionFailure) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Authentication Failure'),
                            ),
                          );
                      }
                    },
                    child: Opacity(
                      opacity: _opacity.value,
                      child: Transform.scale(
                        scale: _transform.value,
                        child: Container(
                          constraints: kLoginBoxConstraints,
                          width: size.width * .9,
                          height:kIsWeb ? size.height * 0.8 : 620,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 90,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0).copyWith(),
                                    child: Image.asset(
                                      'assets/icons/exploress_icon.png',
                                      color: Theme.of(context).primaryColor.withOpacity(0.85),
                                      height: 120,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(),
                                      const Spacer(),
                                      Text(
                                        'Welcome to Exploress Manager',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor.withOpacity(.7),
                                        ),
                                      ),
                                      const Spacer(),

                                      const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(),
                                  const _EmailInput(
                                    key: Key('loginForm_emailInput'),
                                  ),
                                  const _PasswordInput(
                                    key: Key('loginForm_passwordInput'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const ButtonLogin(text: 'LOGIN',),
                                      SizedBox(width: size.width / 25),
                                      Container(
                                        //width: 150,
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Forgotten password!',
                                            style: const TextStyle(
                                                color: Colors.blueAccent),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Log.out(
                                                  'WARNING','Forgotten password! button pressed',
                                                );
                                              },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  //const SizedBox(),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 32.0
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        _GoogleLoginButton(),
                                         SizedBox(height: 8.0,),
                                        _FacebookLoginButton(),
                                      ],
                                    ),
                                  ),
                                 // const SizedBox(),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Sign in to continue',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .primaryColor.withOpacity(.8),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: IconButton(
                                      onPressed: !kIsWeb ? (){
                                        // RouteManager.goto(
                                        //     context,
                                        //     page : const SettingPage(),
                                        //     routeName:  SettingPage.routeName
                                        // );
                                      } : null,
                                      icon: Icon(CupertinoIcons.gear_solid,
                                        color:  !kIsWeb
                                            ? Colors.black.withOpacity(0.7)
                                            : Colors.transparent,
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}



