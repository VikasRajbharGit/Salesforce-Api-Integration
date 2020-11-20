part of 'contact_bloc.dart';

abstract class ContactState {}

class ContactUninitialized extends ContactState {}

class LoadingContacts extends ContactState {}

class ContactsLoaded extends ContactState {
  final List contacts;

  ContactsLoaded(this.contacts);
}

class SavingContact extends ContactState {}

class ContactSaved extends ContactState {}
