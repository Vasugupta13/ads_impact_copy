import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(top: 34),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 10,
                            left: 0,
                            height: 44,
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff212121),
                              ),
                              child: const Icon(
                                CupertinoIcons.text_bubble,
                                color: kwhite,
                                size: 22,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 24,
                            left: 24,
                            right: 24,
                            child: Container(
                              height: 70,
                              width: 230,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xff1A377D).withOpacity(0.10),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Text(
                                  "AdChat",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: kblack),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                        "assets/images/chat.svg",
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
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
