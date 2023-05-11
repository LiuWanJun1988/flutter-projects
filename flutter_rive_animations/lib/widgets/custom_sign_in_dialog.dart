import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/widgets/sign_in_form.dart';

Future<Object?> customSignInDialog(BuildContext context, {required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Sign in',
      context: context,
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut
            ),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) =>
          Center(
            child: Container(
              height: 620,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 24
              ),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.94),
                  borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 34,
                              fontFamily: 'Poppins'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Access to 240+ hours of content.'
                              ' Learn design and code, '
                              'by building real apps with '
                              'Flutter and Swift.',
                            textAlign: TextAlign.center,),
                        ),
                        SignInForm(),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0
                              ),
                              child: Text(
                                'OR',
                                style: TextStyle(color: Colors.black26),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            'Sign up with Email, Apple or Google',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/email_box.svg',
                                height: 64,
                                width: 64,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/apple_box.svg',
                                height: 64,
                                width: 64,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/google_box.svg',
                                height: 64,
                                width: 64,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -48,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
  );
}