import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pageview.dart';

/////////////////////////////
// INDIVIDUAL SPORT PAGES //
////////////////////////////
import 'secondpage.dart'; // This is the Baseball Page
import 'mbskPage.dart';
import 'wsocPage.dart';
import 'msocPage.dart';
import 'crewPage.dart';
import 'sbPage.dart';
import 'wbskPage.dart';
import 'mgolf.dart';
import 'wgolf.dart';
import 'mswim.dart';
import 'wswim.dart';
import 'mxcPage.dart';
import 'wxcPage.dart';
import 'footballPage.dart';
import 'mtenPage.dart';
import 'wtenPage.dart';
import 'wtfPage.dart';
import 'mtfPage.dart';
import 'vbPage.dart';

//////////////////
// EXTRA PAGES //
/////////////////
import 'post.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:flutter/foundation.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart';
import 'webscrap1.dart' as webscraper1;

void main() {
  runApp(MyApp());
//   runApp(Post());
  // runApp(PageViews());
}

class MyApp extends StatelessWidget {
  // Root Widget of App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLU Athletics',
      home: HomePage(),
    );
  }
}

// Create the Class for the (Sports) Tiles
class Tile
{
  String title;
  List<Tile> children;
  Tile(this.title, [this.children = const <Tile>[]]);
}

// List of Sports
List<Tile> sports = <Tile> [
  new Tile('Baseball'),
  new Tile('Basketball',
    <Tile> [
      new Tile("Men's Basketball"),
      new Tile("Women's Basketball"),
    ],
  ),
  new Tile('Cross Country',
    <Tile> [
      new Tile("Men's Cross Country"),
      new Tile("Women's Cross Country"),
    ],
  ),
  new Tile ('Football'),
  new Tile ('Golf',
    <Tile> [
      new Tile("Men's Golf"),
      new Tile("Women's Golf"),
    ],
  ),
  new Tile ('Rowing'),
  new Tile('Soccer',
    <Tile> [
      new Tile("Men's Soccer"),
      new Tile("Women's Soccer"),
    ],
  ),
  new Tile('Softball'),
  new Tile('Swimming',
    <Tile> [
      new Tile ("Men's Swimming"),
      new Tile("Women's Swimming"),
    ],
  ),
  new Tile("Tennis",
    <Tile> [
      new Tile("Men's Tennis"),
      new Tile("Women's Tennis"),
    ],
  ),
  new Tile("Track & Field",
    <Tile> [
      new Tile("Men's Track & Field"),
      new Tile("Women's Track & Field"),
    ],
  ),
  new Tile("Volleyball"),
];

class SportsTiles extends StatelessWidget
{
  final Tile sportsTile;
  final BuildContext c;
  SportsTiles(this.sportsTile, this.c);

  @override
  Widget build (BuildContext context)
  {
    return _buildTiles(sportsTile);
  }

  Widget _buildTiles (Tile t)
  {
    // If a Sport doesn't have a Men's & Women's Program
    // EG: Volleyball
    if (t.children.isEmpty)
    {
      return new ListTile(
        //subtitle: Image.asset('images/bsb.jpg', fit: BoxFit.cover),
          title: new Text(t.title, style: TextStyle(color: Colors.white, fontSize: 20)),
          //   onTap: () => print("Hello!")
          onTap: ()
          {
            if (t.title == "Baseball")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => SecondPage()));
            }

            else if (t.title == "Men's Basketball")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MBSKPage()));
            }

            else if (t.title == "Women's Basketball")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WBSKPage()));
            }

            else if (t.title == "Women's Soccer")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WSOCPage()));
            }

            else if (t.title == "Men's Soccer")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MSOCPage()));
            }

            else if (t.title == "Rowing")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => CrewPage()));
            }

            else if (t.title == "Softball")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => SBPage()));
            }

            else if (t.title == "Women's Golf")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WGolfPage()));
            }

            else if (t.title == "Men's Golf")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MGolfPage()));
            }

            else if (t.title == "Men's Swimming")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MSwimPage()));
            }

            else if (t.title == "Women's Swimming")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WSwimPage()));
            }

            else if (t.title == "Women's Cross Country")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WXCPage()));
            }

            else if (t.title == "Men's Cross Country")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MXCPage()));
            }

            else if (t.title == "Football")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => FBPage()));
            }

            else if (t.title == "Women's Track & Field")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WTFPage()));
            }

            else if (t.title == "Men's Track & Field")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MTFPage()));
            }

            else if (t.title == "Men's Tennis")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => MTenPage()));
            }

            else if (t.title == "Women's Tennis")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => WTenPage()));
            }

            else if (t.title == "Volleyball")
            {
              Navigator.push(c, MaterialPageRoute(builder: (context) => VBPage()));
            }

          }
        //Navigator.push(c, MaterialPageRoute(builder: (context) => SecondPage())),
        // minLeadingWidth: 10.0,
      );
    }

    return new ExpansionTile(
      //backgroundColor: Colors.grey,
      // expandedAlignment: Alignment.center,
      // initiallyExpanded: true,
      // key: new PageStorageKey<Tile>(t),

      title: new Text(t.title, style: TextStyle(color: Colors.white, fontSize: 20)),
      children: t.children.map(_buildTiles).toList(),
    );
  }


}

// List <String> sports =
// [
//   'images/msoc.jpg',
//   'images/wsoc.jpg',
//   'images/mtrack.jpg',
//   'images/mbsk.jpg',
//   'images/sb.jpg',
// ];

class HomePage extends StatelessWidget
{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold (
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget> [
                  DrawerHeader(
                    child: Text("Welcome to Luteville", style: TextStyle(fontSize: 40.0)),
                    decoration: BoxDecoration(color: Colors.amber),
                  ),

                  ListTile(
                      title: Text("Upcoming Events"),
                    onTap: () async =>
                    {
                      await launch("https://golutes.com/calendar?vtype=list"),
                      //Navigator.pop(context);
                    },),

                  ListTile(
                      title: Text("Live Stream"),
                      onTap: () async =>
                      {
                        await launch("https://portal.stretchinternet.com/plu/"),
                        //Navigator.pop(context);
                  },),

                  ListTile(
                    title: Text("News"),
                    onTap: () async =>
                    {
                      await launch("https://golutes.com/archives"),
                      //Navigator.pop(context);
                    },),

                  ListTile(
                    title: Text("GoLutes Instagram"),
                    onTap: () async =>
                    {
                      await launch("https://www.instagram.com/golutes/?hl=en"),
                      //Navigator.pop(context);
                    },),

                  ListTile(
                    title: Text("GoLutes Twitter Feed"),
                    onTap: () async =>
                    {
                      await launch("https://twitter.com/golutes?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"),
                      //Navigator.pop(context);
                    },),
                ]
            )

        ),
        body: CustomScrollView(
            slivers: <Widget> [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black,
                //floating: true,
                expandedHeight: 175.0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  title: Text('PLU ATHLETICS',),
                  background: Image.asset('images/mtrack.jpg', fit: BoxFit.cover),
                ),
              ),

              SliverList (
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index)
                    {
                      // onTap: (context) {
                      //   Navigator.push(context, MaterialPageRoute (builder: (context) => SecondPage()));
                      // };
                      return Container(
                        // height: 600.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(0, .5, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          children: <Widget> [SportsTiles(sports[index], context),],
                        ),

                      );
                    }, childCount: sports.length,
                  )
              ),
            ]

        )
    );
  }
}
