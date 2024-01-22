import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/homepage/customapp_bar.dart';
import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class AdChatScreen extends StatefulWidget {
  const AdChatScreen({super.key});

  @override
  State<AdChatScreen> createState() => _AdChatScreenState();
}

class _AdChatScreenState extends State<AdChatScreen> {
  final TextEditingController controller = TextEditingController();
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[
    {
      'message':
          "Hey, I’m your Adchat Assistant. May I Know how may I help you!",
      'isLocal': false
    },
    {'message': "Hello", 'isLocal': true},
    {'message': "Can you please explain your problem?", 'isLocal': false},
    {'message': "Yes Sure!", 'isLocal': true},
  ].obs;
  late io.Socket socket;
  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    // Replace "http://your_server_address" with your actual server address
    // socket = io.io("wss://echo.websocket.org", <String, dynamic>{
    //   'transports': ['websocket'],
    //   'autoConnect': false,
    // });
    socket = io.io('http://localhost:3000', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((data) {
      print("Socket connected successfully $data");
    });

    socket.on('message', (data) {
      messages.add({'message': data['message'], 'isLocal': false});
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      isLoading.value = false;
    });
  }

  void _sendMessage() {
    if (controller.text.isNotEmpty) {
      socket.emit('message', {'message': controller.text});
      messages.add({'message': controller.text, 'isLocal': true});
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Column(
                    children: [
                      CustomAppBar(
                          onTapBack: () {
                            Navigator.pop(context);
                          },
                          imagepath: "assets/images/chat_icon.svg",
                          name: "Adchat"),
                      Expanded(
                        child: Container(
                          height: Get.height,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: kblack.withOpacity(0.1),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30,
                                left: 0,
                                right: 0,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: SvgPicture.asset(
                                      "assets/images/chat_bot.svg",
                                      height: Get.height * 0.3),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  reverse: true,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: messages.length,
                                  itemBuilder: (context, index) {
                                    final reversedIndex =
                                        messages.length - 1 - index;
                                    final message = messages[reversedIndex];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment: !message['isLocal']
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(
                                                                10)),
                                                border: Border.all(
                                                    color:
                                                        kred.withOpacity(0.2)),
                                                color: !message['isLocal']
                                                    ? kwhite
                                                    : kwhite),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  !message['isLocal']
                                                      ? CrossAxisAlignment.end
                                                      : CrossAxisAlignment
                                                          .start,
                                              children: [
                                                Text(
                                                  message['message'],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: !message['isLocal']
                                                          ? kblack
                                                          : kblack),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      height10,
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                            )),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/chat_person_icon.svg"),
                            kwidth15,
                            Expanded(
                              child: CustomTextField(
                                hintText: "I need some help r..........",
                                controller: controller,
                                onChanged: (p0) {},
                              ),
                            ),
                            kwidth15,
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  "assets/images/chat_image_icon.svg"),
                            ),
                            kwidth15,
                            GestureDetector(
                              onTap: _sendMessage,
                              child: SvgPicture.asset(
                                  "assets/images/chat_send_icon.svg"),
                            ),
                            kwidth15
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.onDisconnect((data) {
      print("Socket disconnected successfully");
    });
    super.dispose();
  }
}
