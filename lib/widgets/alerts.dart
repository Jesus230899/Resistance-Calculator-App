import 'package:flutter/material.dart';

showCustomDialog(BuildContext context, String title, Widget body) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            contentPadding: const EdgeInsets.all(0),
            content: body,
          ));
}
