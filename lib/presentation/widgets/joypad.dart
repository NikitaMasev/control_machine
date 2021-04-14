import 'dart:math';

import 'package:flutter/material.dart';

class JoyPad extends StatefulWidget {
  final void Function(Offset) onChange;
  final double size;
  final double sizeInnerCircle;

  const JoyPad({
    Key? key,
    required this.onChange,
    required this.size,
    this.sizeInnerCircle = 60,
  }) : super(key: key);

  @override
  _JoyPadState createState() => _JoyPadState();
}

class _JoyPadState extends State<JoyPad> {
  Offset delta = Offset.zero;

  void updateDelta(Offset newDelta) {
    widget.onChange(newDelta);
    setState(() {
      delta = newDelta;
    });
  }

  ///Calculate new position of inner circle by new offset.
  ///Function min used to limit new position inner circle,
  ///when edge of inner circle touch inner boundary of outer circle.
  void calculateDelta(Offset offset) {
    Offset newDelta = offset -
        Offset(
          widget.sizeInnerCircle,
          widget.sizeInnerCircle,
        );
    updateDelta(
      Offset.fromDirection(
        newDelta.direction,
        min<double>(
          widget.size / 2 - widget.sizeInnerCircle / 2,
          newDelta.distance,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Transform.translate(
                offset: delta,
                child: SizedBox(
                  height: widget.sizeInnerCircle,
                  width: widget.sizeInnerCircle,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          onPanDown: onDragDown,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
        ),
      ),
    );
  }

  void onDragDown(DragDownDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }
}
