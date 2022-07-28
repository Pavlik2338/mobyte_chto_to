import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: Divider(
              height: 5,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'or',
              style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1)),
            ),
          ),
          const Expanded(
            child: Divider(
              height: 5,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          )
        ],
      ),
    );
  }
}
