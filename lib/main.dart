import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pertemuan5(),
    );
  }
}

class Pertemuan5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar SilverAppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/download.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                      new Tab(icon: new Icon(Icons.playlist_add), text: "Playlist"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Songs(),
              Gallery(),
              Playlist()
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class Songs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Ayu - Devano Danendra"),
            trailing: Text("04.11"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Kisah Indah - Devano Danendra"),
            trailing: Text("04.39"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Merasa Indah - Tiara Andini"),
            trailing: Text("03.48"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Janji Setia - Tiara Andini"),
            trailing: Text("04.29"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Kuyakin Bahagia - Rey Mbayang"),
            trailing: Text("04.09"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Sempurnakan Hariku - Rey Mbayang"),
            trailing: Text("04.51"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Man Ana - Sabyan"),
            trailing: Text("04.19"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Bismillah - Sabyan"),
            trailing: Text("04.56"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Bersenyawa - DengarkanDia"),
            trailing: Text("03.32"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Rindu - DengarkanDia"),
            trailing: Text("03.44"),
          ),
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  final List images = [
    "assets/images/Ayu.jpg",
    "assets/images/Kisah Indah.jpg",
    "assets/images/Merasa Indah.jpg",
    "assets/images/Janji Setia.jpg",
    "assets/images/Kuyakin Bahagia.jpg",
    "assets/images/Sempurnakan Hariku.jpg",
    "assets/images/Bismillah.jpg",
    "assets/images/Man Ana.jpg",
    "assets/images/Bersenyawa.jpg",
    "assets/images/Rindu.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index > 0) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(images[index % 15]),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(images[index]),
            );
          }
        },
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text("Devano Danendra"),
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text("Tiara Andini"),
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text("Rey Mbayang"),
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text("Sabyan"),
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text("DengarkanDia"),
          ),
        ],
      ),
    );
  }
}
