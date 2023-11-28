import 'package:flutter/material.dart';

class CustomerMessageWidget extends StatelessWidget {
  final ChatMessage message;

  const CustomerMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return ListTile(
      title: Row(
        mainAxisAlignment:
            message.sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message.sendByMe
                      ? Container()
                      : Container(
                          height: height * 0.03,
                          width: height * 0.03,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/basicpack.png"))),
                        ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.5),
                    constraints: BoxConstraints(
                      maxWidth: width * 0.65,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: message.sendByMe ? Colors.green : Colors.grey,
                    ),
                    child: Text(message.text,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.004,
              ),
              Text(
                  '${message.time.hour}:${message.time.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final DateTime time;
  final bool sendByMe;

  ChatMessage({required this.text, required this.time, required this.sendByMe});
}
