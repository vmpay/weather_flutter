import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 200.0,
            backgroundColor: const Color(0xFF398dff),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Kraków, Poland'),
              background: Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    width: double.infinity,
                    child: Image.asset('assets/graphics/sun.png'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: const Text(
                      '11°',
                      style: TextStyle(
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
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text('Tuesday'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  Image.asset('assets/graphics/sun_icon.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                '11°',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '9:00',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Sunny',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(child: Container()),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          '13°',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
