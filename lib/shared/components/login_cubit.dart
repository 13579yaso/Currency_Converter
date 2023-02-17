import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../presentation/currency_converter_screen.dart';
import '../../presentation/login_states.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit getObject(context) => BlocProvider.of(context);
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  Future<void> logIn(context) async {
    emit(LoginLoading());
    http.post(
        Uri.parse("http://restapi.adequateshop.com/api/authaccount/login"),
        body: {
          "email": emailCont.text,
          "password": passwordCont.text
        }
    ).then((value) {
      emit(LoginSuccess());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CurrencyConverterScreen(),),
              (route) => false);
    }).catchError((onError) {
      emit(LoginError());
    });
  }
}
