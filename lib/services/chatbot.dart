import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mood_frontend/models/chatbot_reply.dart';

const URL = 'https://moodrestapi.herokuapp.com/rest-apis/rest-get/';

chatbotReply() async {
  http.Response response = await http.get(URL);
  var res = jsonDecode(response.body);
  print(res);
}

Future<ChatbotReply> chatbotPostMethod(String url, Map body) async {
  return http.post(url, body: body).then((http.Response response) {
    return ChatbotReply.fromJson(json.decode(response.body));
  });
}
