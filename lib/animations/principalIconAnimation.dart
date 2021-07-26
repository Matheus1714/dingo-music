import 'package:flutter/material.dart';
import '../colorsDefault.dart';

class PrincipalIconAnimation extends StatefulWidget {
  PrincipalIconAnimation({Key key}) : super(key: key);
  @override
  _PrincipalIconAnimationState createState() => _PrincipalIconAnimationState();
}

class _PrincipalIconAnimationState extends State<PrincipalIconAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.9, end: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _tween.animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
      child: Container(
        decoration: BoxDecoration(
          color: DefaultColors.secondaryVioletColor,
          // borderRadius: BorderRadius.all(Radius.circular(100)),
          shape: BoxShape.circle,
        ),
        height: 200,
        width: 200,
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/principal_icon.png',
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
