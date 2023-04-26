import 'package:flutter/material.dart';

class SquareKotak extends StatefulWidget {
  const SquareKotak({Key? key}) : super(key: key);

  @override
  State<SquareKotak> createState() => _SquareKotakState();
}

class _SquareKotakState extends State<SquareKotak> {

  final List<Widget> _screens = [
    // Content for Home tab
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Feed tab
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text(
        'Feed',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text(
        'User',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text(
        'Favorites',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kotak"),
      ),
      bottomNavigationBar:  MediaQuery.of(context).size.width < 640?
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.red,
              // called when one tab is selected
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              // bottom tab items
              items:[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.feed), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 40,), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: '')
              ]),
        ),
      ):null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)

            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                child: NavigationRail(
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedIndex: _selectedIndex,
                  destinations: const [
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text('')),
                    NavigationRailDestination(
                        icon: Icon(Icons.feed), label: Text('')),
                    NavigationRailDestination(
                        icon: Icon(Icons.favorite), label: Text('')),
                    NavigationRailDestination(
                        icon: Icon(Icons.settings), label: Text('')),
                  ],
                  labelType: NavigationRailLabelType.all,
                  selectedLabelTextStyle: const TextStyle(
                    color: Colors.teal,
                  ),
                  unselectedLabelTextStyle: const TextStyle(),
                  // Called when one tab is selected
                  trailing: Column(
                    children: const [
                      SizedBox(
                        height: 8,
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person),
                      ),
                    ],
                  ),

                ),
              ),
            ),

          Expanded(child: _screens[_selectedIndex])
        ],
      ),
    );
  }
}
