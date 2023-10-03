import 'package:flutter/material.dart';
import 'package:prerak_ai/utils/assets.dart';
import 'package:prerak_ai/utils/size_config.dart';

class ChatAppbar extends StatelessWidget {
  const ChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
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
                    },
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Actor Name (Hindi Name)",
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
