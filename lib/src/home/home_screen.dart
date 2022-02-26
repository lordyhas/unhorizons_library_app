part of home;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _transformAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _transformAnimation = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    //_controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EXPLORESS MENEJA",
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: _w / 35),
                Text(
                  'Here you can manage your exploress online business easily and quickly.',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              ItemCard(
                icon: FontAwesomeIcons.stackOverflow,
                color: Colors.red,
                title: 'Statistics',
                transformAnimation: _transformAnimation,
                opacityAnimation: _opacityAnimation,
              ),
              ItemCard(
                onTap: () {
                  /*RouteManager.goto(context,
                      page: const AddProductScreen(),
                      routeName: AddProductScreen.routeName);*/
                },
                icon: FontAwesomeIcons.ad,
                color: Colors.teal,
                title: 'Add',
                transformAnimation: _transformAnimation,
                opacityAnimation: _opacityAnimation,
              ),
              ItemCard(
                icon: FluentIcons.receipt_check,
                color: Colors.orange,
                title: 'check',
                transformAnimation: _transformAnimation,
                opacityAnimation: _opacityAnimation,
              ),
              ItemCard(
                icon: FontAwesomeIcons.addressCard,
                color: Colors.yellow,
                title: 'Delivery',
                transformAnimation: _transformAnimation,
                opacityAnimation: _opacityAnimation,
              ),
              ItemCard(
                onTap: () {

                },
                icon: FontAwesomeIcons.server,
                color: Colors.blue,
                title: 'message',
                transformAnimation: _transformAnimation,
                opacityAnimation: _opacityAnimation,
                badge: true,
                badgeValue: 2,
              ),
              ItemCard(
                onTap: () {

                },
                icon: FontAwesomeIcons.eyeSlash,
                color: Colors.purple,
                title: "Visibility",
                transformAnimation: _transformAnimation,
                opacityAnimation: _opacityAnimation,
                badge: true,
                badgeValue: 2,
              ),
            ],
          ),
          const SizedBox(height: 16.0,),
          BooleanBuilder(
            check: false,
            ifTrue: Opacity(
              opacity: _opacityAnimation.value,
            ),
            ifFalse: Container(),
          ),
          SizedBox(height: _w / 20),
        ],
      ),
    );
  }
}
