import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/model/currency_model.dart';
class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final controller = TextEditingController();
  List<CurrencyModel> currencies =[];
  String selectedBaseCode = "";
  String selectedBaseName = "Euro";
  String selectedCountryCode = "";
  String selectedCountryName= "US Dollar";
  String selectedCountrySymbol = "£";
  String convertedValue = "0.0";
  bool isLoading = false;
  bool isButtonLoading = false;
  Color background=Color(0xff38426e);
  Color orangeColor=Colors.orange;
  Color greenColor=Colors.green;
  @override
  void initState() {
    allCurrencies().then((value) {
      setState(() {
        isLoading = false;
      });
    }).catchError((onError){
      setState(() {
        isLoading =false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:background,
      body:isLoading?
      Center(
        child: CircularProgressIndicator(),
      )
          :
      Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              selectedBaseName,
                              style:const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (ctx){
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32,vertical: 16),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          )
                                      ),
                                      height: 700,
                                      child: ListView.separated(
                                        itemCount: currencies.length,
                                        itemBuilder: (context,index){
                                          return ListTile(
                                            onTap: () {
                                              selectedBaseCode =currencies[index].code!;
                                              selectedCountrySymbol =currencies[index].symbol!;
                                              selectedBaseName =currencies[index].name!;
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            leading:Text(currencies[index].code!,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            trailing:Text(currencies[index].symbol!),
                                            title: Text(currencies[index].name!),
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) {
                                        return const Divider(
                                          color: Colors.blue,
                                        );
                                      },

                                      ),
                                    );
                                  },
                                );
                              },
                              icon:const Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                              ),
                            ),
                            const Spacer(flex: 4,),
                            Text(
                              "1 $selectedCountrySymbol",
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                            color:greenColor,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              selectedCountryName,
                              style:const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (ctx){
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32,vertical: 16),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          )
                                      ),
                                      height: 700,
                                      child: ListView.separated(
                                        itemCount: currencies.length,
                                        itemBuilder: (context,index){
                                          return ListTile(
                                            onTap: () {
                                              selectedCountryCode=currencies[index].code!;
                                              selectedCountryName =currencies[index].name!;
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            leading:Text(currencies[index].code!,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            trailing:Text(currencies[index].symbol!),
                                            title:Text(currencies[index].name!),
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) {
                                        return const Divider(
                                          color: Colors.blue,
                                        );
                                      },

                                      ),
                                    );
                                  },
                                );
                              },
                              icon:const Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                              ),
                            ),
                            const Spacer(flex: 4,),
                            Text(
                              convertedValue,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    backgroundColor:background,
                    onPressed: () {},
                    child: CircleAvatar(
                      maxRadius: 23,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.autorenew_rounded,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              isButtonLoading?
              Center(
                child: CircularProgressIndicator(color: orangeColor),
              )
                  :
              InkWell(
                onTap: () {
                  setState(() {
                    isButtonLoading = true;
                  });
                  convert(selectedBaseCode, selectedCountryCode).then((value){
                    setState(() {
                      convertedValue =value;
                      isButtonLoading = false;
                    });
                  });
                },
                child: Container(
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 35,
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        "Convert",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 35,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      "Historical Data",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<String> convert(String base,String currency)async{
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
      return rate.toStringAsFixed(2);
    }else{
      return "Error";
    }

  }
  Future allCurrencies()async{
    setState(() {
      isLoading = true;
    });
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
    }else{
      return [];
    }
  }
}

