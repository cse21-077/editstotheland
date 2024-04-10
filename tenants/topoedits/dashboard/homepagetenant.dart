import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landlord/pages/chat_screen/chat_line.dart';
import 'package:landlord/pages/chat_screen/chat_room.dart';
import 'package:landlord/pages/chat_screen/conversation_screen.dart';
import 'package:landlord/pages/tenants/due_payment/view/due_payment_page.dart';
import 'package:landlord/pages/tenants/tickets/tickets.dart';
import 'package:landlord/pages/tenants/topoedits/dashboard/constanttenants.dart';
import 'package:landlord/pages/tenants/topoedits/dashboard/model.dart';



class MyHomePageTenant extends StatefulWidget {
  const MyHomePageTenant({super.key});

  @override
  _MyHomePageTenantState createState() => _MyHomePageTenantState();
}

class _MyHomePageTenantState extends State<MyHomePageTenant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        children: [
          const Text(
            "Hey Tenant03,",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Welcome to your dashboard area",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          // for search bar
          searchBar(),
          const SizedBox(height: 35),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listingOne.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                            onTap: () {
                              switch (listingOne[index]['title']) {
                                case 'Pay':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DuePaymentPage()),
                                  );
                                  break;
                                case 'Chat':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ChatConversation()),
                                  );
        break;
      // Add cases for other functionalities here
    }
  },
  child: availableCourses(context, index),
);

                    }),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listingTwo.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
  onTap: () {
    switch (listingTwo[index]['title']) {
      case 'Requests':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tickets()),
        );
        break;
      case 'Documents':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tickets()),
        );
        break;
      // Add cases for other functionalities here
    }
  },
  child: availableCoursesTwo(context, index),
);

                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding availableCourses(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    listingOne[index]['img'],
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listingOne[index]['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  listingOne[index]['courses'],
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding availableCoursesTwo(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    listingTwo[index]['img'],
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listingTwo[index]['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  listingTwo[index]['courses'],
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for anything",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.25),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                )),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "images/burger_icon.svg",
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('images/sw.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}