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
  String get title {
    return Intl.message(
      'Localization Example',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `{gender, select, male{Hello Mr. {name}} female{Hello Ms. {name}} other{Hello {name}}}`
  String greeting(String gender, Object name) {
    return Intl.gender(
      gender,
      male: 'Hello Mr. $name',
      female: 'Hello Ms. $name',
      other: 'Hello $name',
      name: 'greeting',
      desc: 'Greeting message based on gender',
      args: [gender, name],
    );
  }

  /// `{count, plural, =0{No apples} =1{One apple} other{{count} apples}}`
  String apples(num count) {
    return Intl.plural(
      count,
      zero: 'No apples',
      one: 'One apple',
      other: '$count apples',
      name: 'apples',
      desc: 'Number of apples',
      args: [count],
    );
  }

  /// `The price is {value, currency, ::currency/USD}`
  String get price {
    return Intl.message(
      'The price is {value, currency, ::currency/USD}',
      name: 'price',
      desc: 'Price in USD',
      args: [],
    );
  }

  /// `Today's date is {date, date, ::yMMMMd}`
  String get date {
    return Intl.message(
      'Today\'s date is {date, date, ::yMMMMd}',
      name: 'date',
      desc: 'Formatted date',
      args: [],
    );
  }

  /// `Welcome to our application, {name}!`
  String welcome(Object name) {
    return Intl.message(
      'Welcome to our application, $name!',
      name: 'welcome',
      desc: 'Welcome message with name',
      args: [name],
    );
  }

  /// `Connected: {connectionType}`
  String connected(Object connectionType) {
    return Intl.message(
      'Connected: $connectionType',
      name: 'connected',
      desc:
          'Message shown when the app is connected to the internet. \'connectionType\' is the type of network connection (e.g., Wi-Fi, Mobile Data).',
      args: [connectionType],
    );
  }

  /// `Not Connected`
  String get notConnected {
    return Intl.message(
      'Not Connected',
      name: 'notConnected',
      desc: 'Message shown when the app is offline.',
      args: [],
    );
  }

  /// `VPN Not Allowed`
  String get VPNnotAllowed {
    return Intl.message(
      'VPN Not Allowed',
      name: 'VPNnotAllowed',
      desc: 'Message shown when the app is Using VPN.',
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
