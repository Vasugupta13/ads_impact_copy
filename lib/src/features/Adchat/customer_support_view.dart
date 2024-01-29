import 'package:ads/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'customer_support_widget.dart';

class CustomerSupportView extends StatefulWidget {
  const CustomerSupportView({Key? key}) : super(key: key);
  static const routePath = '/customerSupport';

  @override
  State<CustomerSupportView> createState() => _CustomerSupportViewState();
}

class _CustomerSupportViewState extends State<CustomerSupportView> {
  final List<ChatMessage> msg = [];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  late IO.Socket socket;

  dynamic supportData = {};

  @override
  void initState() {
    super.initState();
    initializeSocket();
  }

  void initializeSocket() {
    socket = IO.io('http://192.168.29.102:3000/chat', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.connect();

    socket.onConnect((_) {
      debugPrint('connect');
      debugPrint(socket.id);
      // Listening to an event from the server
      socket.on("support:response", (data) {
        debugPrint('$data');
        supportData["executiveSocketId"] = data["executiveSocketId"];

        _addMessage(data["message"], false);
      });

      socket.on("chat:closed", (data) {
        debugPrint('$data');
        supportData["executiveSocketId"] = data["executiveSocketId"];

        _addMessage(data["message"], false);
      });
    });
  }

  void _addMessage(String message, sendByMe) {
    supportData["userSocketId"] = socket.id;
    if (msg.isEmpty) {
      socket.emit("support:request", supportData);
    } else if (sendByMe) {
      supportData["message"] = message;
      socket.emit("support:executive_msg", supportData);
    }
    setState(() {
      msg.add(ChatMessage(
        text: message,
        time: DateTime.now(),
        sendByMe: sendByMe,
      ));
    });
    _textEditingController.clear();
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kblack.withOpacity(0.6))),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: msg.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return CustomerMessageWidget(message: msg[index]);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kblack,
                  ),
                  cursorColor: kblack,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    filled: true,
                    fillColor: Colors.white, // Adjust the color
                    labelText: 'Type your message',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kblack,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_textEditingController.text.isNotEmpty) {
                          _addMessage(_textEditingController.text, true);
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: kblack,
                      ),
                      splashRadius: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
