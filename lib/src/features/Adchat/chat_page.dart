import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/common_widget/custom_app_bar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_svg/svg.dart';

class AdChat extends StatefulWidget {
  const AdChat({super.key, Key});

  @override
  State<AdChat> createState() => _AdChatState();
}

class _AdChatState extends State<AdChat> {
  final List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "id",
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 42),
        child: Column(
          children: [
            const CustomAppBar(
              name: "AdChat",
              imagepath: "assets/images/chat.svg",
            ),
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: kblack.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: SvgPicture.asset(
                      "assets/images/chat_bot.svg",
                      fit: BoxFit.contain,
                      height: 240,
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    child: Chat(
                      scrollPhysics: const BouncingScrollPhysics(),
                      messages: _messages,
                      onSendPressed: _handleSendPressed,
                      user: _user,
                      theme: DefaultChatTheme(
                        inputBackgroundColor: kblack.withOpacity(0.2),
                        inputPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        inputBorderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
