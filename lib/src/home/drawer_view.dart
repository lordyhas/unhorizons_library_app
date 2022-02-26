// IMAGE LINK : https://unsplash.com/photos/bOBM8CB4ZC4

part of home;


class DrawerView extends StatelessWidget {
  final Animation<double> blurAnimation;
  final Animation<double> opacityAnimation;
  final Animation<double> scaleAnimation;
  final void Function() onClose;
  final bool isClose;

  const DrawerView({
    required this.blurAnimation,
    required this.opacityAnimation,
    required this.scaleAnimation,
    required this.isClose,
    required this.onClose,
    Key? key,

  }) : super(key: key);

  void _openProfile(){

  }

  @override
  Widget build(BuildContext context) {
    //var text = AppLocalizations.of(context)!;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: blurAnimation.value+0.001,
          sigmaX: blurAnimation.value+0.001
      ),
      child: SizedBox(
        height: isClose ? 0 : _height,
        width: isClose ? 0 : _width,
       // color:  .of(context).primaryColor.withOpacity(0.2),
        //Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: Container(
              constraints: kBoxConstraintsMedium.copyWith(maxHeight: 570),
              width: _width * .9,
              height: _width * 1.3,
              decoration: BoxDecoration(
                //color: Theme.of(context).primaryColor.withOpacity(opacityAnimation.value),
                //Colors.grey.shade700.withOpacity(animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Container(
                            //onTap: _openProfile,
                            child: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: kIsWeb ? 75 : 42,
                              backgroundImage: AssetImage(Res.userImage1),

                            ),
                          ),
                          const SizedBox(height: 8.0,),
                          RichText(
                            text: TextSpan(text:"Shop Name",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _openProfile
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconTile(FluentIcons.settings,
                              title: 'Settings',
                              onTap: () {
                                /*RouteManager.goto(
                                    context,
                                    page: const SettingPage(),
                                    routeName : SettingPage.routeName
                                );*/

                              }),
                          IconTile(FluentIcons.info,
                              title: 'A propos',
                              onTap: () {
                                /*RouteManager.goto(
                                    context,
                                    page : const AboutPage(),
                                    routeName :AboutPage.routeName
                                );*/

                              }),
                          IconTile(FluentIcons.feedback,
                              title: 'feedback',
                              onTap:() {
                                //HapticFeedback.lightImpact();

                              }),
                          IconTile(FluentIcons.search_issue,
                              title: 'Privacy Policy',
                              onTap:() {
                                //HapticFeedback.lightImpact();

                              }),
                        ],
                      ),
                      const SizedBox(),
                    ],
                  ),
                  BooleanBuilder(
                    check: !isClose,
                    ifTrue: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(FluentIcons.chrome_close) ,
                          onPressed:  onClose,
                        ),
                      ),
                    ),
                    ifFalse: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class IconTile extends StatelessWidget {
  final IconData icon;
  final String? title;
  final VoidCallback? onTap;

  const IconTile(this.icon,{
    this.title,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          //onTap: onTap,
          title: Text(
            title ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: const Icon(
            FluentIcons.chevron_right_med,
            color: Colors.white,
          ),
        ),
        const SizedBox()
      ],
    );
  }
}

