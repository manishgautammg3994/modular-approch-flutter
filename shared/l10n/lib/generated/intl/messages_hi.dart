// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
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
  String get localeName => 'hi';

  static String m0(connectionType) => "जुड़ा हुआ: ${connectionType}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'कोई सेब नहीं', one: 'एक सेब', other: '${count} सेब')}";

  static String m2(gender, name) =>
      "${Intl.gender(gender, female: 'नमस्ते सुश्री. ${name}', male: 'नमस्ते श्री. ${name}', other: 'नमस्ते ${name}')}";

  static String m3(name) => "हमारे ऐप में आपका स्वागत है, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_app_option":
            MessageLookupByLibrary.simpleMessage("हमारे बारे में"),
        "account_suspended":
            MessageLookupByLibrary.simpleMessage("खाता बैन किया गया"),
        "app_maintenance":
            MessageLookupByLibrary.simpleMessage("ऐप रखरखाव में है"),
        "app_title": MessageLookupByLibrary.simpleMessage("स्थानीयकरण उदाहरण"),
        "app_version_info": MessageLookupByLibrary.simpleMessage("ऐप संस्करण"),
        "cancel_action": MessageLookupByLibrary.simpleMessage("रद्द करें"),
        "connection_issue":
            MessageLookupByLibrary.simpleMessage("जोड़ने में असमर्थ"),
        "contact_option": MessageLookupByLibrary.simpleMessage("संपर्क करें"),
        "current_date": MessageLookupByLibrary.simpleMessage(
            "आज की तारीख है {date, date, ::yMMMMd}"),
        "dark_mode_option": MessageLookupByLibrary.simpleMessage("डार्क मोड"),
        "delete_confirmation_message": MessageLookupByLibrary.simpleMessage(
            "क्या आप वाकई इसे हटाना चाहते हैं?"),
        "faq_option":
            MessageLookupByLibrary.simpleMessage("अक्सर पूछे जाने वाले प्रश्न"),
        "feedback_option": MessageLookupByLibrary.simpleMessage("फीडबैक"),
        "feedback_thanks_message":
            MessageLookupByLibrary.simpleMessage("फीडबैक के लिए धन्यवाद!"),
        "internet_connected": m0,
        "internet_disconnected":
            MessageLookupByLibrary.simpleMessage("जुड़ा नहीं है"),
        "language_change_option":
            MessageLookupByLibrary.simpleMessage("भाषा बदलें"),
        "light_mode_option": MessageLookupByLibrary.simpleMessage("लाइट मोड"),
        "loading_message":
            MessageLookupByLibrary.simpleMessage("लोड हो रहा है..."),
        "logout_action": MessageLookupByLibrary.simpleMessage("लॉग आउट"),
        "logout_confirmation_message": MessageLookupByLibrary.simpleMessage(
            "क्या आप वाकई लॉग आउट करना चाहते हैं?"),
        "maintenance_notice": MessageLookupByLibrary.simpleMessage(
            "हमारे सर्वर पर रखरखाव चल रहा है। कृपया कुछ समय बाद पुनः प्रयास करें।"),
        "no_internet_message":
            MessageLookupByLibrary.simpleMessage("कोई इंटरनेट कनेक्शन नहीं"),
        "number_of_apples": m1,
        "password_reset_request":
            MessageLookupByLibrary.simpleMessage("पासवर्ड रीसेट लिंक भेजें"),
        "price_display": MessageLookupByLibrary.simpleMessage(
            "कीमत {value, currency, ::currency/USD} है"),
        "proceed_button": MessageLookupByLibrary.simpleMessage("जारी रखें"),
        "rate_app_option":
            MessageLookupByLibrary.simpleMessage("हमें रेट करें"),
        "retry_action":
            MessageLookupByLibrary.simpleMessage("फिर से प्रयास करें"),
        "return_greeting":
            MessageLookupByLibrary.simpleMessage("वापसी पर स्वागत है"),
        "search_hint": MessageLookupByLibrary.simpleMessage("यहाँ खोजें..."),
        "session_expiry_message":
            MessageLookupByLibrary.simpleMessage("सत्र समाप्त हो गया"),
        "status_checking":
            MessageLookupByLibrary.simpleMessage("स्थिति की जांच कर रहे हैं"),
        "terms_option": MessageLookupByLibrary.simpleMessage("सेवा की शर्तें"),
        "update_available_message": MessageLookupByLibrary.simpleMessage(
            "एक नया अपडेट उपलब्ध है। कृपया ऐप को अपडेट करें।"),
        "user_greeting": m2,
        "vpn_restriction":
            MessageLookupByLibrary.simpleMessage("VPN अनुमत नहीं है"),
        "welcome_message": m3
      };
}
