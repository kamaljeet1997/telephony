import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/appcolors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telephony Dashboard'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: DashboardCards()),
            Expanded(child: AgentSummaryTable()),
          ],
        ),
      ),
    );
  }
}
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _drawerItem('Overview', Icons.dashboard),
          _drawerItem('Profile', Icons.person),
          _drawerItem('Agent List', Icons.people),
          _drawerItem('Campaigns', Icons.campaign),
          _drawerItem('Extensions', Icons.extension),
          _drawerItem('Call Reports', Icons.receipt_long),
          _drawerItem('Lead Reports', Icons.leaderboard),
          _drawerItem('Block Number', Icons.block),
        ],
      ),
    );
  }

  ListTile _drawerItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if(title=="Profile"){
          UserProfileCard();
        }


      },
    );
  }
}
class UserProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 50, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              "User Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("User ID: 9999"),
            Divider(),
            Text("Email: user@example.com"),
            Text("Phone: +123456789"),
            Text("Timezone: Asia/Kolkata"),
          ],
        ),
      ),
    );
  }
}

class DashboardCards extends StatelessWidget {
  final List<Map<String, dynamic>> stats = [
    {'title': 'Total Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.ligt_blck.withOpacity(0.1), AppColors.blue_color],
    ),
    },
    {'title': 'Other Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},
    {'title': 'Answer Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},
    {'title': 'Cancel Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},
    {'title': 'Call Queue', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},
    {'title': 'Outbound Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},
    {'title': 'Inbound Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},
    {'title': 'Outbound Calls', 'value': '0', 'textColors':Colors.blue.shade700,'color': LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.off_white, Colors.blue.shade300],
    ),},

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.0
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){

            Get.toNamed(Routes.TOTALCALL,arguments:stats[index]['title'] );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: stats[index]['color'],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stats[index]['title'],
                    textAlign: TextAlign.start,
                    style: TextStyle(color: stats[index]['textColors'], fontSize: 16),
                  ),

                  Text(
                    stats[index]['value'],
                    style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AgentSummaryTable extends StatelessWidget {
  final List<Map<String, String>> agents = [
    {'name': 'Agent 1', 'status': 'Logout', 'calls': '0'},
    {'name': 'Agent 2', 'status': 'Logout', 'calls': '0'},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Agents Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView(
              children: agents.map((agent) {
                return ListTile(
                  title: Text(agent['name']!),
                  subtitle: Text('Status: ${agent['status']} | Calls: ${agent['calls']}'),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
