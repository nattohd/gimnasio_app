import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final allColors = Theme.of(context);
    final textStyle = Theme.of(context).textTheme;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: size.height * 0.295,
              width: size.width,
              color: allColors.primaryColorDark.withOpacity(.5),
            ),
          ),
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: size.height * 0.28,
              width: size.width,
              color: allColors.primaryColorDark,
            ),
          ),
          //*********Header *********/
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.85,
                height: size.height * 0.15,
                // color: Colors.green,
                child: Column(
                  children: [
                    Text(
                      'Gimnasio USM JMC',
                      style: textStyle.headlineLarge,
                    ),
                    Text(
                      'Ingreso de sesión.',
                      style: textStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
