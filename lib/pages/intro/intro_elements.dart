import 'package:flutter/material.dart';
import 'package:web_portfolio/utils/constants.dart';

class IntroElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16.0,
          ),
          child: Text(
            """Ciao, mi presento il mio nome è Alberto Ferroni e sono uno sviluppatore software.
             Ho 25 anni e da circa 7-8 anni mi diverto a scrivere codice.
              Le mie competenze principali rigurdano lo sviluppo App e il Machine Learning.
              Sono due mondi molto distanti tra """,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              color: kCaptionColor,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
