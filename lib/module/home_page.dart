import 'package:flutter/material.dart';
import 'package:flutter_gemini_ai_chat/module/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) {
          print(value.listMessage);
          return Scaffold(
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width > 600 ? 400 : MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/pattern.jpg",
                        repeat: ImageRepeat.repeat,
                      ),
                    ),
                    Positioned(
                        top: 60,
                        bottom: 60,
                        right: 0,
                        left: 0,
                        child: ListView.builder(
                          itemCount: value.listMessage.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            final chat = value.listMessage[i];

                            return Container(
                              color: chat.posisi == "kanan"
                                  ? Colors.green[400]
                                  : chat.posisi == "kiri"
                                      ? Colors.white
                                      : Colors.grey,
                              padding: EdgeInsets.only(
                                left: chat.posisi == "kanan" ? 80 : 16,
                                right: chat.posisi == "kiri" ? 80 : 16,
                              ),
                              child: Text("${value.chat}"),
                            );
                          },
                        )),
                    // Positioned(
                    //   top: 70,
                    //   left: 0,
                    //   right: 0,
                    //   bottom: 80,
                    //   child: ListView(
                    //     reverse: true,
                    //     children: value.chats
                    //         .map((e) => Padding(
                    //               padding: const EdgeInsets.only(
                    //                 left: 50,
                    //                 right: 10,
                    //               ),
                    //               child: Container(
                    //                 padding: const EdgeInsets.all(13),
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.grey),
                    //                   color: Colors.white,
                    //                   borderRadius: const BorderRadius.only(
                    //                     topLeft: Radius.circular(8),
                    //                     topRight: Radius.circular(8),
                    //                     bottomLeft: Radius.circular(8),
                    //                     bottomRight: Radius.zero,
                    //                   ),
                    //                 ),
                    //                 child: Text("${value.chats}"),
                    //               ),
                    //             ))
                    //         .toList(),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 10,
                      left: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                controller: value.chat,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.addMessage();
                                    },
                                    icon: Icon(Icons.send),
                                  ),
                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.camera_alt,
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.mic,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          color: Colors.white,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/pp.jpg"),
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Faatikh Riziq",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 15),
                              Spacer(),
                              GestureDetector(
                                child: Icon(Icons.more_vert),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
