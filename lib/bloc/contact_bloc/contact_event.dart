part of 'contact_bloc.dart';

abstract class ContactEvent {}

class LoadContacts extends ContactEvent {}

class SaveContact extends ContactEvent {
  final Map<String, dynamic> contactDetails;

  SaveContact(this.contactDetails);
}
