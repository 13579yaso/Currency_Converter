import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/components/custom_textfield.dart';
import '../shared/components/login_cubit.dart';
import '../shared/components/pass_textfield.dart';
import 'Sign_up.dart';
import 'currency_converter_screen.dart';
import 'package:http/http.dart' as http;

import 'login_states.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  Color OrangrColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.getObject(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wellcome back!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Login into your account",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
                height: 64,
                child:CustomTextField(
                  label: "Email",
                  customController:cubit.emailCont,
                )
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 64,
                child: PassTextField(
                  label: "Password",
                  customController: cubit.passwordCont
                  ,

                )
            ),
            SizedBox(
              height: 35,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: OrangrColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: OrangrColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      cubit.logIn(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: OrangrColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: OrangrColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder:(context)=>SignUpScreen()));
                    },
                    child: Icon(
                      Icons.fingerprint,size: 30,color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(width: 2),
                TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context)=>SignUpScreen()));
                  },
                  child: Text(
                    'Sign Up',style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  });
}}
