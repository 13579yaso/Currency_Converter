import 'package:currency_converter/presentation/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/components/custom_textfield.dart';
import '../shared/components/pass_textfield.dart';
import '../shared/components/register_cubit.dart';
import 'currency_converter_screen.dart';
import 'package:http/http.dart' as http;
class SignUpScreen extends StatelessWidget {
  Color OrangrColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.getObject(context);
          return Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 25,
                                color: Color(0xffE5E2E2FF),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                "Create Account",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: const [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white10,
                                child: Icon(
                                  Icons.person_outline_rounded,
                                  size: 50,
                                  color: Color(0xffE5E2E2FF),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 30),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 20,
                                    color: Color(0xffE5E2E2FF),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            label: 'Full Name',
                            customController: cubit.nameCont,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            label: 'Phone Number',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            label: 'Email',
                            customController: cubit.emailCont,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PassTextField(
                            label: "Password",
                            customController: cubit.passwordCont,

                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PassTextField(
                            label: "Conferm Password",
                            customController: cubit.passwordCont,

                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: OrangrColor.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: OrangrColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (builder) =>
                                      CurrencyConverterScreen()),
                                      (route) => false,
                                );
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (builder) =>
                                        CurrencyConverterScreen()),
                                        (route) => false,
                                  );
                                },
                                child: Text(
                                  'Login', style: TextStyle(
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
                  )
              )
          );
        });
  }
}
