import 'package:flutter/material.dart';
import 'webscrap1.dart';

class WSOCPage extends StatefulWidget
{
  @override
  _SliverAppBarWithTabs createState() => _SliverAppBarWithTabs();
}

class _SliverAppBarWithTabs extends State<WSOCPage> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //  title: Text("BASEBALL"),
            // title: Text('BASEBALL', style: TextStyle(fontSize: 25.0,)),
            pinned: true,
            backgroundColor: Colors.grey,

            //snap: true,
            //floating: true,
            expandedHeight: 175.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              //   title: Text('BASEBALL', style: TextStyle(fontSize: 25.0,)),
              background: Image.asset('images/wsoc.jpg', fit: BoxFit.cover),
            ),

            bottom: TabBar(
              labelColor: Colors.black,
              //labelPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              unselectedLabelColor: Colors.white,
              // indicatorSize: TabBarIndicatorSize.label,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                // color: Colors.white.withOpacity(0.8),
                color: Colors.white,
              ),
              isScrollable: true,
              tabs: [
                Tab (
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("SCHEDULE")
                    )),
                Tab (
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("ROSTER")
                    )),
                Tab (
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("COACHES")
                    )),
                Tab (
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("STATISTICS")
                    )),
                Tab (
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("RECRUITS")
                    )),
              ],
              controller: controller,
            ),
          ),

          SliverFillRemaining(
            child: TabBarView(
              //controller: controller ,
              controller: controller,
              children: <Widget>[
                Center(child: Text("TAB ONE")),
                Center(child: Text("TAB TWO")),
                Container(
                    color: Colors.black,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: wscCoaches.length,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Container (
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border(bottom: BorderSide(color: Colors.grey, width: 2.0)),
                              ),
                              child: Row(
                                  children: <Widget> [
                                    Container(
                                      height: 120.0,
                                      width: 100.0,
                                      margin: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: wscCoaches[index].image,
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Center(child: Column(
                                        children: <Widget>[
                                          Text(wscCoaches[index].name, style: TextStyle(fontSize: 26.0, color: Colors.white), textAlign: TextAlign.center,),
                                          Text(wscCoaches[index].title, style: TextStyle(fontSize: 26.0, color: Colors.white), textAlign: TextAlign.center,),

                                        ]
                                    )
                                    ),
                                  ]
                              )
                          );
                        }
                    )
                ),
                Center(child: Text("TAB FOUR")),
                Center(child: Text("TAB FIVE")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WSocCoaches
{
  WSocCoaches({this.name, this.title, this.image});
  final String name;
  final String title;
  final NetworkImage image;
}

List<WSocCoaches> wscCoaches = <WSocCoaches>[
  WSocCoaches(name: "Seth Spidahl", title: "Head Coach", image: NetworkImage('https://golutes.com/images/2018/4/24//spidahl.jpg?width=80')),
  WSocCoaches(name: "Scott Ford", title: "Assistant Coach", image: NetworkImage('https://golutes.com/images/2020/9/24/Ford_71.JPG?width=80')),
  WSocCoaches(name: "Kate Green", title: "Assistant Coach", image: NetworkImage('https://golutes.com/images/2020/9/30/Green.JPG?width=80')),
  WSocCoaches(name: "Nathan Salveson", title: "Assistant Coach", image: NetworkImage('https://golutes.com/images/2020/9/30/Salveson.JPG?width=80')),
];