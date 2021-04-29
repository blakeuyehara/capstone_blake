import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

Future initiate(BaseClient client) async
{
  Response response = await client.get('https://golutes.com/sports/womens-soccer/schedule');

  if (response.statusCode != 200)
  {
    return response.body;
  }

  // HTML Parser
  var document = parse(response.body);

  //List<Element> teamStatsBar = document.getElementsByClassName('flex flex-wrap large-flex-no-wrap row');
  // List<Element> teamStatsBar = document.getElementsByClassName('ul.flexflex-wraplarge-flex-no-wraprow > li.large-flex-item-1flexflex-columnflex-justify-centerflex-align-centerx-small-3columns');
  //
  // for (var i = 0; i < teamStatsBar.length; i++)
  //   {
  //     print(teamStatsBar[i]);
  //   }

  List<Element> links = document.querySelectorAll('div.sidearm-schedule-game-opponent-name > a');
  //List<Element> links = document.querySelectorAll('div.sidearm-common-promotion > section.sidearm-schedule-record > ul.flex flex-wrap');
  //List<Element> links = document.querySelectorAll('div.sidearm-common-promotion sidearm-common-promotion-below-header');
  List<Map<String, dynamic>> linkMap = [];

  for (var link in links)
  {
    linkMap.add(
        {
          // 'Match: ' : link.innerHtml,
          'Opponent: ' : link.attributes['aria-label'],
          'Link: ' : link.attributes['href'],
          // 'Element' : link.innerHtml,
        }
    );
  }

  print("MAP");
  print(linkMap.length);
  return json.encode(linkMap);
}