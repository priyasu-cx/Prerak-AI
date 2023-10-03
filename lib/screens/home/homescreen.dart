import 'package:flutter/material.dart';
import 'package:prerak_ai/data/character_data.dart';
import 'package:prerak_ai/routes/route_path.dart';
import 'package:prerak_ai/screens/home/widgets/questions.dart';
import 'package:prerak_ai/utils/assets.dart';
import 'package:prerak_ai/utils/colors.dart';
import 'package:prerak_ai/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PrerakAIColor.bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(PrerakAIAssets.logo),
                onPressed: () {},
              );
            },
          ),
          leadingWidth: screenWidth! * 0.3,
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              width: screenWidth! * 0.5,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "search..",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 11),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.02),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight! * 0.01),
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      width: screenWidth! * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.2)),
                      child: Text(
                        "Category $index",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenHeight! * 0.04),
                height: screenHeight! * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ActorData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RoutePath.routeChat, arguments: ActorData[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4),
                        width: screenWidth! * 0.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.2)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage("${ActorData[index]["Image"]}")
                                    // AssetImage(PrerakAIAssets.logo),
                              ),
                            ),
                            Text(
                              "${ActorData[index]["Name"]}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${ActorData[index]["Designation"]}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "@ Admin",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "450",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                thickness: 0.2,
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: screenWidth! * 0.08),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(PrerakAIAssets.logo),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Actor 1",
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Try Saying:",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionWidget();
                          })
                    ],
                  )),
            ],
          ),
        )));
  }
}
