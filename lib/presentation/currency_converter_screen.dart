import 'dart:convert';
import 'package:currency_converter/presentation/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../data/model/currency_model.dart';
import '../shared/components/cubit.dart';
class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final controller = TextEditingController();
  String selectedBaseCode = "";
  String selectedBaseName = "Euro";
  String selectedCountryCode = "";
  String selectedCountryName = "US Dollar";
  String selectedCountrySymbol = "£";
  Color background = Color(0xff38426e);
  Color orangeColor = Colors.orange;
  Color greenColor = Colors.green;

  @override
  void initState() {
    HomeCubit.getObject(context).allCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.getObject(context);
          return Scaffold(
            backgroundColor: background,
            body: state is LoadingHomeState ?
            Center(
              child: CircularProgressIndicator(),
            )
                :
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
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
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (ctx) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 16),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8),
                                                )
                                            ),
                                            height: 700,
                                            child: ListView.separated(
                                              itemCount: cubit.currencies
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  onTap: () {
                                                    selectedBaseCode =
                                                    cubit.currencies[index]
                                                        .code!;
                                                    selectedCountrySymbol =
                                                    cubit.currencies[index]
                                                        .symbol!;
                                                    selectedBaseName =
                                                    cubit.currencies[index]
                                                        .name!;
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  leading: Text(
                                                    cubit.currencies[index]
                                                        .code!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),
                                                  ),
                                                  trailing: Text(
                                                      cubit.currencies[index]
                                                          .symbol!),
                                                  title: Text(
                                                      cubit.currencies[index]
                                                          .name!),
                                                );
                                              },
                                              separatorBuilder: (
                                                  BuildContext context,
                                                  int index) {
                                                return const Divider(
                                                  color: Colors.blue,
                                                );
                                              },

                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
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
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    selectedCountryName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (ctx) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 16),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8),
                                                )
                                            ),
                                            height: 700,
                                            child: ListView.separated(
                                              itemCount: cubit.currencies
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  onTap: () {
                                                    selectedCountryCode =
                                                    cubit.currencies[index]
                                                        .code!;
                                                    selectedCountryName =
                                                    cubit.currencies[index]
                                                        .name!;
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  leading: Text(
                                                    cubit.currencies[index]
                                                        .code!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),
                                                  ),
                                                  trailing: Text(
                                                      cubit.currencies[index]
                                                          .symbol!),
                                                  title: Text(
                                                      cubit.currencies[index]
                                                          .name!),
                                                );
                                              },
                                              separatorBuilder: (
                                                  BuildContext context,
                                                  int index) {
                                                return const Divider(
                                                  color: Colors.blue,
                                                );
                                              },

                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
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
                          backgroundColor: background,
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
                    state is LoadingHomeState ?
                    Center(
                      child: CircularProgressIndicator(color: orangeColor),
                    )
                        :
                    InkWell(
                      onTap: () {
                        cubit.convert(selectedBaseCode, selectedCountryCode);
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
                        children: const [
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
        });
  }

}