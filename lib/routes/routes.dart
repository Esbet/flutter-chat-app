

import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/loading_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/registe_page.dart';
import 'package:chatapp/pages/usuarios_page.dart';
import 'package:flutter/material.dart';



final Map<String, WidgetBuilder> appRoutes = {
  'usuarios': ( _ ) => UsuariosPage(),
  'chat':  ( _ ) => ChatPage(),
  'login': ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),
  'loading': ( _ ) => LoadingPage(),

};

