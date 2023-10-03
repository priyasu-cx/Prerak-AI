import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prerak_ai/data/providers/message_provider.dart';
import 'package:prerak_ai/utils/assets.dart';
import 'package:prerak_ai/utils/size_config.dart';

class ChatAppbar extends ConsumerWidget {
  const ChatAppbar({super.key, required this.character});

  final Map character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.2)),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset(PrerakAIAssets.logo),
                  onPressed: () {},
                );
              },
            ),
            leadingWidth: screenWidth! * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 0.2),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 16,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // clear state
                      ref.read(messageProvider.notifier).clear();
                    },
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${character["Name"]} (${character["Hindi Name"]})",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Created by @Admin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 0.2),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 0.2),
            ),
            child: Text("Remember: Everything Characters say is made up!", style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),),
          )
        ],
      ),
    );
  }
}
