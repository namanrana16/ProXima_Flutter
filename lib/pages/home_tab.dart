import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_tab.dart';
import 'package:flutter_application_1/pages/search_tab.dart';
import 'package:flutter_application_1/widgets/card.dart';

class MyHomePage extends StatelessWidget {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions =
  <Widget>[    MyHomePage(),    SearchPage(),    ProfilePage(key: Key("key"), name: "name"),  ];


  final List<Map<String, String>> cardData = [    {      'title': 'Card 1',      'subtitle': 'This is the subtitle for card 1.',    },    {      'title': 'Card 2',      'subtitle': 'This is the subtitle for card 2.',    },    {      'title': 'Card 3',      'subtitle': 'This is the subtitle for card 3.',    },    {      'title': 'Card 4',      'subtitle': 'This is the subtitle for card 4.',    },    {      'title': 'Card 5',      'subtitle': 'This is the subtitle for card 5.',    },  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),



      body: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (BuildContext context, int index) {
          return   MySplitCardWidget();/*Card(
            child: ListTile(
              title: Text(cardData[index]['title']!),
              subtitle: Text(cardData[index]['subtitle']!),
            ),
          );*/
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the initial tab index to the Home tab.
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          // Handle tab changes.
          if (index == 0) {
            // Navigate to the home page.

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          } else if (index == 1) {
            currentIndex: 1;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (index == 2) {
            currentIndex: 2;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(key:Key("key") ,name: "name")),
            );
          }
        },
      ),
    );
  }
}
