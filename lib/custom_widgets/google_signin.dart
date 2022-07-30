import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function()? onPresed;
  GoogleSignInButton({this.onPresed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: onPresed,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.1),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
              // shape: BoxShape.circle,
            ),
            height: 53,
            width: 328,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/Group.png"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Text('Sign in with Google'),
                )
              ],
            )),
      ),
    );
  }
}
// Center(child: 