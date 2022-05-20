// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, avoid_print, sized_box_for_whitespace

import 'package:chat_app/widgets/btn_blue.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/label.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Logo(title: 'Register'),
                _Form(),
                Labels(ruta: 'login', txtAcount: 'I have account',),
                Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.person_add, 
            placeholder: 'Name', 
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.email_outlined, 
            placeholder: 'Email', 
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.password, 
            placeholder: 'Password',
            keyboardType: TextInputType.text, 
            textController: passCtrl,
            isPassword: true,
          ),
          BtnBlue(
            txt: 'Create Acount', 
            onPress: (){
              print(emailCtrl.text);
              print(passCtrl.text);
            }
          ),
        ],
      ),
    );
  }
}
