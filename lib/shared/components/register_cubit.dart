import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../presentation/currency_converter_screen.dart';
import '../../presentation/register_states.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit getObject(context) => BlocProvider.of(context);
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  Future<void> signUp(context) async {
    emit(RegisterLoading());
    http.post(
        Uri.parse(
            "http://restapi.adequateshop.com/api/authaccount/registration"),
        body: {
          "name": nameCont.text,
          "email": emailCont.text,
          "password": passwordCont.text
        }
    ).then((value) {
      emit(RegisterSuccess());
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(
        builder: (context) => const CurrencyConverterScreen(),),
              (route) => false);
    }).catchError((onError) {
      emit(RegisterError());
    });
  }
}
