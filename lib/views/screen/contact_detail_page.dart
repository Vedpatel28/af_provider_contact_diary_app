import 'package:af_provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:af_provider_contact_diary_app/views/modals/global_varibles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class detail_contact extends StatelessWidget {
  const detail_contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<MyStepper>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: allglobalvar.ListOfContact.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("${allglobalvar.ListOfContact[index].trname}"),
              subtitle: Text("${allglobalvar.ListOfContact[index].trcontact}"),
            ),
          ),
        ),
      ),
    );
  }
}
