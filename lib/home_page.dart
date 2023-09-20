import 'package:flutter/material.dart';
import 'package:navigation_drawer/contacts.dart';
import 'package:navigation_drawer/dashboard.dart';
import 'package:navigation_drawer/event.dart';
import 'package:navigation_drawer/my_header_drawer.dart';
import 'package:navigation_drawer/notes.dart';
import 'package:navigation_drawer/notification.dart';
import 'package:navigation_drawer/privacy_policy.dart';
import 'package:navigation_drawer/send_feedback.dart';
import 'package:navigation_drawer/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSections.dashboard){
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts){
      container = Contactspage();
    } else if (currentPage == DrawerSections.event){
      container = EventPage();
    } else if (currentPage == DrawerSections.notes){
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings){
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications){
      container = NotificationPage();
    } else if (currentPage == DrawerSections.privacy_policy){
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback){
      container = SendFeedbackPage();
    } 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: Text("GP VTS"),
      ),
      body: container, 
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*-----Widget Menu ----- */
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.dashboard_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Event", Icons.dashboard_outlined,
              currentPage == DrawerSections.event ? true : false),
          menuItem(4, "Notes", Icons.dashboard_outlined,
              currentPage == DrawerSections.notes ? true : false),
          menuItem(5, "Settings", Icons.dashboard_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.dashboard_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          menuItem(7, "Privacy Policy", Icons.dashboard_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send Feedback", Icons.dashboard_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
              if (id == 1) {
            currentPage = DrawerSections.dashboard;
          } else if (id == 2) {
            currentPage = DrawerSections.contacts;
          } else if (id == 3) {
            currentPage = DrawerSections.event;
          } else if (id == 4) {
            currentPage = DrawerSections.notes;
          } else if (id == 5) {
            currentPage = DrawerSections.settings;
          } else if (id == 6) {
            currentPage = DrawerSections.notifications;
          } else if (id == 7) {
            currentPage = DrawerSections.privacy_policy;
          } else if (id == 8) {
            currentPage = DrawerSections.send_feedback;
          }
          });
          print("Selecteed");
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  event,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
