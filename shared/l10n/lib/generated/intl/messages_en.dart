// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(connectionType) => "Connected: ${connectionType}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No apples', one: 'One apple', other: '${count} apples')}";

  static String m2(gender, name) =>
      "${Intl.gender(gender, female: 'Hello Ms. ${name}', male: 'Hello Mr. ${name}', other: 'Hello ${name}')}";

  static String m3(name) => "Welcome to our application, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_app_option": MessageLookupByLibrary.simpleMessage("About Us"),
        "account_suspended":
            MessageLookupByLibrary.simpleMessage("Account Banned"),
        "app_maintenance":
            MessageLookupByLibrary.simpleMessage("App Under Maintenance"),
        "app_title":
            MessageLookupByLibrary.simpleMessage("Localization Example"),
        "app_version_info": MessageLookupByLibrary.simpleMessage("App Version"),
        "cancel_action": MessageLookupByLibrary.simpleMessage("Cancel"),
        "connection_issue":
            MessageLookupByLibrary.simpleMessage("Unable to Connect"),
        "contact_option": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "current_date": MessageLookupByLibrary.simpleMessage(
            "Today\'s date is {date, date, ::yMMMMd}"),
        "dark_mode_option": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "delete_confirmation_message": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this?"),
        "faq_option": MessageLookupByLibrary.simpleMessage("FAQ"),
        "feedback_option": MessageLookupByLibrary.simpleMessage("Feedback"),
        "feedback_thanks_message": MessageLookupByLibrary.simpleMessage(
            "Thank you for your feedback!"),
        "internet_connected": m0,
        "internet_disconnected":
            MessageLookupByLibrary.simpleMessage("Not Connected"),
        "language_change_option":
            MessageLookupByLibrary.simpleMessage("Change Language"),
        "light_mode_option": MessageLookupByLibrary.simpleMessage("Light Mode"),
        "loading_message": MessageLookupByLibrary.simpleMessage("Loading..."),
        "logout_action": MessageLookupByLibrary.simpleMessage("Logout"),
        "logout_confirmation_message": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "maintenance_notice": MessageLookupByLibrary.simpleMessage(
            "Our servers are currently undergoing maintenance. Please try again later."),
        "no_internet_message":
            MessageLookupByLibrary.simpleMessage("No Internet Connection"),
        "number_of_apples": m1,
        "password_reset_request":
            MessageLookupByLibrary.simpleMessage("Send Password Reset Link"),
        "price_display": MessageLookupByLibrary.simpleMessage(
            "The price is {value, currency, ::currency/USD}"),
        "proceed_button": MessageLookupByLibrary.simpleMessage("Continue"),
        "rate_app_option": MessageLookupByLibrary.simpleMessage("Rate Us"),
        "retry_action": MessageLookupByLibrary.simpleMessage("Retry"),
        "return_greeting": MessageLookupByLibrary.simpleMessage("Welcome Back"),
        "search_hint": MessageLookupByLibrary.simpleMessage("Search here..."),
        "session_expiry_message":
            MessageLookupByLibrary.simpleMessage("Session Expired"),
        "status_checking":
            MessageLookupByLibrary.simpleMessage("Checking status"),
        "terms_option":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "update_available_message": MessageLookupByLibrary.simpleMessage(
            "A new update is available. Please update the app."),
        "user_greeting": m2,
        "vpn_restriction":
            MessageLookupByLibrary.simpleMessage("VPN Not Allowed"),
        "welcome_message": m3
      };
}
