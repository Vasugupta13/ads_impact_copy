import 'package:ads/src/features/bottombar/bottomnavigationbar.dart';
import 'package:ads/src/features/bottombar/view/custom_textfield.dart';
import 'package:ads/src/common/views/customapp_bar.dart';
import 'package:ads/src/res/assets.dart';
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
  static const routerPath = '/AdChatScreen';

  final TextEditingController controller = TextEditingController();
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[
    {
      'message':
          "Hey, I’m your Adchat Assistant. May I Know how may I\nhelp you!",
      'isLocal': false
    },
    {'message': "I need some help related to the application", 'isLocal': true},
    {'message': "Can you please explain your problem?", 'isLocal': false},
    {'message': "Yes Sure!", 'isLocal': true},
  ].obs;
  late io.Socket socket;
  // RxBool isLoading = true.obs;

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
    // Future.delayed(const Duration(milliseconds: 1500), () {
    //   isLoading.value = false;
    // });
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppBar(name: "Adchat", imagepath: IconAssets.message),
              Expanded(
                child: Container(
                  height: screenHeight,
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
                          child: SvgPicture.asset(ImageAssets.adchatbot,
                              height: Get.height * 0.3),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            reverse: true,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final reversedIndex = messages.length - 1 - index;
                              final message = messages[reversedIndex];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 16, right: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: !message['isLocal']
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment: !message['isLocal']
                                            ? CrossAxisAlignment.start
                                            : CrossAxisAlignment.start,
                                        mainAxisAlignment: !message['isLocal']
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                        children: [
                                          !message['isLocal']
                                              ? SvgPicture.asset(
                                                  IconAssets.message,
                                                  color: kblack)
                                              : const SizedBox(),
                                          kwidth5,
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: !message['isLocal']
                                                        ? const Radius.circular(
                                                            0)
                                                        : const Radius.circular(
                                                            12),
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            10),
                                                    bottomRight:
                                                        const Radius.circular(
                                                            10),
                                                    topRight: !message['isLocal']
                                                        ? const Radius.circular(
                                                            10)
                                                        : const Radius.circular(
                                                            0)),
                                                border: Border.all(
                                                    color: !message['isLocal']
                                                        ? kred.withOpacity(0.2)
                                                        : const Color(0xff00A3FF)
                                                            .withOpacity(0.2)),
                                                color: !message['isLocal'] ? kwhite : kwhite),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  !message['isLocal']
                                                      ? CrossAxisAlignment.end
                                                      : CrossAxisAlignment
                                                          .start,
                                              children: [
                                                Text(
                                                  message['message'],
                                                  maxLines: 10,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontAssets.Poppins,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
                                                      color: !message['isLocal']
                                                          ? kblack
                                                          : kblack),
                                                ),
                                              ],
                                            ),
                                          ),
                                          kwidth5,
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: !message['isLocal']
                                                ? const SizedBox()
                                                : SvgPicture.asset(
                                                    IconAssets.adchatperson,
                                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: kwhite,
                  border: Border.all(
                    color: kblack.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(IconAssets.adchatperson),
                    kwidth15,
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xffE5E5E5),
                                fontFamily: FontAssets.Poppins,
                                fontWeight: FontWeight.w500),
                            hintText: "I need some help r.........."),
                      ),
                    ),
                    kwidth5,
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(IconAssets.gallery)),
                    kwidth15,
                    GestureDetector(
                        onTap: _sendMessage,
                        child: SvgPicture.asset(IconAssets.send)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
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
