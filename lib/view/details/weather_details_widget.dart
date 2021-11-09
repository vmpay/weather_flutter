import 'package:flutter/material.dart';
import 'package:weather_flutter_architecture/middleware/models/item_details_model.dart';
import 'package:weather_flutter_architecture/view/details/hourly_item_widget.dart';

import 'daily_card_widget.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget(this._item, {Key? key}) : super(key: key);
  final ItemDetailsModel _item;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 200.0,
          backgroundColor: const Color(0xFF398dff),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('${_item.city}, ${_item.country}'),
            background: Stack(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  // TODO
                  child: Image.asset('assets/graphics/sun.png'),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    '${_item.temp}°',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: _item.daily.isNotEmpty == true ? 150 : 0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _item.daily.isNotEmpty == true
                  ? _item.daily.map((e) => DailyCardWidget(e)).toList()
                  : [Container()],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
                _item.additionalInfo.isNotEmpty == true
                    ? HourlyItemWidget(_item.additionalInfo[index])
                    : Container(),
            childCount: _item.additionalInfo.length,
          ),
        ),
      ],
    );
  }
}
