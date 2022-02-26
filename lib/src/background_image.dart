
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../data_repository/values.dart';
import '../res.dart';

class BackgroundCover extends StatelessWidget {
  const BackgroundCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        (kIsWeb)? Res.bg_image_web1 : Res.bg_image1,
        fit: BoxFit.cover,
      ),
    );
  }
}


class BackgroundUI extends StatelessWidget {
  final Widget child;
  const BackgroundUI({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          BackgroundCover(key: key,),
          Container(
              child: child
          )
        ],
      ),
    );
  }
}

class LayoutContainer extends StatelessWidget {
  final BoxConstraints? constraints;
  final Widget child;
  const LayoutContainer({
    required this.child,
    Key? key, this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: constraints ?? kBoxConstraintsXL,
        child: child,
      ),
    );
  }
}


