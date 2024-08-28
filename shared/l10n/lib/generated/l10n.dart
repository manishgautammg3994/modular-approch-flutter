// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Localization Example`
  String get app_title {
    return Intl.message(
      'Localization Example',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `{gender, select, male{Hello Mr. {name}} female{Hello Ms. {name}} other{Hello {name}}}`
  String user_greeting(String gender, Object name) {
    return Intl.gender(
      gender,
      male: 'Hello Mr. $name',
      female: 'Hello Ms. $name',
      other: 'Hello $name',
      name: 'user_greeting',
      desc: 'Greeting message based on gender',
      args: [gender, name],
    );
  }

  /// `{count, plural, =0{No apples} =1{One apple} other{{count} apples}}`
  String number_of_apples(num count) {
    return Intl.plural(
      count,
      zero: 'No apples',
      one: 'One apple',
      other: '$count apples',
      name: 'number_of_apples',
      desc: 'Number of apples',
      args: [count],
    );
  }

  /// `The price is {value, currency, ::currency/USD}`
  String get price_display {
    return Intl.message(
      'The price is {value, currency, ::currency/USD}',
      name: 'price_display',
      desc: 'Price in USD',
      args: [],
    );
  }

  /// `Today's date is {date, date, ::yMMMMd}`
  String get current_date {
    return Intl.message(
      'Today\'s date is {date, date, ::yMMMMd}',
      name: 'current_date',
      desc: 'Formatted date',
      args: [],
    );
  }

  /// `Welcome to our application, {name}!`
  String welcome_message(Object name) {
    return Intl.message(
      'Welcome to our application, $name!',
      name: 'welcome_message',
      desc: 'Welcome message with name',
      args: [name],
    );
  }

  /// `Connected: {connectionType}`
  String internet_connected(Object connectionType) {
    return Intl.message(
      'Connected: $connectionType',
      name: 'internet_connected',
      desc:
          'Message shown when the app is connected to the internet. \'connectionType\' is the type of network connection (e.g., Wi-Fi, Mobile Data).',
      args: [connectionType],
    );
  }

  /// `Not Connected`
  String get internet_disconnected {
    return Intl.message(
      'Not Connected',
      name: 'internet_disconnected',
      desc: 'Message shown when the app is offline.',
      args: [],
    );
  }

  /// `VPN Not Allowed`
  String get vpn_restriction {
    return Intl.message(
      'VPN Not Allowed',
      name: 'vpn_restriction',
      desc: 'Message shown when the app is using VPN.',
      args: [],
    );
  }

  /// `Checking status`
  String get status_checking {
    return Intl.message(
      'Checking status',
      name: 'status_checking',
      desc:
          'Indicates that the app is checking the current status of the user\'s account or connection.',
      args: [],
    );
  }

  /// `Account Banned`
  String get account_suspended {
    return Intl.message(
      'Account Banned',
      name: 'account_suspended',
      desc: 'Message displayed when a user\'s account has been banned.',
      args: [],
    );
  }

  /// `Unable to Connect`
  String get connection_issue {
    return Intl.message(
      'Unable to Connect',
      name: 'connection_issue',
      desc:
          'Message displayed when the app is unable to establish a connection to the server.',
      args: [],
    );
  }

  /// `App Under Maintenance`
  String get app_maintenance {
    return Intl.message(
      'App Under Maintenance',
      name: 'app_maintenance',
      desc:
          'Message shown when the app is temporarily unavailable due to maintenance.',
      args: [],
    );
  }

  /// `Retry`
  String get retry_action {
    return Intl.message(
      'Retry',
      name: 'retry_action',
      desc: 'Button label used to retry an action after a failure.',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_action {
    return Intl.message(
      'Cancel',
      name: 'cancel_action',
      desc: 'Button label used to cancel an action.',
      args: [],
    );
  }

  /// `Logout`
  String get logout_action {
    return Intl.message(
      'Logout',
      name: 'logout_action',
      desc: 'Button label to log out from the app.',
      args: [],
    );
  }

  /// `Loading...`
  String get loading_message {
    return Intl.message(
      'Loading...',
      name: 'loading_message',
      desc: 'Displayed while content or data is being loaded.',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get no_internet_message {
    return Intl.message(
      'No Internet Connection',
      name: 'no_internet_message',
      desc: 'Message displayed when there is no internet connection available.',
      args: [],
    );
  }

  /// `Session Expired`
  String get session_expiry_message {
    return Intl.message(
      'Session Expired',
      name: 'session_expiry_message',
      desc:
          'Message displayed when the user\'s session has expired and they need to log in again.',
      args: [],
    );
  }

  /// `Welcome Back`
  String get return_greeting {
    return Intl.message(
      'Welcome Back',
      name: 'return_greeting',
      desc: 'Greeting message shown when a user returns to the app.',
      args: [],
    );
  }

  /// `Continue`
  String get proceed_button {
    return Intl.message(
      'Continue',
      name: 'proceed_button',
      desc: 'Button label to continue to the next step.',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode_option {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode_option',
      desc: 'Option to switch the app to dark mode.',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode_option {
    return Intl.message(
      'Light Mode',
      name: 'light_mode_option',
      desc: 'Option to switch the app to light mode.',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_confirmation_message {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_confirmation_message',
      desc: 'Confirmation message related to logging out.',
      args: [],
    );
  }

  /// `Are you sure you want to delete this?`
  String get delete_confirmation_message {
    return Intl.message(
      'Are you sure you want to delete this?',
      name: 'delete_confirmation_message',
      desc: 'Confirmation message for deleting an item.',
      args: [],
    );
  }

  /// `Change Language`
  String get language_change_option {
    return Intl.message(
      'Change Language',
      name: 'language_change_option',
      desc: 'Option to change the language of the app.',
      args: [],
    );
  }

  /// `Search here...`
  String get search_hint {
    return Intl.message(
      'Search here...',
      name: 'search_hint',
      desc: 'Placeholder text in the search bar to guide the user.',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback_option {
    return Intl.message(
      'Feedback',
      name: 'feedback_option',
      desc: 'Button label to provide feedback.',
      args: [],
    );
  }

  /// `Rate Us`
  String get rate_app_option {
    return Intl.message(
      'Rate Us',
      name: 'rate_app_option',
      desc: 'Button label to rate the app.',
      args: [],
    );
  }

  /// `App Version`
  String get app_version_info {
    return Intl.message(
      'App Version',
      name: 'app_version_info',
      desc: 'Label showing the current version of the app.',
      args: [],
    );
  }

  /// `About Us`
  String get about_app_option {
    return Intl.message(
      'About Us',
      name: 'about_app_option',
      desc: 'Link to information about the app or company.',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_option {
    return Intl.message(
      'Contact Us',
      name: 'contact_option',
      desc: 'Link to contact information.',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_option {
    return Intl.message(
      'Terms of Service',
      name: 'terms_option',
      desc: 'Link to the terms of service.',
      args: [],
    );
  }

  /// `FAQ`
  String get faq_option {
    return Intl.message(
      'FAQ',
      name: 'faq_option',
      desc: 'Link to frequently asked questions.',
      args: [],
    );
  }

  /// `Thank you for your feedback!`
  String get feedback_thanks_message {
    return Intl.message(
      'Thank you for your feedback!',
      name: 'feedback_thanks_message',
      desc: 'Message shown after feedback is submitted.',
      args: [],
    );
  }

  /// `Send Password Reset Link`
  String get password_reset_request {
    return Intl.message(
      'Send Password Reset Link',
      name: 'password_reset_request',
      desc: 'Button label to send a password reset link.',
      args: [],
    );
  }

  /// `A new update is available. Please update the app.`
  String get update_available_message {
    return Intl.message(
      'A new update is available. Please update the app.',
      name: 'update_available_message',
      desc: 'Message shown when a new update is available.',
      args: [],
    );
  }

  /// `Our servers are currently undergoing maintenance. Please try again later.`
  String get maintenance_notice {
    return Intl.message(
      'Our servers are currently undergoing maintenance. Please try again later.',
      name: 'maintenance_notice',
      desc: 'Message shown when the app is under maintenance.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
