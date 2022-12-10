import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:islam_made_easy/settings/settings.dart';
import 'package:islam_made_easy/utils/device_info.dart';
import 'package:islam_made_easy/views/about.dart' as about;

class NavigationRailHeader extends StatelessWidget {
  const NavigationRailHeader({required this.extended});

  final ValueNotifier<bool?> extended;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final animation = NavigationRail.extendedAnimation(context);
    Locale locale = Localizations.localeOf(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    InkWell(
                      key: const ValueKey(''),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: animation.value * math.pi,
                            child: const FaIcon(Icons.arrow_left, size: 16),
                          ),
                          Image.asset('assets/images/logo.png', width: 32),
                          const SizedBox(width: 10),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            widthFactor: animation.value,
                            child: Opacity(
                              opacity: animation.value,
                              child: Text(
                                'IME',
                                style: textTheme.bodyText1!
                                    .copyWith(fontFamily: 'Quicksand'),
                              ),
                            ),
                          ),
                          SizedBox(width: 18 * animation.value),
                        ],
                      ),
                      hoverColor: Get.theme.primaryColor.withOpacity(.1),
                      onTap: () => extended.value = !extended.value!,
                    ),
                    if (animation.value > 0)
                      Opacity(
                        opacity: animation.value,
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.cog,
                                color: Theme.of(context).primaryColor,
                              ),
                              splashRadius: 15,
                              hoverColor:
                                  Get.theme.primaryColor.withOpacity(.1),
                              onPressed: () {
                                Get.dialog(
                                    Align(
                                      alignment: locale.languageCode == 'ar'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Container(
                                        height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                          color:
                                              Color(0xFFFAFAFC).withOpacity(.1),
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5)),
                                        ),
                                        child: Settings(),
                                      ),
                                    ),
                                    transitionDuration:
                                        DelayUI(Duration(milliseconds: 1000))
                                            .duration,
                                    transitionCurve: Curves.easeInOutSine,
                                    name: 'Preferences');
                              },
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.info,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () => about.showAboutDialog(),
                              splashRadius: 15,
                              hoverColor:
                                  Get.theme.primaryColor.withOpacity(.1),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
