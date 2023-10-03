
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

final messageProvider = StateNotifierProvider<MessageNotifier, List<Map<String, String>>>((ref) {
  return MessageNotifier();
});

class MessageNotifier extends StateNotifier<List<Map<String, String>>> {
  MessageNotifier() : super([]);

  void sendMessage(String message, String name) async {
    final reply = await receiveMessage(message, name);
    state = [...state, {'message': message, 'reply': reply}];
  }

  void clear() {
    state = [];
  }

  Future<String> receiveMessage(String message, String name) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['token']}',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "Assume yourself as $name and answer the following questions."
          },
          {
            "role": "user",
            "content": message
          }
        ]
      })
    );

    // print(response.body);

    final responseModel = jsonDecode(response.body);
    final answer = responseModel['choices'][0]['message']['content'];
    return answer;
  }
}
