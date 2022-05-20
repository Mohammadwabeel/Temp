import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/constants.dart';

class GlassBar extends StatelessWidget with PreferredSizeWidget {
  const GlassBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
            title: const Text(
              "REST",
              style: TextStyle(color: primary, letterSpacing: 1.5),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark
                .copyWith(statusBarColor: Colors.transparent),
            elevation: 0,
            backgroundColor: Colors.white.withOpacity(.8)
            // const Color.fromARGB(255, 19, 107, 131).withOpacity(.8),
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
