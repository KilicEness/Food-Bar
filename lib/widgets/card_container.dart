import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardContainer extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  Color? color;
  Color? borderColor;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double borderRadius;
  CardContainer(
      {Key? key,
      this.child,
      this.width,
      this.height,
      this.color,
      this.margin,
      this.padding,
      this.borderColor,
      this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.1),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: const Offset(0, 3), // changes position of shadow
          //   ),
          // ],
          border: borderColor != null
              ? Border.all(color: borderColor ?? Colors.black)
              : null,
          color: color ?? Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: child,
    );
  }
}
