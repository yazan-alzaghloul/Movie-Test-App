import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderApp extends StatefulWidget {
  final Color color;
  final double size;

  const LoaderApp({Key? key, this.color = Colors.black, this.size = 60})
      : super(key: key);

  @override
  State<LoaderApp> createState() => _LoaderAppState();
}

class _LoaderAppState extends State<LoaderApp> with TickerProviderStateMixin {
  late AnimationController animatedContainer;

  @override
  void initState() {
    animatedContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }

  @override
  void dispose() {
    animatedContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
        ),
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: SpinKitFadingCircle(
                color: widget.color,
                size: widget.size,
                controller: animatedContainer)));
  }
}
