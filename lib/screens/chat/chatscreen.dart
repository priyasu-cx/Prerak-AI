import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prerak_ai/data/providers/message_provider.dart';
import 'package:prerak_ai/screens/chat/widgets/appbar.dart';
import 'package:prerak_ai/utils/assets.dart';
import 'package:prerak_ai/utils/colors.dart';
import 'package:prerak_ai/utils/size_config.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(messageProvider);
    final textController = TextEditingController();
    final character = ModalRoute.of(context)!.settings.arguments as Map;
    // print(character);

    return Scaffold(
        backgroundColor: PrerakAIColor.bgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 0.2),
            child: ChatAppbar(character: character,)),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth! * 0.08,
                      vertical: screenHeight! * 0.01),
                  child: Column(
                    children: [
                      // QuestionWidgets(),
                      // Answer(),
                      Suggestions(),
                      // CustomQues(),
                      ...chat.map((chat) => Column(
                        children: [
                          CustomQues(message: chat['message']!),
                          Answer(message: chat['reply']!, image: character["Image"]!)
                        ],
                      )),

                      SizedBox(
                        height: screenHeight! * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
              decoration: const BoxDecoration(
                  color: PrerakAIColor.textfieldcolor),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: textController,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: "Type Message or Help",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14),
                          border: InputBorder.none,

                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    ref.read(messageProvider.notifier).sendMessage(textController.text, character["Name"]!);
                    textController.clear();
                    FocusScope.of(context).unfocus();
                  }, icon: const Icon(Icons.send,color: Colors.white,))
                ],
              ),
            )
          ],
        ));
  }
}

class QuestionWidgets extends StatelessWidget {
  const QuestionWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text("How do you handle pressure in crucial matches ?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          )),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({super.key, required this.message, required this.image});

  final String message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(image),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: PrerakAIColor.chatbotcolor),
              child: Text(
                message,
                // "Virat, handling pressure in crucial matches requires a combination of mental fortitude and strategic focus. Firstly, maintain a calm demeanor; take deep breaths to center yourself. Trust in your training and preparation; remind yourself of past successes. Break the game down into smaller, manageable tasks. Communicate effectively with your teammates to ensure everyone is on the same page. Stay adaptable and be willing to adjust tactics if needed. Visualize success and maintain a positive mindset. Embrace pressure as an opportunity rather than a burden, using it to fuel your determination. Lastly, remember to enjoy the game; let your love for cricket drive you forward.",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "CLICK ON ANY OF THE SUGGESTIONS BELOW",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SuggesstionQues(),
          SuggesstionQues(),
          SuggesstionQues(),
        ],
      ),
    );
  }
}

class SuggesstionQues extends StatelessWidget {
  const SuggesstionQues({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: PrerakAIColor.chatbotcolor),
      child: Text(
        "How do I maintain a strict fitness routine?",
        style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white),
      ),
    );
  }
}

class CustomQues extends StatelessWidget {
  const CustomQues({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: screenWidth! * 0.65,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.white),
            child: Text(
              message,
              style: TextStyle(fontSize: 12),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
          ),
        ],
      ),
    );
  }
}

