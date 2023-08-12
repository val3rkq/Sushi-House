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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `The Taste of Japanese Food`
  String get the_taste_of_japanese_food {
    return Intl.message(
      'The Taste of Japanese Food',
      name: 'the_taste_of_japanese_food',
      desc: '',
      args: [],
    );
  }

  /// `Feel the taste of most popular Japanese foods from anywhere and anytime`
  String get feel_the_taste_text {
    return Intl.message(
      'Feel the taste of most popular Japanese foods from anywhere and anytime',
      name: 'feel_the_taste_text',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message(
      'Get Started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Get 70% promo`
  String get get_promo {
    return Intl.message(
      'Get 70% promo',
      name: 'get_promo',
      desc: '',
      args: [],
    );
  }

  /// `Try now`
  String get try_now {
    return Intl.message(
      'Try now',
      name: 'try_now',
      desc: '',
      args: [],
    );
  }

  /// `Popular Food`
  String get popular_food {
    return Intl.message(
      'Popular Food',
      name: 'popular_food',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buy_now {
    return Intl.message(
      'Buy Now',
      name: 'buy_now',
      desc: '',
      args: [],
    );
  }

  /// `History Of Orders`
  String get history_of_orders {
    return Intl.message(
      'History Of Orders',
      name: 'history_of_orders',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure ?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure ?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get no {
    return Intl.message(
      'NO',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get yes {
    return Intl.message(
      'YES',
      name: 'yes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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