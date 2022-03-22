import 'package:fless_alert/utils/sizeconf.dart';
import 'package:fless_alert/utils/status.dart';
import 'package:flutter/material.dart';

class FlessAlert extends StatefulWidget {
  FlessAlert({
    Key? key,
    required this.status,
    this.width = double.infinity,
    this.height,
    this.backgroundColor,
    this.iconPadding,
    this.statusIcon,
    this.statusIconBgcolor,
    this.statusIconcolor,
    this.actionIcon,
    this.actionIconcolor,
    this.shape,
    required this.title,
    this.titleColor,
    required this.description,
    this.descriptionColor,
    this.bottomBtnBgcolor,
    required this.bottomBtnText,
    this.bottomBtnTextColor,
    this.onActionIconPressed,
    this.onBottomBtnPressed,
  }) : super(key: key);

  final StatusState status;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? iconPadding;
  late final IconData? statusIcon;
  late final Color? statusIconBgcolor;
  late final Color? statusIconcolor;
  late final IconData? actionIcon;
  final Color? actionIconcolor;
  final void Function()? onActionIconPressed;
  final ShapeBorder? shape;
  final String title;
  late final Color? titleColor;
  final String description;
  final Color? descriptionColor;
  final bool showBottonBtn = true;
  late final Color? bottomBtnBgcolor;
  final String bottomBtnText;
  final Color? bottomBtnTextColor;
  final void Function()? onBottomBtnPressed;

  @override
  _FlessAlertState createState() => _FlessAlertState();
}

class _FlessAlertState extends State<FlessAlert> {
  _statusColorManager(StatusState status) {
    if (status == StatusState.success) {
      widget.statusIconBgcolor = widget.statusIconBgcolor ?? Colors.green[200];
      widget.statusIcon = widget.statusIcon ?? Icons.check;
      widget.statusIconcolor = widget.statusIconcolor ?? Colors.green[900];
      widget.actionIcon = widget.actionIcon ?? Icons.close_sharp;
      widget.titleColor = widget.titleColor ?? Colors.green[700];
      widget.bottomBtnBgcolor = widget.bottomBtnBgcolor ?? Color(0xFF009a26);
    } else {
      widget.statusIconBgcolor = widget.statusIconBgcolor ?? Colors.red[200];
      widget.statusIcon = widget.statusIcon ?? Icons.close_sharp;
      widget.statusIconcolor = widget.statusIconcolor ?? Colors.red[900];
      widget.actionIcon = widget.actionIcon ?? Icons.close_sharp;
      widget.titleColor = widget.titleColor ?? Colors.red[700];
      widget.bottomBtnBgcolor = widget.bottomBtnBgcolor ?? Colors.red[700];
    }
  }

  @override
  void initState() {
    _statusColorManager(widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final iconpadd = widget.iconPadding ?? getProportionateScreenWidth(40);
    return Dialog(
      shape: widget.shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        decoration: BoxDecoration(color: widget.backgroundColor),
        height: widget.height ?? getProportionateScreenHeight(210),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(
                            iconpadd - getProportionateScreenWidth(10)),
                        height: getProportionateScreenWidth(
                            iconpadd - getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                            color: widget.statusIconBgcolor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Icon(
                          widget.statusIcon,
                          color: widget.statusIconBgcolor,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: widget.titleColor),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: widget.onActionIconPressed ??
                        () {
                          Navigator.pop(context);
                        },
                    child: Icon(
                      widget.actionIcon,
                      color: widget.actionIconcolor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(iconpadd),
                right: getProportionateScreenWidth(20),
              ),
              child: Text(
                widget.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, color: widget.descriptionColor),
              ),
            ),
            if (widget.showBottonBtn)
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(iconpadd),
                  right: getProportionateScreenWidth(10),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenHeight(7)),
                  decoration: BoxDecoration(
                      color: widget.bottomBtnBgcolor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: InkWell(
                      onTap: widget.onBottomBtnPressed ??
                          () {
                            Navigator.pop(context);
                          },
                      child: Text(
                        widget.bottomBtnText,
                        style: TextStyle(
                            color: widget.bottomBtnTextColor ?? Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
