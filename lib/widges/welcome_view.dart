import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Kusoo dhawaaw ',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w200,
              ),
              children: [
                TextSpan(
                  text: '\nCimiloSheeg App ⛅⛅',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
