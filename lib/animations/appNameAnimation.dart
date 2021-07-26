import 'package:flutter/material.dart';

class AppNameAnimation extends StatefulWidget {
  AppNameAnimation({Key key}) : super(key: key);
  @override
  _AppNameAnimationState createState() => _AppNameAnimationState();
}

class _AppNameAnimationState extends State<AppNameAnimation> {
  String _firstText = 'Dingo Music';
  String _secondText = 'App Music';
  bool _isFirstText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _isFirstText ? _firstText : _secondText,
                style: TextStyle(fontSize: 60),
              ),
            ),
            onTap: () {
              setState(() {
                _isFirstText = !_isFirstText;
              });
            }),
      ),
    );
  }
}
