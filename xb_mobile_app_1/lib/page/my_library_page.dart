import 'package:flutter/material.dart';
import 'package:xbox_mobile_app_1/ui/tools/app_colors.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({super.key});

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}
  final List<Map<String, String>> games = [
    {
      "title": "Minecraft",
      "image": "assets/images/mc.jpg",
    },
    {
      "title": "Among Us",
      "image": "assets/images/aus.webp",
    },
    {
      "title": "Call of Duty",
      "image": "assets/images/cod6.png",
    },
    {
      "title": "Forza Motorsport",
      "image": "assets/images/forza.jpg",
    },
    {
      "title": "Expeditions",
      "image": "assets/images/expe.jpg",
    },
    {
      "title": "Skyrim",
      "image": "assets/images/sky.webp",
    },
    {
      "title": "Senuas Saga",
      "image": "assets/images/saga.jpg",
    },
    {
      "title": "Halo Infinite",
      "image": "assets/images/hal.jpg",
    },
    {
      "title": "Frostpunk 2",
      "image": "assets/images/fros.jpg",
    },
    {
      "title": "ARK",
      "image": "assets/images/ark.jpg",
    },
    {
      "title": "Starfield",
      "image": "assets/images/star.jpg",
    },
    {
      "title": "Golf With Your Friends",
      "image": "assets/images/golf.jpg",
    },
    {
      "title": "Fallout 4",
      "image": "assets/images/fallo.jpg",
    },
    {
      "title": "Gang Beasts",
      "image": "assets/images/gang.jpg",
    },
    {
      "title": "Crash Trilogy",
      "image": "assets/images/crash.jpg",
    },
  ];

  class _MyLibraryPageState extends State<MyLibraryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
  super.initState();
  _tabController = TabController(length: 3, vsync: this);
  _tabController.index = 1;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/gamer.png"),
              radius: 18,
            ),
            const SizedBox(width: 12),
            const Text(
              "My library",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Captures"),
            Tab(text: "Games"),
            Tab(text: "Consoles"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${games.length} games",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list, color: Colors.white),
                        label: const Text("Filters", style: TextStyle(color: Colors.white)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sort, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: games.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final game = games[index];
                  return GridTile(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(game["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    footer: Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.black54,
                      child: Text(
                        game["title"]!,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/logos/home.png",
              width: 40,
              height: 40,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/logos/people.png",
              width: 40,
              height: 40,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/logos/search.png",
              width: 40,
              height: 40,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/logos/lib.png",
              width: 40,
              height: 40,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/logos/game.png",
              width: 44,
              height: 44,
              color: Colors.grey,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}