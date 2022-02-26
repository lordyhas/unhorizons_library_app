part of home;
class ItemCard extends StatelessWidget {
  final bool badge;
  final int? badgeValue;
  final Color color;
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final Animation<double> opacityAnimation;
  final Animation<double> transformAnimation;
  const ItemCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.opacityAnimation,
    required this.transformAnimation,
    this.badgeValue,
    this.onTap,
    this.badge = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: opacityAnimation.value,
      child: Transform.translate(
        offset: Offset(0, transformAnimation.value),
        child: Container(
          //highlightColor: Colors.transparent,
          //splashColor: Colors.transparent,
          //onTap: onTap,

          child: Container(
            padding: const EdgeInsets.all(15),
            height: 200,
            width: 170,
            decoration: BoxDecoration(
              ///color: Theme.of(context).cardColor.withOpacity(.8), //Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Container(
                  height: kIsWeb? 100 : _w/8,
                  width: kIsWeb? 100 : _w/8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.3),
                    shape: BoxShape.circle,
                  ),
                  child: BooleanBuilder(
                    check: badge,
                    ifTrue: Badge(
                      //toAnimate: false,
                      //position: BadgePosition.topEnd(end: -5, top: -2),
                      shape: BadgeShape.circle,
                      badgeColor: Colors.red,
                      badgeContent: badgeValue!=null ?  Text('$badgeValue',
                        style: const TextStyle(color: Colors.white),
                      ): null,
                      child: Icon(
                        icon,
                        size: (_w/ 16) > 70 ? 70 : (_w/ 16),
                        color: color.withOpacity(.6),
                      ),
                    ),
                    ifFalse:  Icon(
                      icon,
                      size: (_w/ 16) > 70 ? 70 : (_w/ 16),
                      color: color.withOpacity(.6),
                    ),
                  ),
                  /**/
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(.9),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}