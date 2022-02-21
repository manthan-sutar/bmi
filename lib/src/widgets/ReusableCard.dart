import 'package:flutter/material.dart';
import 'package:todo_app/src/Constants.dart';

class ReusableCard extends StatefulWidget {
  final Widget? child;
  final Color? color;
  Function()? onTap;
  ReusableCard({Key? key, this.child, this.color, this.onTap}) : super(key: key);
  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Material(
            color: widget.color ?? unselectedCardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
