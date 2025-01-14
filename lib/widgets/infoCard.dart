import 'package:islam_made_easy/views/QnA/qna.dart';

class InfoCard extends StatefulWidget {
  final List<Widget>? answers;
  final String? quest;

  const InfoCard({Key? key, this.quest, this.answers}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  static DelayUI shareDelay = DelayUI(Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    return WidgetAnimator(
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.elliptical(90, 10),
            bottomRight: Radius.elliptical(10, 90),
          ),
        ),
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shadowColor: Colors.grey,
        child: ExpansionTile(
          trailing: DeviceOS.isDesktopOrWeb
              ? IconButton(
                  icon: FaIcon(
                    Icons.copy,
                    color: Colors.greenAccent.withOpacity(.4),
                  ),
                  splashRadius: 10,
                  tooltip: MaterialLocalizations.of(context).copyButtonLabel,
                  onPressed: () =>
                      Clipboard.setData(ClipboardData(text: widget.quest)).then(
                    (value) => Get.snackbar(
                      S.current.copiedToClipboardTitle,
                      S.current.copiedToClipboard,
                    ),
                  ),
                )
              : IconButton(
                  icon: FaIcon(FontAwesomeIcons.shareAlt, size: 20),
                  splashRadius: 10,
                  onPressed: () => shareDelay.run(
                    () => Share.share(
                        "Get Quizzes, Questions and more from: ${ShareUtil().getPlatformShare()}",
                        subject: '𝗤. ${widget.quest}'),
                  ),
                ),
          expandedAlignment: Alignment.topCenter,
          tilePadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          childrenPadding: EdgeInsets.symmetric(
            vertical: isDesktop || context.isTablet ? 20 : 10,
            horizontal: isDesktop || context.isTablet ? 30 : 10,
          ),
          title: Text(
            "𝗤. ${widget.quest}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              letterSpacing: .1,
              fontWeight: FontWeight.w700,
            ),
          ),
          children: widget.answers!,
        ),
      ),
    );
  }
}
