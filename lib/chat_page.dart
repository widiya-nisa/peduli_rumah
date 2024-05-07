import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.doctorName});
  final String doctorName;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatMessage> chatData = [
    ChatMessage(
      message: "Hi, how are you?",
      time: DateTime.now(),
      isDoctor: true,
      status: MessageStatus.sent,
    ),
    ChatMessage(
      message: "I'm fine, thank you",
      time: DateTime.now(),
      isDoctor: false,
      status: MessageStatus.received,
    ),
  ];

  final TextEditingController chatMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.doctorName),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: chatData[index].isDoctor
                                ? Color(0xFF075E54)
                                : Color(0xFF26292E),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chatData[index].message,
                                style: TextStyle(
                                  color: chatData[index].isDoctor
                                      ? Colors.white
                                      : Colors.white70,
                                ),
                              ),
                              Text(
                                DateFormat.Hm().format(chatData[index].time),
                                style: TextStyle(
                                  color: chatData[index].isDoctor
                                      ? Colors.white70
                                      : Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF26292E),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatMessageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type message',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      chatData.insert(
                        0,
                        ChatMessage(
                          message: chatMessageController.text,
                          time: DateTime.now(),
                          isDoctor: false,
                          status: MessageStatus.sending,
                        ),
                      );
                      chatMessageController.clear();
                    });
                  },
                  child: Icon(Icons.send, color: Colors.white),
                  backgroundColor: Color(0xFF25D366),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MessageStatus { sent, received, sending, failed }

  class ChatMessage {
    final String message;
    final DateTime time;
    final bool isDoctor;
    final MessageStatus status;

    const ChatMessage({
      required this.message,
      required this.time,
      required this.isDoctor,
      required this.status,
    });
  }