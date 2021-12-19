part of 'panchang_widgets.dart';

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
