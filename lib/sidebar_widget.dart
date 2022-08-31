import 'package:flutter/material.dart';
import 'package:sidebar_widget/favourites.dart';
import 'package:sidebar_widget/user_page.dart';

void main() {
  runApp(SidebarWidget());
}

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue.shade400,
      ),
      // have to add Draw properties for use sidebar
      // this will automatic add drawer icon

      //use endDrawer to set to right side
      //endDrawer: NavigationDrawer(),

      drawer: NavigationDrawer(),
    );
  }
}

// Create new Class for Draw
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        //can create any widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //build custom widget1 and have to create define
            //custom widget under Drawer()
            buildHeader(context),
            //build custom widget2 and have to create define
            //custom widget under Drawer()
            buildMenuItem(context),
          ],
        ),
      );
  //create custom widget1 with Container for Home menu
  Widget buildHeader(BuildContext context) => Material(
        color: Colors.green.shade500,
        child: Container(
          // use for get some space
          padding: EdgeInsets.only(
              // use this code for get screen size value for each screen
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24),
          child: Column(
            children: [
              //use InkWell to detect tap on CircleAvatar
              InkWell(
                onTap: () {
                  //close navigation draw before go to next page
                  Navigator.pop(context);

                  // use to navigate to another page
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserPage()));
                },
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/13786915?v=4'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ponganan Saensuk',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Joey@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
//create custom widget2 with Column for make list of menu
  //replace Column to Wrap for include some Vertical Space
  Widget buildMenuItem(BuildContext context) => Container(
        //add container again to add EdgeInsets.all for padding
        padding: const EdgeInsets.all(20),
        child: Wrap(
          //use this command to vertical space
          runSpacing: 15,
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const SidebarWidget())),
            ),
            ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text('Favourites'),
                onTap: () {
                  //close navigation draw before go to next page
                  Navigator.pop(context);

                  // use to navigate to another page
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Favourites()));
                }),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Update'),
              onTap: () {},
            ),
            //use Divider for underline or separate section
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notification'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ),
      );
}
