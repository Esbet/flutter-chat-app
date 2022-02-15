
import 'package:chatapp/helpers/mostrar_alerta.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/services/socket_service.dart';
import 'package:chatapp/widgets/boton_azul.dart';
import 'package:chatapp/widgets/custom_input.dart';
import 'package:chatapp/widgets/labels.dart';
import 'package:chatapp/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Logo(titulo: 'Messenger'),
                _Form(),
                Labels(ruta: 'register', titulo: '¿No tienes cuenta?', subtitulo: 'Crea una ahora!',),
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ],),
          ),
        ),
      )
   );
  }
}



class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);


    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          
          CustomInput(
            icon:Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,

          ),
          CustomInput(
            icon:Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,

          ),
         

          BotonAzul(
            text:'Ingrese',
            onPressed: authService.autenticando ? null :() async {
              FocusScope.of(context).unfocus();
              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

              if(loginOk){
                //navegar a otra pantalla
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              }else{
                //mostrar alerta
                mostrarAlerta(context, 'Login incorrecto', 'Ingrese credenciales nuevamente');
              }
            },
          )
          //RaisedButton(onPressed: () {},)
        ],),
    );
  }
}

