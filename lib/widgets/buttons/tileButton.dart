import 'package:flutter/material.dart';
import 'package:islam_made_easy/layout/adaptive.dart';

import '../anim/anim.dart';

class SettingsLinkButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsLinkButton({
    Key key,
    @required this.title,
    this.subtitle,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = isDisplayDesktop(context);
    return WidgetAnimator(GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.asset(
              title,
              fit: BoxFit.fitHeight,
              width: size.width,
              matchTextDirection: true,
              height: size.height,
            ),
            Container(
              color: Colors.black26,
              child: Center(
                child: isDesktop
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: isDesktop ? 30 : 22,
                                color: colorScheme.surface,
                                fontFamily: 'Amiri',
                                fontWeight: FontWeight.w500),
                          ),
                          // SizedBox(height: 4),
                          Text(
                            '',
                            style: TextStyle(
                                fontSize: 13,
                                color: colorScheme.surface,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    : ListView(
                        padding: EdgeInsets.only(top: 30),
                        children: [
                          Text(
                            subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: isDesktop ? 30 : 22,
                                color: colorScheme.surface,
                                fontFamily: 'Amiri',
                                fontWeight: FontWeight.w500),
                          ),
                          // SizedBox(height: 4),
                          Text(
                            '',
                            style: TextStyle(
                                fontSize: 13,
                                color: colorScheme.surface,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
              ),
            ),
            Positioned(
              child: Container(
                height: 290.0,
                width: 190.0,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.rectangle),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SettingsTitle extends StatelessWidget {
  final String title;

  const SettingsTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(6, 8, 6, 8), child: Text(title));
  }
}
