import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:salesforce/bloc/contact_bloc/contact_bloc.dart';

class ContactDetailPage extends StatelessWidget {
  final String id;

  const ContactDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Details"),
      ),
      body: FutureBuilder(
        initialData: {},
        future: BlocProvider.of<ContactBloc>(context)
            .contactProvider
            .fetchContactById(id),
        builder: (context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data == {}) {
                return Center(
                  child: Text("There's no record associated"),
                );
              }

              snapshot.data.remove('attributes');

              return ListView(
                  children: snapshot.data.entries.where((element) => element.value != null)
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 8.0),
                          child: TextFormField(
                            enabled: false,
                            initialValue: e.key == "MailingAddress" ? e.value['street'] : e.value.toString(),
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: e.key.toString(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                          ),
                        ),
                      )
                      .toList());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Oops! Some Error Occured"),
              );
            }
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Loading Details"),
                ),
                GFLoader(
                  type: GFLoaderType.circle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
