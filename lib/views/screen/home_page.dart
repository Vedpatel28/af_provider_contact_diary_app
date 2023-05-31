import 'package:af_provider_contact_diary_app/controllers/theme_changer_controller.dart';
import 'package:af_provider_contact_diary_app/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<Themechanger>(context, listen: false).changetheme();
            },
            icon: Icon(
              size: 25,
              Provider.of<Themechanger>(context).themechange
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            onSelected: (val) async {
              if (val == allroutes.HiddenContactPage) {
                LocalAuthentication auth = LocalAuthentication();

                bool done = await auth.authenticate(
                  localizedReason: "Open hidden contacts !!",
                );

                if (done) {
                  Navigator.of(context).pushNamed(allroutes.HiddenContactPage);
                }
              } else {
                Navigator.of(context).pushNamed(val);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: allroutes.AddContactPage,
                child: const Text("Add Contact Page"),
              ),
              PopupMenuItem(
                value: allroutes.HiddenContactPage,
                child: const Text("Hidden Contact Pag"),
              ),
            ],
          ),
        ],
      ),

      // body: Center(child: Column(
      //   children: [
      //    Text("${Provider.of<MyStepper>(context).allcontct[1]}"),
      //    Text("${Provider.of<MyStepper>(context).contact}"),
      //    Text("${Provider.of<MyStepper>(context).email}"),
      //   ],
      // )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(allroutes.AddContactPage);
        },
        child: const Icon(
          Icons.navigate_next_rounded,
        ),
      ),
    );
  }
}
