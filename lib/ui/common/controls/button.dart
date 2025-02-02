import 'package:cashito_app/styles/app_colors.dart';
import 'package:cashito_app/ui/common/themed_text.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    Key? key,
    required this.label,
    required this.width,
    required this.height,
    required this.onTap,
    this.fontSize,
    this.fractionScaleHeight,
    this.fractionScaleWidth,
  }) : super(key: key);

  final String label;
  final double width;
  final double height;
  final double? fontSize;
  final double? fractionScaleHeight;
  final double? fractionScaleWidth;
  final VoidCallback onTap;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  bool isTapped = false;

  void _shrink() {
    setState(() {
      isTapped = true;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Scaffold(
        body: Center(
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).colorScheme.accentColor.withValues(alpha: 0.8),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              onHighlightChanged: (value) {
                setState(() {
                  isTapped = value;
                });
              },
              onTap: () {
                _shrink();
                widget.onTap();
              },
              child: AnimatedContainer(
               duration: Duration(milliseconds: 200),
               curve: Curves.easeOutCubic,
               height: isTapped
                  ? widget.height * (widget.fractionScaleHeight ?? 0.93)
                  : widget.height,
               width: isTapped
                  ? widget.width * (widget.fractionScaleWidth ?? 0.93)
                  : widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.accentColor.withValues(alpha: 0.5),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFont(
                    text: widget.label,
                    fontSize: widget.fontSize ?? 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
