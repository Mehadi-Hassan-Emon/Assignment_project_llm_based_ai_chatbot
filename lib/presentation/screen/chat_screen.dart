import 'package:flutter/material.dart';
import 'package:llm_chat_app/core/constans/app_colors.dart';
import 'package:llm_chat_app/core/constans/app_strings.dart';
import 'package:llm_chat_app/presentation/provider/chat_provider.dart';
import 'package:llm_chat_app/presentation/screen/widget/chat_input_field.dart';
import 'package:llm_chat_app/presentation/screen/widget/empty_chat.dart';
import 'package:llm_chat_app/presentation/screen/widget/message_bubble.dart';
import 'package:llm_chat_app/presentation/screen/widget/typing_indicator.dart';
import 'package:provider/provider.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
         spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
              child: Icon(Icons.smart_toy_outlined,size: 22,),
            ),
            Text(
              AppStrings.appName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight:FontWeight .w500,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
      body: Consumer<ChatProvider>(
        builder: (context,provider,child) {
          return Column(
            children: [
          Expanded(
            child: provider.messages.isEmpty && !provider.isLoading ? EmptyChat()  :
            ListView.builder(//user and bot chat gula dekhanor jonno
              controller: _scrollController,
              itemCount:provider.messages.length +
                  (provider.isLoading ? 1 : 0),//prompt deyar time e ekta length abr message ashle arekta length tai
              itemBuilder: (context,index){
                if(index==  provider.messages.length ){//message jodi length er soman hoi jai erpor ekta ... dot animation dekhabe
                  return TypingIndicator();
                }
                return MessageBubble(message: provider.messages[index]);//provider theke je message pai ta ei widget e pass kore dei ar ei widget oita bot and user left right kore dekhai
              },
            ),
          ),
              ChatInputField(onSend: provider.sendMessage, isLoading: provider.isLoading)
            ],
          );
        }
      ),
    );
  }
}
