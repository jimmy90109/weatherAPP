import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/fetch_result.dart';
import 'package:weather_app/widget/loading.dart';

class ResultWidget extends ConsumerWidget {
  final String city;
  const ResultWidget(this.city, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Map> result = ref.watch(weatherProvider(city));
    if (result is AsyncLoading) {
      return const LoadingWidget();
    } else if (result is AsyncError) {
      return Center(
        child: Text(
          result.error.toString(),
        ),
      );
    } else {
      if (result.value!["records"]["location"].isEmpty) {
        return const Center(
          child: Text(
            "輸入的搜索條件無效",
          ),
        );
      }
      try {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            result.value!["records"]["location"][0]["weatherElement"][0]["time"][0]["startTime"].toString().substring(5, 16),
                          ),
                          const Text("|"),
                          Text(
                            result.value!["records"]["location"][0]["weatherElement"][0]["time"][0]["endTime"].toString().substring(5, 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    result.value!["records"]["location"][0]["weatherElement"][0]["time"][0]["parameter"]["parameterName"].toString(),
                  ),
                  Text(
                    "${result.value!["records"]["location"][0]["weatherElement"][1]["time"][0]["parameter"]["parameterName"]}%",
                  ),
                  Text(
                    "${result.value!["records"]["location"][0]["weatherElement"][2]["time"][0]["parameter"]["parameterName"]}-${result.value!["records"]["location"][0]["weatherElement"][4]["time"][0]["parameter"]["parameterName"]}C",
                  ),
                  Text(
                    result.value!["records"]["location"][0]["weatherElement"][3]["time"][0]["parameter"]["parameterName"],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              result.value!["records"]["location"][0]["weatherElement"][0]["time"][1]["startTime"].toString().substring(5, 16),
                            ),
                            const Text("|"),
                            Text(
                              result.value!["records"]["location"][0]["weatherElement"][0]["time"][1]["endTime"].toString().substring(5, 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      result.value!["records"]["location"][0]["weatherElement"][0]["time"][1]["parameter"]["parameterName"].toString(),
                    ),
                    Text(
                      "${result.value!["records"]["location"][0]["weatherElement"][1]["time"][1]["parameter"]["parameterName"]}%",
                    ),
                    Text(
                      "${result.value!["records"]["location"][0]["weatherElement"][2]["time"][1]["parameter"]["parameterName"]}-${result.value!["records"]["location"][0]["weatherElement"][4]["time"][0]["parameter"]["parameterName"]}C",
                    ),
                    Text(
                      result.value!["records"]["location"][0]["weatherElement"][3]["time"][1]["parameter"]["parameterName"],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            result.value!["records"]["location"][0]["weatherElement"][0]["time"][2]["startTime"].toString().substring(5, 16),
                          ),
                          const Text("|"),
                          Text(
                            result.value!["records"]["location"][0]["weatherElement"][0]["time"][2]["endTime"].toString().substring(5, 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    result.value!["records"]["location"][0]["weatherElement"][0]["time"][2]["parameter"]["parameterName"].toString(),
                  ),
                  Text(
                    "${result.value!["records"]["location"][0]["weatherElement"][1]["time"][2]["parameter"]["parameterName"]}%",
                  ),
                  Text(
                    "${result.value!["records"]["location"][0]["weatherElement"][2]["time"][2]["parameter"]["parameterName"]}-${result.value!["records"]["location"][0]["weatherElement"][4]["time"][0]["parameter"]["parameterName"]}C",
                  ),
                  Text(
                    result.value!["records"]["location"][0]["weatherElement"][3]["time"][2]["parameter"]["parameterName"],
                  ),
                ],
              ),
            ),
          ],
        );
      } catch (e) {
        return const Center(
          child: Text(
            "API返回的數據格式不正確",
          ),
        );
      }
    }
  }
}
