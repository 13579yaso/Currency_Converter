import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/model/currency_model.dart';
import '../../presentation/states.dart';
String convertedValue = "0.0";
class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(InitialHomeState());
  static HomeCubit getObject(context)=>BlocProvider.of(context);
  List<CurrencyModel> currencies =[];
  Future<String> convert(String base,String currency)async{
    emit(LoadingHomeState());
    Uri uri= Uri(
      scheme: "https",
      host: "api.freecurrencyapi.com",
      path: "v1/latest",
      queryParameters: {
        "apikey":"N8na7dQL8kt7phAWoSS4brbPX97Ubjo9ydW8JyMN",
        "currencies":currency,
        "base_currency" :base
      },
    );
    var response = await http.get(uri);
    if(response.statusCode==200){
      var decodedBody = json.decode(response.body) as Map<String,dynamic>;
      num rate  = decodedBody["data"][currency];
      emit(ConvertSuccessHomeState());
      return convertedValue  = rate.toStringAsFixed(2);
    }else{
      emit(ConvertErrorHomeState());
      return "Error";
    }

  }
  Future allCurrencies()async{
    emit(LoadingHomeState());
    Uri uri= Uri(
      scheme: "https",
      host: "api.freecurrencyapi.com",
      path: "v1/currencies",
      queryParameters: {
        "apikey":"N8na7dQL8kt7phAWoSS4brbPX97Ubjo9ydW8JyMN",
        "currencies":"",
      },
    );
    var response = await http.get(uri);
    if(response.statusCode==200){
      var decodedBody = json.decode(response.body) as Map<String,dynamic>;
      Map<String,dynamic> mappedCountries = decodedBody["data"];
      currencies =  mappedCountries.entries.map(
              (e) => CurrencyModel.fromJson(e.value as Map<String,dynamic>)
      ).toList();
      emit(ConvertSuccessHomeState());
    }else{
      return [];
    }
  }
}