
import 'dart:ui';



import 'package:fluent_ui/fluent_ui.dart' as win;
import 'package:flutter/material.dart';

import 'res.dart';

class OnGeneratePage extends StatelessWidget {
  const OnGeneratePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const OnGeneratePage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child:  Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 72),
            child: const SizedBox(
              height: 200,
              child: FlutterLogo() /*Image.asset(Res.app_icon,
                //color: Theme.of(context).primaryColor.withOpacity(0.85),
              ),*/
            ),
          ),
          //Text("XXXXXX", style: TextStyle(color: Colors.black, fontSize: 42),),
          Expanded(
            child: Column(
              children: [
                const Spacer(),
                Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )
                ),
                const Spacer(),
                const SizedBox(height: 2.0,),
                const Spacer(),
                const SizedBox(height: 2.0,),
                const Spacer(),
              ],
            ),
          ),
        ],
      )
    );
  }
}

/* Image.asset(
            'assets/img/exploress_icon.png',
            key: const Key('splash_icon_image'),
            width: 150,
        ),
      ) */
