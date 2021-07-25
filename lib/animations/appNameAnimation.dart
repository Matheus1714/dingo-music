import 'package:flutter/material.dart';

class AppNameAnimation extends StatefulWidget {
  AppNameAnimation({Key key}) : super(key: key);
  @override
  _AppNameAnimationState createState() => _AppNameAnimationState();
}

class _AppNameAnimationState extends State<AppNameAnimation> {
  String _titleText = 'Dingo Music';
  bool _isFirstText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: GestureDetector(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              '$_titleText',
              key: ValueKey<String>(_titleText),
              style: TextStyle(fontSize: 60),
            ),
          ),
          onTap: () {
            if (_isFirstText) {
              setState(() {
                _titleText = "Dingo App";
                _isFirstText = false;
              });
            } else {
              setState(() {
                _titleText = "Dingo Music";
                _isFirstText = true;
              });
            }
          },
        ),
      ),
    );
  }
}
