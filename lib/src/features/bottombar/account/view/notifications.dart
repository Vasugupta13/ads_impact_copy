import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountNotificatons extends StatefulWidget {
  const AccountNotificatons({super.key});

  @override
  State<AccountNotificatons> createState() => _AccountNotificatonsState();
}

class _AccountNotificatonsState extends State<AccountNotificatons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(fontSize: 18, color: kblack),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(color: kblack.withOpacity(0.2), endIndent: 0, indent: 26),
            const NotificationtList(
                imagepath: "assets/images/noti_general.svg",
                title: "General Notifications"),
            const NotificationtList(
                imagepath: "assets/images/noti_sound.svg", title: "Sound"),
            const NotificationtList(
                imagepath: "assets/images/noti_vibrate.svg", title: "Vibrate"),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class NotificationtList extends StatefulWidget {
  final String imagepath;
  final String title;

  const NotificationtList({
    Key? key,
    required this.imagepath,
    required this.title,
  }) : super(key: key);

  @override
  State<NotificationtList> createState() => _NotificationtListState();
}

class _NotificationtListState extends State<NotificationtList> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            minVerticalPadding: 0,
            horizontalTitleGap: 4,
            leading: SvgPicture.asset(widget.imagepath),
            title: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            trailing: Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                trackColor: kblack.withOpacity(0.6),
                activeColor: const Color(0xff67DA87),
                value: status,
                onChanged: (value) {
                  setState(() {
                    status = value;
                  });
                },
              ),
            ),
          ),
        ),
        divider16,
      ],
    );
  }
}
