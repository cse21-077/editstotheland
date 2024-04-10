import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landlord/pages/landlord/tedits/widgets/mainrequest.dart';
import 'package:landlord/pages/landlord/tedits/widgets/optionstab.dart';
import 'package:landlord/pages/landlord/tedits/widgets/upcoming_card.dart';

class HomePageLandy extends StatelessWidget {
  const HomePageLandy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Landlord"),
            Text(
              "How can we assit you today?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.people_circle_outline),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const LandlordCard(),
          const SizedBox(height: 20),
          Text(
            "Category",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const OptionsTab(),
          const SizedBox(height: 25),
          Text(
            "Maintenace Requests",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const MaintenaceReq(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            activeIcon: Icon(Ionicons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            activeIcon: Icon(Ionicons.calendar),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbubble_ellipses_outline),
            label: "Home",
            activeIcon: Icon(Ionicons.chatbubble_ellipses),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            activeIcon: Icon(Ionicons.person),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
