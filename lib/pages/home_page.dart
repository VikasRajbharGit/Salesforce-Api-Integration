import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:salesforce/bloc/contact_bloc/contact_bloc.dart';
import 'package:salesforce/pages/contact_detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        leading: Icon(Icons.cloud),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactsLoaded) {
            return ListView.builder(
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 4.0),
                  child: GFListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ContactDetailPage(
                              id: state.contacts[index]['Id']),
                        ),
                      );
                    },
                    title: Text(state.contacts[index]['Name'] ?? ""),
                    avatar: Icon(
                      Icons.account_circle,
                      size: 36.0,
                    ),
                    subtitle: Text(state.contacts[index]['Phone'] ?? ""),
                  ),
                );
              },
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text("Loading Contacts from Salesforce Org"),
                ),
                GFLoader(
                  type: GFLoaderType.circle,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
