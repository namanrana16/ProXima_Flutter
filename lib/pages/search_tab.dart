import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_tab.dart';

import 'home_tab.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchQueryController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {});
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
    });
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text('Search');
  }

  Widget _buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        _stopSearching();
      },
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          _startSearch();
        },
      ),
    ];
  }

  Widget _buildBody() {
    return Center(
      child: Text('Search results go here.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ? _buildLeading(context) : null,
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
      ),
      body: _buildBody(),

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
            icon: Icon(Icons.settings),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (index == 2) {
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
