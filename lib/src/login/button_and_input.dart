part of 'login_page.dart';

class ButtonLogin extends StatelessWidget {
  final String text;
  const ButtonLogin({this.text = 'LOGIN', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            if(state.status.isValidated){
              context.read<LoginCubit>().logInWithCredentials();
            }
          },
          child: Container(
            height: 40,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: state.status.isValidated?
              Theme.of(context).colorScheme.secondary
              :Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: state.status.isSubmissionInProgress
            ? SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
            : Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        );
      },
    );
  }
}


class _GoogleLoginButton extends StatelessWidget {
  final String text;
  const _GoogleLoginButton({this.text = "Sign in with Google"});
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width *0.75;
    final theme = Theme.of(context);

    Widget googleOutlineButton = OutlineButton(
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
      //BlocProvider.of<LoginCubit>(context).logInWithGoogle(),
      //style: ButtonStyle(),
      color: theme.colorScheme.primary,
      textColor: theme.colorScheme.primary,
      highlightedBorderColor: theme.colorScheme.primaryVariant,
      highlightColor: theme.colorScheme.primaryVariant.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
      ),
      child:  Container(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(FontAwesomeIcons.google),
            const Spacer(),
            Text(text ),
            const Spacer(),
            const Icon(FontAwesomeIcons.google, color: Colors.transparent,),

          ],
        ),
      ),

    );

    return Container(
        //width: width,
        child: googleOutlineButton);
  }
}

class _FacebookLoginButton extends StatelessWidget {
  final String text;
  const _FacebookLoginButton({this.text= "Sign in with Facebook"});
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width *0.75;
    final theme = Theme.of(context);


    Widget facebookOutlineButton = OutlineButton(
        key: const Key('loginForm_facebookLogin_outlineButton'),
        //style: ButtonStyle(),
        color: theme.colorScheme.primary,
        textColor: theme.colorScheme.primary,
        highlightedBorderColor: theme.colorScheme.primaryVariant,
        highlightColor: theme.colorScheme.primaryVariant.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
        ),
        //icon: Icon(FontAwesomeIcons.facebookF),
        //label: Text("Sign in with Facebook"),
        child: Container(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(FontAwesomeIcons.facebookF),
              const Spacer(),
              Text(text),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.facebookF,
                color: Colors.transparent,
              ),

            ],
          ),
        ),
        onPressed: () {} //=> context.bloc<LoginCubit>().logInWithFacebook(),
    );

    return Container(
        //width: width,
        child: facebookOutlineButton);
  }
}


class _InputField extends StatelessWidget {
  final IconData icon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final void Function(String)? onChanged;
  final String? errorText;
  const _InputField({
    required this.icon,
    this.hintText = '',
    this.isPassword = false,
    this.isEmail = false,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: 48,
            //width: size.width / 1.22,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.05),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          TextField(
            key: key,
            style: TextStyle(color: Colors.black.withOpacity(.8)),
            obscureText: isPassword,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(icon,
                color: Colors.black.withOpacity(.7),
              ),
              suffixIcon:suffixIcon,
              border: InputBorder.none,
              //hintMaxLines: 1,
              hintText: hintText,
              errorText: errorText,
              helperText: '',
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.5)
              ),
            ),
          ),
        ],
      ),
    );
  }

}