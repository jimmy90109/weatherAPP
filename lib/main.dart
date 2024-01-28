import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/widget/initial.dart';
import 'package:weather_app/widget/result.dart';

class ResultState extends Cubit<String> {
  ResultState() : super("initial");
  void initial() => emit("initial");
  void result() => emit("result");
}

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String input = "";
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          //init widget state
          create: (_) => ResultState(),
          child: BlocBuilder<ResultState, String>(builder: (context, state) {
            return Scaffold(
                backgroundColor: Colors.grey[300],
                body: SafeArea(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              //serach bar
                              child: TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  labelText: '請輸入城市名稱',
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // refresh result widget
                              context.read<ResultState>().initial();
                              input = controller.text;
                              context.read<ResultState>().result();
                            },
                            child: const Text("確認", style: TextStyle(color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Center(child: Builder(builder: (context) {
                            switch (state) {
                              case "initial":
                                return const InitialWidget();
                              case "result":
                                return ResultWidget(input);
                              //must return a widget
                              default:
                                return Container();
                            }
                          })),
                        ),
                      ),
                    ),
                  ]),
                ));
          }),
        ));
  }
}
