import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  final double padding;
  ContactButton({
    Key key,
    this.title,
    this.icon,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextButton.icon(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: padding),
              backgroundColor: Colors.grey.withOpacity(.6)),
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          label: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }
}
