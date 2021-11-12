import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_flutter_architecture/utils/constants.dart';

import '../item_details_model.dart';

class HourlyItemWidget extends StatelessWidget {
  const HourlyItemWidget(this._item, {Key? key}) : super(key: key);
  final AdditionalInfo _item;

  @override
  Widget build(BuildContext context) {
    if (_item.date.isEmpty) {
      return buildInfoWidget(_item);
    } else if (_item.date == separator) {
      return buildSeparatorWidget();
    } else {
      return buildForecastWidget(_item);
    }
  }

  Widget buildSeparatorWidget() => Container(
        width: double.infinity,
        height: 2,
        color: Colors.black,
      );

  Widget buildForecastWidget(AdditionalInfo item) => SizedBox(
        height: 60.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                item.date,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                item.key,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                item.value,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ],
        ),
      );

  Widget buildInfoWidget(AdditionalInfo item) => SizedBox(
        height: 60.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                item.key,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                item.value,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ],
        ),
      );
}
