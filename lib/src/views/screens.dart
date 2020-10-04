library views;

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:watsapp/main.dart';
import 'package:watsapp/src/constants/app_constants.dart';
import 'package:watsapp/src/modals/chats/chats.dart';
import 'package:watsapp/src/modals/thread/thread.dart';
import 'package:watsapp/src/services/router.dart';
import 'package:watsapp/src/widgets/clip_r_thread.dart';
import 'package:watsapp/src/widgets/custom_app_bar.dart';
import 'package:watsapp/src/widgets/round_input.dart';

// home
part './home/home_page.dart';

// tabs
part './tabs/camara_screen.dart';
part './tabs/chat_screen.dart';
part './tabs/status_screen.dart';
part './tabs/calls_screen.dart';

// chats
part './chats/chat_room.dart';

// calls
part './calls/selected_call_contact.dart';
part './chats/char_list_tile.dart';
part './chats/chat_room_appbar.dart';
part './chats/chat_thread.dart';
part './chats/send_message.dart';

// camera
//part './camera/tab_camera.dart';

// contacts
part './contacts/contacts_list.dart';