import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesforce/api/api.dart';
import 'package:salesforce/api/urls.dart';
import 'package:salesforce/providers/contact_provider.dart';
import 'package:salesforce/secrets/keys.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final API api = API();
  final ContactProvider contactProvider = ContactProvider();
  ContactBloc(ContactState initialState) : super(initialState);

  Stream<ContactState> _mapLoadContactsToState(LoadContacts event) async* {
    yield LoadingContacts();
    List contacts = List();
    var queryParameters = {
      'q': 'SELECT id, name, phone, email FROM Contact',
    };
    Uri uri = Uri(queryParameters: queryParameters);
    Map result = await api.get(URLs.baseURL + URLs.queryURL + "?" + uri.query, {
      HttpHeaders.authorizationHeader:
          "Bearer " + SecretKeys().secrets('access_token'),
    }) as Map;
    contacts = result['records'];
    yield ContactsLoaded(contacts);
  }

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is LoadContacts) {
      yield* _mapLoadContactsToState(event);
    }
  }
}
