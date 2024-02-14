import 'package:flutter/material.dart';

class Moveable extends StatefulWidget {
  final Widget wig;
  Moveable({
    Key? key,
    required this.wig,
  }) : super(key: key);

  @override
  State<Moveable> createState() => _MoveableState();
}

class _MoveableState extends State<Moveable> {
  Offset offsetN = Offset.zero;
  List<ContainerList> list = [];
  Offset? _initPos;
  Offset _currentPos = Offset(0, 0);
  double? _currentScale;
  double? _currentRotation;
  Size? screen;
  @override
  void initState() {
    screen = Size(360, 400);
    list.add(ContainerList(
      width: 360,
      height: 420,
      rotation: 0.0,
      scale: 1.0,
      xPosition: 0.1,
      yPosition: 0.1,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: list.map((value) {
        return GestureDetector(
          onScaleStart: (details) {
            // ignore: unnecessary_null_comparison
            if (value == null) return;
            _initPos = details.focalPoint;
            _currentPos = Offset(value.xPosition, value.yPosition);
            _currentScale = value.scale;
            _currentRotation = value.rotation;
          },
          onScaleUpdate: (details) {
            // ignore: unnecessary_null_comparison
            if (value == null) return;
            final delta = details.focalPoint - _initPos!;
            final left = (delta.dx / screen!.width) + _currentPos.dx;
            final top = (delta.dy / screen!.height) + _currentPos.dy;

            value.xPosition = Offset(left, top).dx;
            value.yPosition = Offset(left, top).dy;
            value.rotation = details.rotation + _currentRotation!;
            value.scale = details.scale * _currentScale!;
            setState(() {});
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                left: value.xPosition * screen!.width,
                top: value.yPosition * screen!.height,
                child: Transform.scale(
                  scale: value.scale,
                  child: Transform.rotate(
                      angle: value.rotation,
                      child: Container(
                        width: 360,
                        height: 420,
                        child: Listener(
                          onPointerDown: (details) {
                            _initPos = details.position;
                            _currentPos =
                                Offset(value.xPosition, value.yPosition);
                            _currentScale = value.scale;
                            _currentRotation = value.rotation;
                          },
                          onPointerUp: (details) {},
                          child: widget.wig,
                        ),
                      )),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ContainerList {
  double height;
  double width;
  double scale;
  double rotation;
  double xPosition;
  double yPosition;

  ContainerList({
    required this.height,
    required this.rotation,
    required this.scale,
    required this.width,
    required this.xPosition,
    required this.yPosition,
  });
}
