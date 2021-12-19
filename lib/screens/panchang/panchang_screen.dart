import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today/model/panchang_response.dart';
import 'package:india_today/screens/panchang/panchang_cubit/panchang_cubit.dart';
import 'package:india_today/screens/panchang/panchang_widgets/panchang_widgets.dart';
import 'package:india_today/widgets/my_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

class PanchangScreen extends StatefulWidget {
  const PanchangScreen({Key? key}) : super(key: key);

  @override
  State<PanchangScreen> createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      BlocProvider.of<PanchangCubit>(context).getPanchang();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<PanchangCubit, PanchangState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Daily Panchang".text.bold.subtitle1(context).make(),
                const HeightBox(4),
                Text(
                  "India is country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates, we bring you the daily panchang.",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Filters(),
                state is PanchangLoaded
                    ? Builder(
                        builder: (context) {
                          Panchang panchang = state.panchang;
                          return Column(
                            children: [
                              Lunar(lunarData: lunarData),
                              const Divider(color: Colors.grey),
                              PanchangList(panchang: panchang),
                            ],
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            );
          },
        ).p16(),
      ),
    );
  }
}

class PanchangList extends StatelessWidget {
  final Panchang panchang;
  const PanchangList({
    Key? key,
    required this.panchang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
