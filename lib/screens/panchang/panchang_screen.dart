import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today/screens/panchang/panchang_cubit/panchang_cubit.dart';
import 'package:india_today/widgets/my_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

class LunarData {
  final String title;
  final IconData icon;
  final String time;

  LunarData({
    required this.title,
    required this.icon,
    required this.time,
  });
}

class PanchangScreen extends StatelessWidget {
  const PanchangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PanchangCubit>(context).getPanchang();
    List<LunarData> lunarData = [
      LunarData(
          title: "Sunrise", icon: CupertinoIcons.sunrise, time: "6:00 AM"),
      LunarData(title: "Sunset", icon: CupertinoIcons.sunset, time: "6:00 AM"),
      LunarData(title: "Moonrise", icon: CupertinoIcons.moon, time: "6:00 AM"),
      LunarData(
          title: "Moonset", icon: CupertinoIcons.moon_zzz, time: "6:00 AM"),
    ];
    return MyScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Daily Panchang".text.bold.subtitle1(context).make(),
            const HeightBox(4),
            Text(
              "India is country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates, we bring you the daily panchang.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const Filters(),
            Lunar(lunarData: lunarData),
            const Divider(color: Colors.grey),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tithi",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ).py8(),
                    const PanchangDataTable(
                      data: [
                        {"Tithi Number": "13"},
                        {"Tithi Name": "13"},
                        {"Special": "13"},
                        {"Summary": "bye"},
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ).p16(),
      ),
    );
  }
}

class PanchangDataTable extends StatelessWidget {
  final List<Map<String, String>> data;

  const PanchangDataTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.screenWidth / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i in data)
                for (var heading in i.keys)
                  Text(
                    heading,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w400,
                    ),
                  ).py4(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i in data)
                for (var values in i.values)
                  Text(
                    values,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ).py4(),
            ],
          ),
        ),
      ],
    );
  }
}

class Lunar extends StatelessWidget {
  const Lunar({
    Key? key,
    required this.lunarData,
  }) : super(key: key);

  final List<LunarData> lunarData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lunarData.length,
        itemBuilder: (context, index) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                lunarData[index].icon,
                color: const Color(0xff5467BF),
              ).px8(),
              Column(
                children: [
                  Text(
                    lunarData[index].title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: const Color(0xff5467BF)),
                  ),
                  Text(
                    lunarData[index].time,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ).px8(),
              const SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: Colors.grey,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class Filters extends StatelessWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent.withOpacity(0.2),
      padding: const EdgeInsets.all(28),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: const Text(
                  "Date",
                ).p8(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "17 Dec, 2021".text.make(),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ).py8(),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: const Text(
                  "Location",
                ).p8(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: "Delhi, India".text.make(),
                ),
              ),
            ],
          ).py8(),
        ],
      ),
    );
  }
}
