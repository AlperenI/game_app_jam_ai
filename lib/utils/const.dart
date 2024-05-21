// ignore_for_file: prefer_const_declarations

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

const String geminiApiKey="AIzaSyCssXDsyb4R6YBUWyEIeeGITZ_HDdfiJk8";

final Gemini gemini=Gemini.instance;
const String profileImageUrl="https://storage.googleapis.com/gweb-uniblog-publish-prod/images/final_keyword_header.width-600.format-webp.webp";
ChatUser currentUser=ChatUser(id: "0",firstName: "A");

ChatUser geminiUser=ChatUser(id: "1",firstName: "Gemini",profileImage: profileImageUrl );


