import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'timezones_localizations_en.dart';
import 'timezones_localizations_es.dart';
import 'timezones_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of TimezonesLocalizations
/// returned by `TimezonesLocalizations.of(context)`.
///
/// Applications need to include `TimezonesLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'timezones/timezones_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TimezonesLocalizations.localizationsDelegates,
///   supportedLocales: TimezonesLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the TimezonesLocalizations.supportedLocales
/// property.
abstract class TimezonesLocalizations {
  TimezonesLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TimezonesLocalizations? of(BuildContext context) {
    return Localizations.of<TimezonesLocalizations>(
      context,
      TimezonesLocalizations,
    );
  }

  static const LocalizationsDelegate<TimezonesLocalizations> delegate =
      _TimezonesLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// Timezone system
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Timezone translation for africa_abidjan
  ///
  /// In en, this message translates to:
  /// **'Africa / Abidjan'**
  String get africa_abidjan;

  /// Timezone translation for africa_algiers
  ///
  /// In en, this message translates to:
  /// **'Africa / Algiers'**
  String get africa_algiers;

  /// Timezone translation for africa_bissau
  ///
  /// In en, this message translates to:
  /// **'Africa / Bissau'**
  String get africa_bissau;

  /// Timezone translation for africa_cairo
  ///
  /// In en, this message translates to:
  /// **'Africa / Cairo'**
  String get africa_cairo;

  /// Timezone translation for africa_casablanca
  ///
  /// In en, this message translates to:
  /// **'Africa / Casablanca'**
  String get africa_casablanca;

  /// Timezone translation for africa_ceuta
  ///
  /// In en, this message translates to:
  /// **'Africa / Ceuta'**
  String get africa_ceuta;

  /// Timezone translation for africa_el_aaiun
  ///
  /// In en, this message translates to:
  /// **'Africa / El Aaiun'**
  String get africa_el_aaiun;

  /// Timezone translation for africa_johannesburg
  ///
  /// In en, this message translates to:
  /// **'Africa / Johannesburg'**
  String get africa_johannesburg;

  /// Timezone translation for africa_juba
  ///
  /// In en, this message translates to:
  /// **'Africa / Juba'**
  String get africa_juba;

  /// Timezone translation for africa_khartoum
  ///
  /// In en, this message translates to:
  /// **'Africa / Khartoum'**
  String get africa_khartoum;

  /// Timezone translation for africa_lagos
  ///
  /// In en, this message translates to:
  /// **'Africa / Lagos'**
  String get africa_lagos;

  /// Timezone translation for africa_maputo
  ///
  /// In en, this message translates to:
  /// **'Africa / Maputo'**
  String get africa_maputo;

  /// Timezone translation for africa_monrovia
  ///
  /// In en, this message translates to:
  /// **'Africa / Monrovia'**
  String get africa_monrovia;

  /// Timezone translation for africa_nairobi
  ///
  /// In en, this message translates to:
  /// **'Africa / Nairobi'**
  String get africa_nairobi;

  /// Timezone translation for africa_ndjamena
  ///
  /// In en, this message translates to:
  /// **'Africa / Ndjamena'**
  String get africa_ndjamena;

  /// Timezone translation for africa_sao_tome
  ///
  /// In en, this message translates to:
  /// **'Africa / Sao Tome'**
  String get africa_sao_tome;

  /// Timezone translation for africa_tripoli
  ///
  /// In en, this message translates to:
  /// **'Africa / Tripoli'**
  String get africa_tripoli;

  /// Timezone translation for africa_tunis
  ///
  /// In en, this message translates to:
  /// **'Africa / Tunis'**
  String get africa_tunis;

  /// Timezone translation for africa_windhoek
  ///
  /// In en, this message translates to:
  /// **'Africa / Windhoek'**
  String get africa_windhoek;

  /// Timezone translation for africa_accra
  ///
  /// In en, this message translates to:
  /// **'Africa / Accra'**
  String get africa_accra;

  /// Timezone translation for africa_addis_ababa
  ///
  /// In en, this message translates to:
  /// **'Africa / Addis Ababa'**
  String get africa_addis_ababa;

  /// Timezone translation for africa_asmara
  ///
  /// In en, this message translates to:
  /// **'Africa / Asmara'**
  String get africa_asmara;

  /// Timezone translation for africa_asmera
  ///
  /// In en, this message translates to:
  /// **'Africa / Asmera'**
  String get africa_asmera;

  /// Timezone translation for africa_bamako
  ///
  /// In en, this message translates to:
  /// **'Africa / Bamako'**
  String get africa_bamako;

  /// Timezone translation for africa_bangui
  ///
  /// In en, this message translates to:
  /// **'Africa / Bangui'**
  String get africa_bangui;

  /// Timezone translation for africa_banjul
  ///
  /// In en, this message translates to:
  /// **'Africa / Banjul'**
  String get africa_banjul;

  /// Timezone translation for africa_blantyre
  ///
  /// In en, this message translates to:
  /// **'Africa / Blantyre'**
  String get africa_blantyre;

  /// Timezone translation for africa_brazzaville
  ///
  /// In en, this message translates to:
  /// **'Africa / Brazzaville'**
  String get africa_brazzaville;

  /// Timezone translation for africa_bujumbura
  ///
  /// In en, this message translates to:
  /// **'Africa / Bujumbura'**
  String get africa_bujumbura;

  /// Timezone translation for africa_conakry
  ///
  /// In en, this message translates to:
  /// **'Africa / Conakry'**
  String get africa_conakry;

  /// Timezone translation for africa_dakar
  ///
  /// In en, this message translates to:
  /// **'Africa / Dakar'**
  String get africa_dakar;

  /// Timezone translation for africa_dar_es_salaam
  ///
  /// In en, this message translates to:
  /// **'Africa / Dar es Salaam'**
  String get africa_dar_es_salaam;

  /// Timezone translation for africa_djibouti
  ///
  /// In en, this message translates to:
  /// **'Africa / Djibouti'**
  String get africa_djibouti;

  /// Timezone translation for africa_douala
  ///
  /// In en, this message translates to:
  /// **'Africa / Douala'**
  String get africa_douala;

  /// Timezone translation for africa_freetown
  ///
  /// In en, this message translates to:
  /// **'Africa / Freetown'**
  String get africa_freetown;

  /// Timezone translation for africa_gaborone
  ///
  /// In en, this message translates to:
  /// **'Africa / Gaborone'**
  String get africa_gaborone;

  /// Timezone translation for africa_harare
  ///
  /// In en, this message translates to:
  /// **'Africa / Harare'**
  String get africa_harare;

  /// Timezone translation for africa_kampala
  ///
  /// In en, this message translates to:
  /// **'Africa / Kampala'**
  String get africa_kampala;

  /// Timezone translation for africa_kigali
  ///
  /// In en, this message translates to:
  /// **'Africa / Kigali'**
  String get africa_kigali;

  /// Timezone translation for africa_kinshasa
  ///
  /// In en, this message translates to:
  /// **'Africa / Kinshasa'**
  String get africa_kinshasa;

  /// Timezone translation for africa_libreville
  ///
  /// In en, this message translates to:
  /// **'Africa / Libreville'**
  String get africa_libreville;

  /// Timezone translation for africa_lome
  ///
  /// In en, this message translates to:
  /// **'Africa / Lome'**
  String get africa_lome;

  /// Timezone translation for africa_luanda
  ///
  /// In en, this message translates to:
  /// **'Africa / Luanda'**
  String get africa_luanda;

  /// Timezone translation for africa_lubumbashi
  ///
  /// In en, this message translates to:
  /// **'Africa / Lubumbashi'**
  String get africa_lubumbashi;

  /// Timezone translation for africa_lusaka
  ///
  /// In en, this message translates to:
  /// **'Africa / Lusaka'**
  String get africa_lusaka;

  /// Timezone translation for africa_malabo
  ///
  /// In en, this message translates to:
  /// **'Africa / Malabo'**
  String get africa_malabo;

  /// Timezone translation for africa_maseru
  ///
  /// In en, this message translates to:
  /// **'Africa / Maseru'**
  String get africa_maseru;

  /// Timezone translation for africa_mbabane
  ///
  /// In en, this message translates to:
  /// **'Africa / Mbabane'**
  String get africa_mbabane;

  /// Timezone translation for africa_mogadishu
  ///
  /// In en, this message translates to:
  /// **'Africa / Mogadishu'**
  String get africa_mogadishu;

  /// Timezone translation for africa_niamey
  ///
  /// In en, this message translates to:
  /// **'Africa / Niamey'**
  String get africa_niamey;

  /// Timezone translation for africa_nouakchott
  ///
  /// In en, this message translates to:
  /// **'Africa / Nouakchott'**
  String get africa_nouakchott;

  /// Timezone translation for africa_ouagadougou
  ///
  /// In en, this message translates to:
  /// **'Africa / Ouagadougou'**
  String get africa_ouagadougou;

  /// Timezone translation for africa_porto_novo
  ///
  /// In en, this message translates to:
  /// **'Africa / Porto-Novo'**
  String get africa_porto_novo;

  /// Timezone translation for africa_timbuktu
  ///
  /// In en, this message translates to:
  /// **'Africa / Timbuktu'**
  String get africa_timbuktu;

  /// Timezone translation for america_adak
  ///
  /// In en, this message translates to:
  /// **'America / Adak'**
  String get america_adak;

  /// Timezone translation for america_anchorage
  ///
  /// In en, this message translates to:
  /// **'America / Anchorage'**
  String get america_anchorage;

  /// Timezone translation for america_araguaina
  ///
  /// In en, this message translates to:
  /// **'America / Araguaina'**
  String get america_araguaina;

  /// Timezone translation for america_argentina_buenos_aires
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Buenos Aires'**
  String get america_argentina_buenos_aires;

  /// Timezone translation for america_argentina_catamarca
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Catamarca'**
  String get america_argentina_catamarca;

  /// Timezone translation for america_argentina_cordoba
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Cordoba'**
  String get america_argentina_cordoba;

  /// Timezone translation for america_argentina_jujuy
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Jujuy'**
  String get america_argentina_jujuy;

  /// Timezone translation for america_argentina_la_rioja
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / La Rioja'**
  String get america_argentina_la_rioja;

  /// Timezone translation for america_argentina_mendoza
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Mendoza'**
  String get america_argentina_mendoza;

  /// Timezone translation for america_argentina_rio_gallegos
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Rio Gallegos'**
  String get america_argentina_rio_gallegos;

  /// Timezone translation for america_argentina_salta
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Salta'**
  String get america_argentina_salta;

  /// Timezone translation for america_argentina_san_juan
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / San Juan'**
  String get america_argentina_san_juan;

  /// Timezone translation for america_argentina_san_luis
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / San Luis'**
  String get america_argentina_san_luis;

  /// Timezone translation for america_argentina_tucuman
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Tucuman'**
  String get america_argentina_tucuman;

  /// Timezone translation for america_argentina_ushuaia
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Ushuaia'**
  String get america_argentina_ushuaia;

  /// Timezone translation for america_asuncion
  ///
  /// In en, this message translates to:
  /// **'America / Asuncion'**
  String get america_asuncion;

  /// Timezone translation for america_bahia
  ///
  /// In en, this message translates to:
  /// **'America / Bahia'**
  String get america_bahia;

  /// Timezone translation for america_bahia_banderas
  ///
  /// In en, this message translates to:
  /// **'America / Bahia Banderas'**
  String get america_bahia_banderas;

  /// Timezone translation for america_barbados
  ///
  /// In en, this message translates to:
  /// **'America / Barbados'**
  String get america_barbados;

  /// Timezone translation for america_belem
  ///
  /// In en, this message translates to:
  /// **'America / Belem'**
  String get america_belem;

  /// Timezone translation for america_belize
  ///
  /// In en, this message translates to:
  /// **'America / Belize'**
  String get america_belize;

  /// Timezone translation for america_boa_vista
  ///
  /// In en, this message translates to:
  /// **'America / Boa Vista'**
  String get america_boa_vista;

  /// Timezone translation for america_bogota
  ///
  /// In en, this message translates to:
  /// **'America / Bogota'**
  String get america_bogota;

  /// Timezone translation for america_boise
  ///
  /// In en, this message translates to:
  /// **'America / Boise'**
  String get america_boise;

  /// Timezone translation for america_cambridge_bay
  ///
  /// In en, this message translates to:
  /// **'America / Cambridge Bay'**
  String get america_cambridge_bay;

  /// Timezone translation for america_campo_grande
  ///
  /// In en, this message translates to:
  /// **'America / Campo Grande'**
  String get america_campo_grande;

  /// Timezone translation for america_cancun
  ///
  /// In en, this message translates to:
  /// **'America / Cancun'**
  String get america_cancun;

  /// Timezone translation for america_caracas
  ///
  /// In en, this message translates to:
  /// **'America / Caracas'**
  String get america_caracas;

  /// Timezone translation for america_cayenne
  ///
  /// In en, this message translates to:
  /// **'America / Cayenne'**
  String get america_cayenne;

  /// Timezone translation for america_chicago
  ///
  /// In en, this message translates to:
  /// **'America / Chicago'**
  String get america_chicago;

  /// Timezone translation for america_chihuahua
  ///
  /// In en, this message translates to:
  /// **'America / Chihuahua'**
  String get america_chihuahua;

  /// Timezone translation for america_ciudad_juarez
  ///
  /// In en, this message translates to:
  /// **'America / Ciudad Juarez'**
  String get america_ciudad_juarez;

  /// Timezone translation for america_costa_rica
  ///
  /// In en, this message translates to:
  /// **'America / Costa Rica'**
  String get america_costa_rica;

  /// Timezone translation for america_coyhaique
  ///
  /// In en, this message translates to:
  /// **'America / Coyhaique'**
  String get america_coyhaique;

  /// Timezone translation for america_cuiaba
  ///
  /// In en, this message translates to:
  /// **'America / Cuiaba'**
  String get america_cuiaba;

  /// Timezone translation for america_danmarkshavn
  ///
  /// In en, this message translates to:
  /// **'America / Danmarkshavn'**
  String get america_danmarkshavn;

  /// Timezone translation for america_dawson
  ///
  /// In en, this message translates to:
  /// **'America / Dawson'**
  String get america_dawson;

  /// Timezone translation for america_dawson_creek
  ///
  /// In en, this message translates to:
  /// **'America / Dawson Creek'**
  String get america_dawson_creek;

  /// Timezone translation for america_denver
  ///
  /// In en, this message translates to:
  /// **'America / Denver'**
  String get america_denver;

  /// Timezone translation for america_detroit
  ///
  /// In en, this message translates to:
  /// **'America / Detroit'**
  String get america_detroit;

  /// Timezone translation for america_edmonton
  ///
  /// In en, this message translates to:
  /// **'America / Edmonton'**
  String get america_edmonton;

  /// Timezone translation for america_eirunepe
  ///
  /// In en, this message translates to:
  /// **'America / Eirunepe'**
  String get america_eirunepe;

  /// Timezone translation for america_el_salvador
  ///
  /// In en, this message translates to:
  /// **'America / El Salvador'**
  String get america_el_salvador;

  /// Timezone translation for america_fort_nelson
  ///
  /// In en, this message translates to:
  /// **'America / Fort Nelson'**
  String get america_fort_nelson;

  /// Timezone translation for america_fortaleza
  ///
  /// In en, this message translates to:
  /// **'America / Fortaleza'**
  String get america_fortaleza;

  /// Timezone translation for america_glace_bay
  ///
  /// In en, this message translates to:
  /// **'America / Glace Bay'**
  String get america_glace_bay;

  /// Timezone translation for america_goose_bay
  ///
  /// In en, this message translates to:
  /// **'America / Goose Bay'**
  String get america_goose_bay;

  /// Timezone translation for america_grand_turk
  ///
  /// In en, this message translates to:
  /// **'America / Grand Turk'**
  String get america_grand_turk;

  /// Timezone translation for america_guatemala
  ///
  /// In en, this message translates to:
  /// **'America / Guatemala'**
  String get america_guatemala;

  /// Timezone translation for america_guayaquil
  ///
  /// In en, this message translates to:
  /// **'America / Guayaquil'**
  String get america_guayaquil;

  /// Timezone translation for america_guyana
  ///
  /// In en, this message translates to:
  /// **'America / Guyana'**
  String get america_guyana;

  /// Timezone translation for america_halifax
  ///
  /// In en, this message translates to:
  /// **'America / Halifax'**
  String get america_halifax;

  /// Timezone translation for america_havana
  ///
  /// In en, this message translates to:
  /// **'America / Havana'**
  String get america_havana;

  /// Timezone translation for america_hermosillo
  ///
  /// In en, this message translates to:
  /// **'America / Hermosillo'**
  String get america_hermosillo;

  /// Timezone translation for america_indiana_indianapolis
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Indianapolis'**
  String get america_indiana_indianapolis;

  /// Timezone translation for america_indiana_knox
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Knox'**
  String get america_indiana_knox;

  /// Timezone translation for america_indiana_marengo
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Marengo'**
  String get america_indiana_marengo;

  /// Timezone translation for america_indiana_petersburg
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Petersburg'**
  String get america_indiana_petersburg;

  /// Timezone translation for america_indiana_tell_city
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Tell City'**
  String get america_indiana_tell_city;

  /// Timezone translation for america_indiana_vevay
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Vevay'**
  String get america_indiana_vevay;

  /// Timezone translation for america_indiana_vincennes
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Vincennes'**
  String get america_indiana_vincennes;

  /// Timezone translation for america_indiana_winamac
  ///
  /// In en, this message translates to:
  /// **'America / Indiana / Winamac'**
  String get america_indiana_winamac;

  /// Timezone translation for america_inuvik
  ///
  /// In en, this message translates to:
  /// **'America / Inuvik'**
  String get america_inuvik;

  /// Timezone translation for america_iqaluit
  ///
  /// In en, this message translates to:
  /// **'America / Iqaluit'**
  String get america_iqaluit;

  /// Timezone translation for america_jamaica
  ///
  /// In en, this message translates to:
  /// **'America / Jamaica'**
  String get america_jamaica;

  /// Timezone translation for america_juneau
  ///
  /// In en, this message translates to:
  /// **'America / Juneau'**
  String get america_juneau;

  /// Timezone translation for america_kentucky_louisville
  ///
  /// In en, this message translates to:
  /// **'America / Kentucky / Louisville'**
  String get america_kentucky_louisville;

  /// Timezone translation for america_kentucky_monticello
  ///
  /// In en, this message translates to:
  /// **'America / Kentucky / Monticello'**
  String get america_kentucky_monticello;

  /// Timezone translation for america_la_paz
  ///
  /// In en, this message translates to:
  /// **'America / La Paz'**
  String get america_la_paz;

  /// Timezone translation for america_lima
  ///
  /// In en, this message translates to:
  /// **'America / Lima'**
  String get america_lima;

  /// Timezone translation for america_los_angeles
  ///
  /// In en, this message translates to:
  /// **'America / Los Angeles'**
  String get america_los_angeles;

  /// Timezone translation for america_maceio
  ///
  /// In en, this message translates to:
  /// **'America / Maceio'**
  String get america_maceio;

  /// Timezone translation for america_managua
  ///
  /// In en, this message translates to:
  /// **'America / Managua'**
  String get america_managua;

  /// Timezone translation for america_manaus
  ///
  /// In en, this message translates to:
  /// **'America / Manaus'**
  String get america_manaus;

  /// Timezone translation for america_martinique
  ///
  /// In en, this message translates to:
  /// **'America / Martinique'**
  String get america_martinique;

  /// Timezone translation for america_matamoros
  ///
  /// In en, this message translates to:
  /// **'America / Matamoros'**
  String get america_matamoros;

  /// Timezone translation for america_mazatlan
  ///
  /// In en, this message translates to:
  /// **'America / Mazatlan'**
  String get america_mazatlan;

  /// Timezone translation for america_menominee
  ///
  /// In en, this message translates to:
  /// **'America / Menominee'**
  String get america_menominee;

  /// Timezone translation for america_merida
  ///
  /// In en, this message translates to:
  /// **'America / Merida'**
  String get america_merida;

  /// Timezone translation for america_metlakatla
  ///
  /// In en, this message translates to:
  /// **'America / Metlakatla'**
  String get america_metlakatla;

  /// Timezone translation for america_mexico_city
  ///
  /// In en, this message translates to:
  /// **'America / Mexico City'**
  String get america_mexico_city;

  /// Timezone translation for america_miquelon
  ///
  /// In en, this message translates to:
  /// **'America / Miquelon'**
  String get america_miquelon;

  /// Timezone translation for america_moncton
  ///
  /// In en, this message translates to:
  /// **'America / Moncton'**
  String get america_moncton;

  /// Timezone translation for america_monterrey
  ///
  /// In en, this message translates to:
  /// **'America / Monterrey'**
  String get america_monterrey;

  /// Timezone translation for america_montevideo
  ///
  /// In en, this message translates to:
  /// **'America / Montevideo'**
  String get america_montevideo;

  /// Timezone translation for america_new_york
  ///
  /// In en, this message translates to:
  /// **'America / New York'**
  String get america_new_york;

  /// Timezone translation for america_nome
  ///
  /// In en, this message translates to:
  /// **'America / Nome'**
  String get america_nome;

  /// Timezone translation for america_noronha
  ///
  /// In en, this message translates to:
  /// **'America / Noronha'**
  String get america_noronha;

  /// Timezone translation for america_north_dakota_beulah
  ///
  /// In en, this message translates to:
  /// **'America / North Dakota / Beulah'**
  String get america_north_dakota_beulah;

  /// Timezone translation for america_north_dakota_center
  ///
  /// In en, this message translates to:
  /// **'America / North Dakota / Center'**
  String get america_north_dakota_center;

  /// Timezone translation for america_north_dakota_new_salem
  ///
  /// In en, this message translates to:
  /// **'America / North Dakota / New Salem'**
  String get america_north_dakota_new_salem;

  /// Timezone translation for america_nuuk
  ///
  /// In en, this message translates to:
  /// **'America / Nuuk'**
  String get america_nuuk;

  /// Timezone translation for america_ojinaga
  ///
  /// In en, this message translates to:
  /// **'America / Ojinaga'**
  String get america_ojinaga;

  /// Timezone translation for america_panama
  ///
  /// In en, this message translates to:
  /// **'America / Panama'**
  String get america_panama;

  /// Timezone translation for america_paramaribo
  ///
  /// In en, this message translates to:
  /// **'America / Paramaribo'**
  String get america_paramaribo;

  /// Timezone translation for america_phoenix
  ///
  /// In en, this message translates to:
  /// **'America / Phoenix'**
  String get america_phoenix;

  /// Timezone translation for america_port-au-prince
  ///
  /// In en, this message translates to:
  /// **'America / Port-au-Prince'**
  String get america_port_au_prince;

  /// Timezone translation for america_porto_velho
  ///
  /// In en, this message translates to:
  /// **'America / Porto Velho'**
  String get america_porto_velho;

  /// Timezone translation for america_puerto_rico
  ///
  /// In en, this message translates to:
  /// **'America / Puerto Rico'**
  String get america_puerto_rico;

  /// Timezone translation for america_punta_arenas
  ///
  /// In en, this message translates to:
  /// **'America / Punta Arenas'**
  String get america_punta_arenas;

  /// Timezone translation for america_rankin_inlet
  ///
  /// In en, this message translates to:
  /// **'America / Rankin Inlet'**
  String get america_rankin_inlet;

  /// Timezone translation for america_recife
  ///
  /// In en, this message translates to:
  /// **'America / Recife'**
  String get america_recife;

  /// Timezone translation for america_regina
  ///
  /// In en, this message translates to:
  /// **'America / Regina'**
  String get america_regina;

  /// Timezone translation for america_resolute
  ///
  /// In en, this message translates to:
  /// **'America / Resolute'**
  String get america_resolute;

  /// Timezone translation for america_rio_branco
  ///
  /// In en, this message translates to:
  /// **'America / Rio Branco'**
  String get america_rio_branco;

  /// Timezone translation for america_santarem
  ///
  /// In en, this message translates to:
  /// **'America / Santarem'**
  String get america_santarem;

  /// Timezone translation for america_santiago
  ///
  /// In en, this message translates to:
  /// **'America / Santiago'**
  String get america_santiago;

  /// Timezone translation for america_santo_domingo
  ///
  /// In en, this message translates to:
  /// **'America / Santo Domingo'**
  String get america_santo_domingo;

  /// Timezone translation for america_sao_paulo
  ///
  /// In en, this message translates to:
  /// **'America / Sao Paulo'**
  String get america_sao_paulo;

  /// Timezone translation for america_scoresbysund
  ///
  /// In en, this message translates to:
  /// **'America / Scoresbysund'**
  String get america_scoresbysund;

  /// Timezone translation for america_sitka
  ///
  /// In en, this message translates to:
  /// **'America / Sitka'**
  String get america_sitka;

  /// Timezone translation for america_st_johns
  ///
  /// In en, this message translates to:
  /// **'America / St Johns'**
  String get america_st_johns;

  /// Timezone translation for america_swift_current
  ///
  /// In en, this message translates to:
  /// **'America / Swift Current'**
  String get america_swift_current;

  /// Timezone translation for america_tegucigalpa
  ///
  /// In en, this message translates to:
  /// **'America / Tegucigalpa'**
  String get america_tegucigalpa;

  /// Timezone translation for america_thule
  ///
  /// In en, this message translates to:
  /// **'America / Thule'**
  String get america_thule;

  /// Timezone translation for america_tijuana
  ///
  /// In en, this message translates to:
  /// **'America / Tijuana'**
  String get america_tijuana;

  /// Timezone translation for america_toronto
  ///
  /// In en, this message translates to:
  /// **'America / Toronto'**
  String get america_toronto;

  /// Timezone translation for america_vancouver
  ///
  /// In en, this message translates to:
  /// **'America / Vancouver'**
  String get america_vancouver;

  /// Timezone translation for america_whitehorse
  ///
  /// In en, this message translates to:
  /// **'America / Whitehorse'**
  String get america_whitehorse;

  /// Timezone translation for america_winnipeg
  ///
  /// In en, this message translates to:
  /// **'America / Winnipeg'**
  String get america_winnipeg;

  /// Timezone translation for america_yakutat
  ///
  /// In en, this message translates to:
  /// **'America / Yakutat'**
  String get america_yakutat;

  /// Timezone translation for america_anguilla
  ///
  /// In en, this message translates to:
  /// **'America / Anguilla'**
  String get america_anguilla;

  /// Timezone translation for america_antigua
  ///
  /// In en, this message translates to:
  /// **'America / Antigua'**
  String get america_antigua;

  /// Timezone translation for america_argentina_comodrivadavia
  ///
  /// In en, this message translates to:
  /// **'America / Argentina / Comodrivadavia'**
  String get america_argentina_comodrivadavia;

  /// Timezone translation for america_aruba
  ///
  /// In en, this message translates to:
  /// **'America / Aruba'**
  String get america_aruba;

  /// Timezone translation for america_atikokan
  ///
  /// In en, this message translates to:
  /// **'America / Atikokan'**
  String get america_atikokan;

  /// Timezone translation for america_atka
  ///
  /// In en, this message translates to:
  /// **'America / Atka'**
  String get america_atka;

  /// Timezone translation for america_blanc_sablon
  ///
  /// In en, this message translates to:
  /// **'America / Blanc-Sablon'**
  String get america_blanc_sablon;

  /// Timezone translation for america_buenos_aires
  ///
  /// In en, this message translates to:
  /// **'America / Buenos Aires'**
  String get america_buenos_aires;

  /// Timezone translation for america_catamarca
  ///
  /// In en, this message translates to:
  /// **'America / Catamarca'**
  String get america_catamarca;

  /// Timezone translation for america_cayman
  ///
  /// In en, this message translates to:
  /// **'America / Cayman'**
  String get america_cayman;

  /// Timezone translation for america_coral_harbour
  ///
  /// In en, this message translates to:
  /// **'America / Coral Harbour'**
  String get america_coral_harbour;

  /// Timezone translation for america_cordoba
  ///
  /// In en, this message translates to:
  /// **'America / Cordoba'**
  String get america_cordoba;

  /// Timezone translation for america_creston
  ///
  /// In en, this message translates to:
  /// **'America / Creston'**
  String get america_creston;

  /// Timezone translation for america_curacao
  ///
  /// In en, this message translates to:
  /// **'America / Curacao'**
  String get america_curacao;

  /// Timezone translation for america_dominica
  ///
  /// In en, this message translates to:
  /// **'America / Dominica'**
  String get america_dominica;

  /// Timezone translation for america_ensenada
  ///
  /// In en, this message translates to:
  /// **'America / Ensenada'**
  String get america_ensenada;

  /// Timezone translation for america_fort_wayne
  ///
  /// In en, this message translates to:
  /// **'America / Fort Wayne'**
  String get america_fort_wayne;

  /// Timezone translation for america_godthab
  ///
  /// In en, this message translates to:
  /// **'America / Godthab'**
  String get america_godthab;

  /// Timezone translation for america_grenada
  ///
  /// In en, this message translates to:
  /// **'America / Grenada'**
  String get america_grenada;

  /// Timezone translation for america_guadeloupe
  ///
  /// In en, this message translates to:
  /// **'America / Guadeloupe'**
  String get america_guadeloupe;

  /// Timezone translation for america_indianapolis
  ///
  /// In en, this message translates to:
  /// **'America / Indianapolis'**
  String get america_indianapolis;

  /// Timezone translation for america_jujuy
  ///
  /// In en, this message translates to:
  /// **'America / Jujuy'**
  String get america_jujuy;

  /// Timezone translation for america_knox_in
  ///
  /// In en, this message translates to:
  /// **'America / Knox (IN)'**
  String get america_knox_in;

  /// Timezone translation for america_kralendijk
  ///
  /// In en, this message translates to:
  /// **'America / Kralendijk'**
  String get america_kralendijk;

  /// Timezone translation for america_louisville
  ///
  /// In en, this message translates to:
  /// **'America / Louisville'**
  String get america_louisville;

  /// Timezone translation for america_lower_princes
  ///
  /// In en, this message translates to:
  /// **'America / Lower Princes'**
  String get america_lower_princes;

  /// Timezone translation for america_marigot
  ///
  /// In en, this message translates to:
  /// **'America / Marigot'**
  String get america_marigot;

  /// Timezone translation for america_mendoza
  ///
  /// In en, this message translates to:
  /// **'America / Mendoza'**
  String get america_mendoza;

  /// Timezone translation for america_montreal
  ///
  /// In en, this message translates to:
  /// **'America / Montreal'**
  String get america_montreal;

  /// Timezone translation for america_montserrat
  ///
  /// In en, this message translates to:
  /// **'America / Montserrat'**
  String get america_montserrat;

  /// Timezone translation for america_nassau
  ///
  /// In en, this message translates to:
  /// **'America / Nassau'**
  String get america_nassau;

  /// Timezone translation for america_nipigon
  ///
  /// In en, this message translates to:
  /// **'America / Nipigon'**
  String get america_nipigon;

  /// Timezone translation for america_pangnirtung
  ///
  /// In en, this message translates to:
  /// **'America / Pangnirtung'**
  String get america_pangnirtung;

  /// Timezone translation for america_port_of_spain
  ///
  /// In en, this message translates to:
  /// **'America / Port of Spain'**
  String get america_port_of_spain;

  /// Timezone translation for america_porto_acre
  ///
  /// In en, this message translates to:
  /// **'America / Porto Acre'**
  String get america_porto_acre;

  /// Timezone translation for america_rainy_river
  ///
  /// In en, this message translates to:
  /// **'America / Rainy River'**
  String get america_rainy_river;

  /// Timezone translation for america_rosario
  ///
  /// In en, this message translates to:
  /// **'America / Rosario'**
  String get america_rosario;

  /// Timezone translation for america_santa_isabel
  ///
  /// In en, this message translates to:
  /// **'America / Santa Isabel'**
  String get america_santa_isabel;

  /// Timezone translation for america_shiprock
  ///
  /// In en, this message translates to:
  /// **'America / Shiprock'**
  String get america_shiprock;

  /// Timezone translation for america_st_barthelemy
  ///
  /// In en, this message translates to:
  /// **'America / St. Barthelemy'**
  String get america_st_barthelemy;

  /// Timezone translation for america_st_kitts
  ///
  /// In en, this message translates to:
  /// **'America / St. Kitts'**
  String get america_st_kitts;

  /// Timezone translation for america_st_lucia
  ///
  /// In en, this message translates to:
  /// **'America / St. Lucia'**
  String get america_st_lucia;

  /// Timezone translation for america_st_thomas
  ///
  /// In en, this message translates to:
  /// **'America / St. Thomas'**
  String get america_st_thomas;

  /// Timezone translation for america_st_vincent
  ///
  /// In en, this message translates to:
  /// **'America / St. Vincent'**
  String get america_st_vincent;

  /// Timezone translation for america_thunder_bay
  ///
  /// In en, this message translates to:
  /// **'America / Thunder Bay'**
  String get america_thunder_bay;

  /// Timezone translation for america_tortola
  ///
  /// In en, this message translates to:
  /// **'America / Tortola'**
  String get america_tortola;

  /// Timezone translation for america_virgin
  ///
  /// In en, this message translates to:
  /// **'America / Virgin'**
  String get america_virgin;

  /// Timezone translation for america_yellowknife
  ///
  /// In en, this message translates to:
  /// **'America / Yellowknife'**
  String get america_yellowknife;

  /// Timezone translation for antarctica_casey
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Casey'**
  String get antarctica_casey;

  /// Timezone translation for antarctica_davis
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Davis'**
  String get antarctica_davis;

  /// Timezone translation for antarctica_macquarie
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Macquarie'**
  String get antarctica_macquarie;

  /// Timezone translation for antarctica_mawson
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Mawson'**
  String get antarctica_mawson;

  /// Timezone translation for antarctica_palmer
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Palmer'**
  String get antarctica_palmer;

  /// Timezone translation for antarctica_rothera
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Rothera'**
  String get antarctica_rothera;

  /// Timezone translation for antarctica_troll
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Troll'**
  String get antarctica_troll;

  /// Timezone translation for antarctica_vostok
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Vostok'**
  String get antarctica_vostok;

  /// Timezone translation for antarctica_dumontdurville
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Dumont d’Urville'**
  String get antarctica_dumontdurville;

  /// Timezone translation for antarctica_mcmurdo
  ///
  /// In en, this message translates to:
  /// **'Antarctica / McMurdo'**
  String get antarctica_mcmurdo;

  /// Timezone translation for antarctica_south_pole
  ///
  /// In en, this message translates to:
  /// **'Antarctica / South Pole'**
  String get antarctica_south_pole;

  /// Timezone translation for antarctica_syowa
  ///
  /// In en, this message translates to:
  /// **'Antarctica / Syowa'**
  String get antarctica_syowa;

  /// Timezone translation for arctic_longyearbyen
  ///
  /// In en, this message translates to:
  /// **'Arctic / Longyearbyen'**
  String get arctic_longyearbyen;

  /// Timezone translation for asia_almaty
  ///
  /// In en, this message translates to:
  /// **'Asia / Almaty'**
  String get asia_almaty;

  /// Timezone translation for asia_amman
  ///
  /// In en, this message translates to:
  /// **'Asia / Amman'**
  String get asia_amman;

  /// Timezone translation for asia_anadyr
  ///
  /// In en, this message translates to:
  /// **'Asia / Anadyr'**
  String get asia_anadyr;

  /// Timezone translation for asia_aqtau
  ///
  /// In en, this message translates to:
  /// **'Asia / Aqtau'**
  String get asia_aqtau;

  /// Timezone translation for asia_aqtobe
  ///
  /// In en, this message translates to:
  /// **'Asia / Aqtobe'**
  String get asia_aqtobe;

  /// Timezone translation for asia_ashgabat
  ///
  /// In en, this message translates to:
  /// **'Asia / Ashgabat'**
  String get asia_ashgabat;

  /// Timezone translation for asia_atyrau
  ///
  /// In en, this message translates to:
  /// **'Asia / Atyrau'**
  String get asia_atyrau;

  /// Timezone translation for asia_baghdad
  ///
  /// In en, this message translates to:
  /// **'Asia / Baghdad'**
  String get asia_baghdad;

  /// Timezone translation for asia_baku
  ///
  /// In en, this message translates to:
  /// **'Asia / Baku'**
  String get asia_baku;

  /// Timezone translation for asia_bangkok
  ///
  /// In en, this message translates to:
  /// **'Asia / Bangkok'**
  String get asia_bangkok;

  /// Timezone translation for asia_barnaul
  ///
  /// In en, this message translates to:
  /// **'Asia / Barnaul'**
  String get asia_barnaul;

  /// Timezone translation for asia_beirut
  ///
  /// In en, this message translates to:
  /// **'Asia / Beirut'**
  String get asia_beirut;

  /// Timezone translation for asia_bishkek
  ///
  /// In en, this message translates to:
  /// **'Asia / Bishkek'**
  String get asia_bishkek;

  /// Timezone translation for asia_chita
  ///
  /// In en, this message translates to:
  /// **'Asia / Chita'**
  String get asia_chita;

  /// Timezone translation for asia_colombo
  ///
  /// In en, this message translates to:
  /// **'Asia / Colombo'**
  String get asia_colombo;

  /// Timezone translation for asia_damascus
  ///
  /// In en, this message translates to:
  /// **'Asia / Damascus'**
  String get asia_damascus;

  /// Timezone translation for asia_dhaka
  ///
  /// In en, this message translates to:
  /// **'Asia / Dhaka'**
  String get asia_dhaka;

  /// Timezone translation for asia_dili
  ///
  /// In en, this message translates to:
  /// **'Asia / Dili'**
  String get asia_dili;

  /// Timezone translation for asia_dubai
  ///
  /// In en, this message translates to:
  /// **'Asia / Dubai'**
  String get asia_dubai;

  /// Timezone translation for asia_dushanbe
  ///
  /// In en, this message translates to:
  /// **'Asia / Dushanbe'**
  String get asia_dushanbe;

  /// Timezone translation for asia_famagusta
  ///
  /// In en, this message translates to:
  /// **'Asia / Famagusta'**
  String get asia_famagusta;

  /// Timezone translation for asia_gaza
  ///
  /// In en, this message translates to:
  /// **'Asia / Gaza'**
  String get asia_gaza;

  /// Timezone translation for asia_hebron
  ///
  /// In en, this message translates to:
  /// **'Asia / Hebron'**
  String get asia_hebron;

  /// Timezone translation for asia_ho_chi_minh
  ///
  /// In en, this message translates to:
  /// **'Asia / Ho Chi Minh'**
  String get asia_ho_chi_minh;

  /// Timezone translation for asia_hong_kong
  ///
  /// In en, this message translates to:
  /// **'Asia / Hong Kong'**
  String get asia_hong_kong;

  /// Timezone translation for asia_hovd
  ///
  /// In en, this message translates to:
  /// **'Asia / Hovd'**
  String get asia_hovd;

  /// Timezone translation for asia_irkutsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Irkutsk'**
  String get asia_irkutsk;

  /// Timezone translation for asia_jakarta
  ///
  /// In en, this message translates to:
  /// **'Asia / Jakarta'**
  String get asia_jakarta;

  /// Timezone translation for asia_jayapura
  ///
  /// In en, this message translates to:
  /// **'Asia / Jayapura'**
  String get asia_jayapura;

  /// Timezone translation for asia_jerusalem
  ///
  /// In en, this message translates to:
  /// **'Asia / Jerusalem'**
  String get asia_jerusalem;

  /// Timezone translation for asia_kabul
  ///
  /// In en, this message translates to:
  /// **'Asia / Kabul'**
  String get asia_kabul;

  /// Timezone translation for asia_kamchatka
  ///
  /// In en, this message translates to:
  /// **'Asia / Kamchatka'**
  String get asia_kamchatka;

  /// Timezone translation for asia_karachi
  ///
  /// In en, this message translates to:
  /// **'Asia / Karachi'**
  String get asia_karachi;

  /// Timezone translation for asia_kathmandu
  ///
  /// In en, this message translates to:
  /// **'Asia / Kathmandu'**
  String get asia_kathmandu;

  /// Timezone translation for asia_khandyga
  ///
  /// In en, this message translates to:
  /// **'Asia / Khandyga'**
  String get asia_khandyga;

  /// Timezone translation for asia_kolkata
  ///
  /// In en, this message translates to:
  /// **'Asia / Kolkata'**
  String get asia_kolkata;

  /// Timezone translation for asia_krasnoyarsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Krasnoyarsk'**
  String get asia_krasnoyarsk;

  /// Timezone translation for asia_kuching
  ///
  /// In en, this message translates to:
  /// **'Asia / Kuching'**
  String get asia_kuching;

  /// Timezone translation for asia_macau
  ///
  /// In en, this message translates to:
  /// **'Asia / Macau'**
  String get asia_macau;

  /// Timezone translation for asia_magadan
  ///
  /// In en, this message translates to:
  /// **'Asia / Magadan'**
  String get asia_magadan;

  /// Timezone translation for asia_makassar
  ///
  /// In en, this message translates to:
  /// **'Asia / Makassar'**
  String get asia_makassar;

  /// Timezone translation for asia_manila
  ///
  /// In en, this message translates to:
  /// **'Asia / Manila'**
  String get asia_manila;

  /// Timezone translation for asia_nicosia
  ///
  /// In en, this message translates to:
  /// **'Asia / Nicosia'**
  String get asia_nicosia;

  /// Timezone translation for asia_novokuznetsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Novokuznetsk'**
  String get asia_novokuznetsk;

  /// Timezone translation for asia_novosibirsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Novosibirsk'**
  String get asia_novosibirsk;

  /// Timezone translation for asia_omsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Omsk'**
  String get asia_omsk;

  /// Timezone translation for asia_oral
  ///
  /// In en, this message translates to:
  /// **'Asia / Oral'**
  String get asia_oral;

  /// Timezone translation for asia_pontianak
  ///
  /// In en, this message translates to:
  /// **'Asia / Pontianak'**
  String get asia_pontianak;

  /// Timezone translation for asia_pyongyang
  ///
  /// In en, this message translates to:
  /// **'Asia / Pyongyang'**
  String get asia_pyongyang;

  /// Timezone translation for asia_qatar
  ///
  /// In en, this message translates to:
  /// **'Asia / Qatar'**
  String get asia_qatar;

  /// Timezone translation for asia_qostanay
  ///
  /// In en, this message translates to:
  /// **'Asia / Qostanay'**
  String get asia_qostanay;

  /// Timezone translation for asia_qyzylorda
  ///
  /// In en, this message translates to:
  /// **'Asia / Qyzylorda'**
  String get asia_qyzylorda;

  /// Timezone translation for asia_riyadh
  ///
  /// In en, this message translates to:
  /// **'Asia / Riyadh'**
  String get asia_riyadh;

  /// Timezone translation for asia_sakhalin
  ///
  /// In en, this message translates to:
  /// **'Asia / Sakhalin'**
  String get asia_sakhalin;

  /// Timezone translation for asia_samarkand
  ///
  /// In en, this message translates to:
  /// **'Asia / Samarkand'**
  String get asia_samarkand;

  /// Timezone translation for asia_seoul
  ///
  /// In en, this message translates to:
  /// **'Asia / Seoul'**
  String get asia_seoul;

  /// Timezone translation for asia_shanghai
  ///
  /// In en, this message translates to:
  /// **'Asia / Shanghai'**
  String get asia_shanghai;

  /// Timezone translation for asia_singapore
  ///
  /// In en, this message translates to:
  /// **'Asia / Singapore'**
  String get asia_singapore;

  /// Timezone translation for asia_srednekolymsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Srednekolymsk'**
  String get asia_srednekolymsk;

  /// Timezone translation for asia_taipei
  ///
  /// In en, this message translates to:
  /// **'Asia / Taipei'**
  String get asia_taipei;

  /// Timezone translation for asia_tashkent
  ///
  /// In en, this message translates to:
  /// **'Asia / Tashkent'**
  String get asia_tashkent;

  /// Timezone translation for asia_tbilisi
  ///
  /// In en, this message translates to:
  /// **'Asia / Tbilisi'**
  String get asia_tbilisi;

  /// Timezone translation for asia_tehran
  ///
  /// In en, this message translates to:
  /// **'Asia / Tehran'**
  String get asia_tehran;

  /// Timezone translation for asia_thimphu
  ///
  /// In en, this message translates to:
  /// **'Asia / Thimphu'**
  String get asia_thimphu;

  /// Timezone translation for asia_tokyo
  ///
  /// In en, this message translates to:
  /// **'Asia / Tokyo'**
  String get asia_tokyo;

  /// Timezone translation for asia_tomsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Tomsk'**
  String get asia_tomsk;

  /// Timezone translation for asia_ulaanbaatar
  ///
  /// In en, this message translates to:
  /// **'Asia / Ulaanbaatar'**
  String get asia_ulaanbaatar;

  /// Timezone translation for asia_urumqi
  ///
  /// In en, this message translates to:
  /// **'Asia / Urumqi'**
  String get asia_urumqi;

  /// Timezone translation for asia_ust-nera
  ///
  /// In en, this message translates to:
  /// **'Asia / Ust-Nera'**
  String get asia_ust_nera;

  /// Timezone translation for asia_vladivostok
  ///
  /// In en, this message translates to:
  /// **'Asia / Vladivostok'**
  String get asia_vladivostok;

  /// Timezone translation for asia_yakutsk
  ///
  /// In en, this message translates to:
  /// **'Asia / Yakutsk'**
  String get asia_yakutsk;

  /// Timezone translation for asia_yangon
  ///
  /// In en, this message translates to:
  /// **'Asia / Yangon'**
  String get asia_yangon;

  /// Timezone translation for asia_yekaterinburg
  ///
  /// In en, this message translates to:
  /// **'Asia / Yekaterinburg'**
  String get asia_yekaterinburg;

  /// Timezone translation for asia_yerevan
  ///
  /// In en, this message translates to:
  /// **'Asia / Yerevan'**
  String get asia_yerevan;

  /// Timezone translation for asia_aden
  ///
  /// In en, this message translates to:
  /// **'Asia / Aden'**
  String get asia_aden;

  /// Timezone translation for asia_ashkhabad
  ///
  /// In en, this message translates to:
  /// **'Asia / Ashkhabad'**
  String get asia_ashkhabad;

  /// Timezone translation for asia_bahrain
  ///
  /// In en, this message translates to:
  /// **'Asia / Bahrain'**
  String get asia_bahrain;

  /// Timezone translation for asia_brunei
  ///
  /// In en, this message translates to:
  /// **'Asia / Brunei'**
  String get asia_brunei;

  /// Timezone translation for asia_calcutta
  ///
  /// In en, this message translates to:
  /// **'Asia / Calcutta'**
  String get asia_calcutta;

  /// Timezone translation for asia_choibalsan
  ///
  /// In en, this message translates to:
  /// **'Asia / Choibalsan'**
  String get asia_choibalsan;

  /// Timezone translation for asia_chongqing
  ///
  /// In en, this message translates to:
  /// **'Asia / Chongqing'**
  String get asia_chongqing;

  /// Timezone translation for asia_chungking
  ///
  /// In en, this message translates to:
  /// **'Asia / Chungking'**
  String get asia_chungking;

  /// Timezone translation for asia_dacca
  ///
  /// In en, this message translates to:
  /// **'Asia / Dacca'**
  String get asia_dacca;

  /// Timezone translation for asia_harbin
  ///
  /// In en, this message translates to:
  /// **'Asia / Harbin'**
  String get asia_harbin;

  /// Timezone translation for asia_istanbul
  ///
  /// In en, this message translates to:
  /// **'Asia / Istanbul'**
  String get asia_istanbul;

  /// Timezone translation for asia_kashgar
  ///
  /// In en, this message translates to:
  /// **'Asia / Kashgar'**
  String get asia_kashgar;

  /// Timezone translation for asia_katmandu
  ///
  /// In en, this message translates to:
  /// **'Asia / Katmandu'**
  String get asia_katmandu;

  /// Timezone translation for asia_kuala_lumpur
  ///
  /// In en, this message translates to:
  /// **'Asia / Kuala Lumpur'**
  String get asia_kuala_lumpur;

  /// Timezone translation for asia_kuwait
  ///
  /// In en, this message translates to:
  /// **'Asia / Kuwait'**
  String get asia_kuwait;

  /// Timezone translation for asia_macao
  ///
  /// In en, this message translates to:
  /// **'Asia / Macao'**
  String get asia_macao;

  /// Timezone translation for asia_muscat
  ///
  /// In en, this message translates to:
  /// **'Asia / Muscat'**
  String get asia_muscat;

  /// Timezone translation for asia_phnom_penh
  ///
  /// In en, this message translates to:
  /// **'Asia / Phnom Penh'**
  String get asia_phnom_penh;

  /// Timezone translation for asia_rangoon
  ///
  /// In en, this message translates to:
  /// **'Asia / Rangoon'**
  String get asia_rangoon;

  /// Timezone translation for asia_saigon
  ///
  /// In en, this message translates to:
  /// **'Asia / Saigon'**
  String get asia_saigon;

  /// Timezone translation for asia_tel_aviv
  ///
  /// In en, this message translates to:
  /// **'Asia / Tel Aviv'**
  String get asia_tel_aviv;

  /// Timezone translation for asia_thimbu
  ///
  /// In en, this message translates to:
  /// **'Asia / Thimbu'**
  String get asia_thimbu;

  /// Timezone translation for asia_ujung_pandang
  ///
  /// In en, this message translates to:
  /// **'Asia / Ujung Pandang'**
  String get asia_ujung_pandang;

  /// Timezone translation for asia_ulan_bator
  ///
  /// In en, this message translates to:
  /// **'Asia / Ulan Bator'**
  String get asia_ulan_bator;

  /// Timezone translation for asia_vientiane
  ///
  /// In en, this message translates to:
  /// **'Asia / Vientiane'**
  String get asia_vientiane;

  /// Timezone translation for atlantic_azores
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Azores'**
  String get atlantic_azores;

  /// Timezone translation for atlantic_bermuda
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Bermuda'**
  String get atlantic_bermuda;

  /// Timezone translation for atlantic_canary
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Canary'**
  String get atlantic_canary;

  /// Timezone translation for atlantic_cape_verde
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Cape Verde'**
  String get atlantic_cape_verde;

  /// Timezone translation for atlantic_faroe
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Faroe'**
  String get atlantic_faroe;

  /// Timezone translation for atlantic_madeira
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Madeira'**
  String get atlantic_madeira;

  /// Timezone translation for atlantic_south_georgia
  ///
  /// In en, this message translates to:
  /// **'Atlantic / South Georgia'**
  String get atlantic_south_georgia;

  /// Timezone translation for atlantic_stanley
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Stanley'**
  String get atlantic_stanley;

  /// Timezone translation for atlantic_faeroe
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Faeroe'**
  String get atlantic_faeroe;

  /// Timezone translation for atlantic_jan_mayen
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Jan Mayen'**
  String get atlantic_jan_mayen;

  /// Timezone translation for atlantic_reykjavik
  ///
  /// In en, this message translates to:
  /// **'Atlantic / Reykjavik'**
  String get atlantic_reykjavik;

  /// Timezone translation for atlantic_st_helena
  ///
  /// In en, this message translates to:
  /// **'Atlantic / St. Helena'**
  String get atlantic_st_helena;

  /// Timezone translation for australia_adelaide
  ///
  /// In en, this message translates to:
  /// **'Australia / Adelaide'**
  String get australia_adelaide;

  /// Timezone translation for australia_brisbane
  ///
  /// In en, this message translates to:
  /// **'Australia / Brisbane'**
  String get australia_brisbane;

  /// Timezone translation for australia_broken_hill
  ///
  /// In en, this message translates to:
  /// **'Australia / Broken Hill'**
  String get australia_broken_hill;

  /// Timezone translation for australia_darwin
  ///
  /// In en, this message translates to:
  /// **'Australia / Darwin'**
  String get australia_darwin;

  /// Timezone translation for australia_eucla
  ///
  /// In en, this message translates to:
  /// **'Australia / Eucla'**
  String get australia_eucla;

  /// Timezone translation for australia_hobart
  ///
  /// In en, this message translates to:
  /// **'Australia / Hobart'**
  String get australia_hobart;

  /// Timezone translation for australia_lindeman
  ///
  /// In en, this message translates to:
  /// **'Australia / Lindeman'**
  String get australia_lindeman;

  /// Timezone translation for australia_lord_howe
  ///
  /// In en, this message translates to:
  /// **'Australia / Lord Howe'**
  String get australia_lord_howe;

  /// Timezone translation for australia_melbourne
  ///
  /// In en, this message translates to:
  /// **'Australia / Melbourne'**
  String get australia_melbourne;

  /// Timezone translation for australia_perth
  ///
  /// In en, this message translates to:
  /// **'Australia / Perth'**
  String get australia_perth;

  /// Timezone translation for australia_sydney
  ///
  /// In en, this message translates to:
  /// **'Australia / Sydney'**
  String get australia_sydney;

  /// Timezone translation for australia_act
  ///
  /// In en, this message translates to:
  /// **'Australia / ACT'**
  String get australia_act;

  /// Timezone translation for australia_canberra
  ///
  /// In en, this message translates to:
  /// **'Australia / Canberra'**
  String get australia_canberra;

  /// Timezone translation for australia_currie
  ///
  /// In en, this message translates to:
  /// **'Australia / Currie'**
  String get australia_currie;

  /// Timezone translation for australia_lhi
  ///
  /// In en, this message translates to:
  /// **'Australia / Lord Howe Island'**
  String get australia_lhi;

  /// Timezone translation for australia_nsw
  ///
  /// In en, this message translates to:
  /// **'Australia / New South Wales'**
  String get australia_nsw;

  /// Timezone translation for australia_north
  ///
  /// In en, this message translates to:
  /// **'Australia / Northern Territory'**
  String get australia_north;

  /// Timezone translation for australia_queensland
  ///
  /// In en, this message translates to:
  /// **'Australia / Queensland'**
  String get australia_queensland;

  /// Timezone translation for australia_south
  ///
  /// In en, this message translates to:
  /// **'Australia / South Australia'**
  String get australia_south;

  /// Timezone translation for australia_tasmania
  ///
  /// In en, this message translates to:
  /// **'Australia / Tasmania'**
  String get australia_tasmania;

  /// Timezone translation for australia_victoria
  ///
  /// In en, this message translates to:
  /// **'Australia / Victoria'**
  String get australia_victoria;

  /// Timezone translation for australia_west
  ///
  /// In en, this message translates to:
  /// **'Australia / Western Australia'**
  String get australia_west;

  /// Timezone translation for australia_yancowinna
  ///
  /// In en, this message translates to:
  /// **'Australia / Yancowinna'**
  String get australia_yancowinna;

  /// Timezone translation for etc_gmt
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT'**
  String get etc_gmt;

  /// Timezone translation for etc_gmt+1
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+1'**
  String get etc_gmt_plus_1;

  /// Timezone translation for etc_gmt+10
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+10'**
  String get etc_gmt_plus_10;

  /// Timezone translation for etc_gmt+11
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+11'**
  String get etc_gmt_plus_11;

  /// Timezone translation for etc_gmt+12
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+12'**
  String get etc_gmt_plus_12;

  /// Timezone translation for etc_gmt+2
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+2'**
  String get etc_gmt_plus_2;

  /// Timezone translation for etc_gmt+3
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+3'**
  String get etc_gmt_plus_3;

  /// Timezone translation for etc_gmt+4
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+4'**
  String get etc_gmt_plus_4;

  /// Timezone translation for etc_gmt+5
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+5'**
  String get etc_gmt_plus_5;

  /// Timezone translation for etc_gmt+6
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+6'**
  String get etc_gmt_plus_6;

  /// Timezone translation for etc_gmt+7
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+7'**
  String get etc_gmt_plus_7;

  /// Timezone translation for etc_gmt+8
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+8'**
  String get etc_gmt_plus_8;

  /// Timezone translation for etc_gmt+9
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+9'**
  String get etc_gmt_plus_9;

  /// Timezone translation for etc_gmt-1
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-1'**
  String get etc_gmt_minus_1;

  /// Timezone translation for etc_gmt-10
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-10'**
  String get etc_gmt_minus_10;

  /// Timezone translation for etc_gmt-11
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-11'**
  String get etc_gmt_minus_11;

  /// Timezone translation for etc_gmt-12
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-12'**
  String get etc_gmt_minus_12;

  /// Timezone translation for etc_gmt-13
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-13'**
  String get etc_gmt_minus_13;

  /// Timezone translation for etc_gmt-14
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-14'**
  String get etc_gmt_minus_14;

  /// Timezone translation for etc_gmt-2
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-2'**
  String get etc_gmt_minus_2;

  /// Timezone translation for etc_gmt-3
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-3'**
  String get etc_gmt_minus_3;

  /// Timezone translation for etc_gmt-4
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-4'**
  String get etc_gmt_minus_4;

  /// Timezone translation for etc_gmt-5
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-5'**
  String get etc_gmt_minus_5;

  /// Timezone translation for etc_gmt-6
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-6'**
  String get etc_gmt_minus_6;

  /// Timezone translation for etc_gmt-7
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-7'**
  String get etc_gmt_minus_7;

  /// Timezone translation for etc_gmt-8
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-8'**
  String get etc_gmt_minus_8;

  /// Timezone translation for etc_gmt-9
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-9'**
  String get etc_gmt_minus_9;

  /// Timezone translation for etc_utc
  ///
  /// In en, this message translates to:
  /// **'Etc / UTC'**
  String get etc_utc;

  /// Timezone translation for etc_gmt_plus_0
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT+0'**
  String get etc_gmt_plus_0;

  /// Timezone translation for etc_gmt_minus_0
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT-0'**
  String get etc_gmt_minus_0;

  /// Timezone translation for etc_gmt0
  ///
  /// In en, this message translates to:
  /// **'Etc / GMT0'**
  String get etc_gmt0;

  /// Timezone translation for etc_greenwich
  ///
  /// In en, this message translates to:
  /// **'Etc / Greenwich'**
  String get etc_greenwich;

  /// Timezone translation for etc_uct
  ///
  /// In en, this message translates to:
  /// **'Etc / UCT'**
  String get etc_uct;

  /// Timezone translation for etc_universal
  ///
  /// In en, this message translates to:
  /// **'Etc / Universal'**
  String get etc_universal;

  /// Timezone translation for etc_zulu
  ///
  /// In en, this message translates to:
  /// **'Etc / Zulu'**
  String get etc_zulu;

  /// Timezone translation for europe_andorra
  ///
  /// In en, this message translates to:
  /// **'Europe / Andorra'**
  String get europe_andorra;

  /// Timezone translation for europe_astrakhan
  ///
  /// In en, this message translates to:
  /// **'Europe / Astrakhan'**
  String get europe_astrakhan;

  /// Timezone translation for europe_athens
  ///
  /// In en, this message translates to:
  /// **'Europe / Athens'**
  String get europe_athens;

  /// Timezone translation for europe_belgrade
  ///
  /// In en, this message translates to:
  /// **'Europe / Belgrade'**
  String get europe_belgrade;

  /// Timezone translation for europe_berlin
  ///
  /// In en, this message translates to:
  /// **'Europe / Berlin'**
  String get europe_berlin;

  /// Timezone translation for europe_brussels
  ///
  /// In en, this message translates to:
  /// **'Europe / Brussels'**
  String get europe_brussels;

  /// Timezone translation for europe_bucharest
  ///
  /// In en, this message translates to:
  /// **'Europe / Bucharest'**
  String get europe_bucharest;

  /// Timezone translation for europe_budapest
  ///
  /// In en, this message translates to:
  /// **'Europe / Budapest'**
  String get europe_budapest;

  /// Timezone translation for europe_chisinau
  ///
  /// In en, this message translates to:
  /// **'Europe / Chisinau'**
  String get europe_chisinau;

  /// Timezone translation for europe_dublin
  ///
  /// In en, this message translates to:
  /// **'Europe / Dublin'**
  String get europe_dublin;

  /// Timezone translation for europe_gibraltar
  ///
  /// In en, this message translates to:
  /// **'Europe / Gibraltar'**
  String get europe_gibraltar;

  /// Timezone translation for europe_helsinki
  ///
  /// In en, this message translates to:
  /// **'Europe / Helsinki'**
  String get europe_helsinki;

  /// Timezone translation for europe_istanbul
  ///
  /// In en, this message translates to:
  /// **'Europe / Istanbul'**
  String get europe_istanbul;

  /// Timezone translation for europe_kaliningrad
  ///
  /// In en, this message translates to:
  /// **'Europe / Kaliningrad'**
  String get europe_kaliningrad;

  /// Timezone translation for europe_kirov
  ///
  /// In en, this message translates to:
  /// **'Europe / Kirov'**
  String get europe_kirov;

  /// Timezone translation for europe_kyiv
  ///
  /// In en, this message translates to:
  /// **'Europe / Kyiv'**
  String get europe_kyiv;

  /// Timezone translation for europe_lisbon
  ///
  /// In en, this message translates to:
  /// **'Europe / Lisbon'**
  String get europe_lisbon;

  /// Timezone translation for europe_london
  ///
  /// In en, this message translates to:
  /// **'Europe / London'**
  String get europe_london;

  /// Timezone translation for europe_madrid
  ///
  /// In en, this message translates to:
  /// **'Europe / Madrid'**
  String get europe_madrid;

  /// Timezone translation for europe_malta
  ///
  /// In en, this message translates to:
  /// **'Europe / Malta'**
  String get europe_malta;

  /// Timezone translation for europe_minsk
  ///
  /// In en, this message translates to:
  /// **'Europe / Minsk'**
  String get europe_minsk;

  /// Timezone translation for europe_moscow
  ///
  /// In en, this message translates to:
  /// **'Europe / Moscow'**
  String get europe_moscow;

  /// Timezone translation for europe_paris
  ///
  /// In en, this message translates to:
  /// **'Europe / Paris'**
  String get europe_paris;

  /// Timezone translation for europe_prague
  ///
  /// In en, this message translates to:
  /// **'Europe / Prague'**
  String get europe_prague;

  /// Timezone translation for europe_riga
  ///
  /// In en, this message translates to:
  /// **'Europe / Riga'**
  String get europe_riga;

  /// Timezone translation for europe_rome
  ///
  /// In en, this message translates to:
  /// **'Europe / Rome'**
  String get europe_rome;

  /// Timezone translation for europe_samara
  ///
  /// In en, this message translates to:
  /// **'Europe / Samara'**
  String get europe_samara;

  /// Timezone translation for europe_saratov
  ///
  /// In en, this message translates to:
  /// **'Europe / Saratov'**
  String get europe_saratov;

  /// Timezone translation for europe_simferopol
  ///
  /// In en, this message translates to:
  /// **'Europe / Simferopol'**
  String get europe_simferopol;

  /// Timezone translation for europe_sofia
  ///
  /// In en, this message translates to:
  /// **'Europe / Sofia'**
  String get europe_sofia;

  /// Timezone translation for europe_tallinn
  ///
  /// In en, this message translates to:
  /// **'Europe / Tallinn'**
  String get europe_tallinn;

  /// Timezone translation for europe_tirane
  ///
  /// In en, this message translates to:
  /// **'Europe / Tirane'**
  String get europe_tirane;

  /// Timezone translation for europe_ulyanovsk
  ///
  /// In en, this message translates to:
  /// **'Europe / Ulyanovsk'**
  String get europe_ulyanovsk;

  /// Timezone translation for europe_vienna
  ///
  /// In en, this message translates to:
  /// **'Europe / Vienna'**
  String get europe_vienna;

  /// Timezone translation for europe_vilnius
  ///
  /// In en, this message translates to:
  /// **'Europe / Vilnius'**
  String get europe_vilnius;

  /// Timezone translation for europe_volgograd
  ///
  /// In en, this message translates to:
  /// **'Europe / Volgograd'**
  String get europe_volgograd;

  /// Timezone translation for europe_warsaw
  ///
  /// In en, this message translates to:
  /// **'Europe / Warsaw'**
  String get europe_warsaw;

  /// Timezone translation for europe_zurich
  ///
  /// In en, this message translates to:
  /// **'Europe / Zurich'**
  String get europe_zurich;

  /// Timezone translation for europe_amsterdam
  ///
  /// In en, this message translates to:
  /// **'Europe / Amsterdam'**
  String get europe_amsterdam;

  /// Timezone translation for europe_belfast
  ///
  /// In en, this message translates to:
  /// **'Europe / Belfast'**
  String get europe_belfast;

  /// Timezone translation for europe_bratislava
  ///
  /// In en, this message translates to:
  /// **'Europe / Bratislava'**
  String get europe_bratislava;

  /// Timezone translation for europe_busingen
  ///
  /// In en, this message translates to:
  /// **'Europe / Büsingen'**
  String get europe_busingen;

  /// Timezone translation for europe_copenhagen
  ///
  /// In en, this message translates to:
  /// **'Europe / Copenhagen'**
  String get europe_copenhagen;

  /// Timezone translation for europe_guernsey
  ///
  /// In en, this message translates to:
  /// **'Europe / Guernsey'**
  String get europe_guernsey;

  /// Timezone translation for europe_isle_of_man
  ///
  /// In en, this message translates to:
  /// **'Europe / Isle of Man'**
  String get europe_isle_of_man;

  /// Timezone translation for europe_jersey
  ///
  /// In en, this message translates to:
  /// **'Europe / Jersey'**
  String get europe_jersey;

  /// Timezone translation for europe_kiev
  ///
  /// In en, this message translates to:
  /// **'Europe / Kiev'**
  String get europe_kiev;

  /// Timezone translation for europe_ljubljana
  ///
  /// In en, this message translates to:
  /// **'Europe / Ljubljana'**
  String get europe_ljubljana;

  /// Timezone translation for europe_luxembourg
  ///
  /// In en, this message translates to:
  /// **'Europe / Luxembourg'**
  String get europe_luxembourg;

  /// Timezone translation for europe_mariehamn
  ///
  /// In en, this message translates to:
  /// **'Europe / Mariehamn'**
  String get europe_mariehamn;

  /// Timezone translation for europe_monaco
  ///
  /// In en, this message translates to:
  /// **'Europe / Monaco'**
  String get europe_monaco;

  /// Timezone translation for europe_nicosia
  ///
  /// In en, this message translates to:
  /// **'Europe / Nicosia'**
  String get europe_nicosia;

  /// Timezone translation for europe_oslo
  ///
  /// In en, this message translates to:
  /// **'Europe / Oslo'**
  String get europe_oslo;

  /// Timezone translation for europe_podgorica
  ///
  /// In en, this message translates to:
  /// **'Europe / Podgorica'**
  String get europe_podgorica;

  /// Timezone translation for europe_san_marino
  ///
  /// In en, this message translates to:
  /// **'Europe / San Marino'**
  String get europe_san_marino;

  /// Timezone translation for europe_sarajevo
  ///
  /// In en, this message translates to:
  /// **'Europe / Sarajevo'**
  String get europe_sarajevo;

  /// Timezone translation for europe_skopje
  ///
  /// In en, this message translates to:
  /// **'Europe / Skopje'**
  String get europe_skopje;

  /// Timezone translation for europe_stockholm
  ///
  /// In en, this message translates to:
  /// **'Europe / Stockholm'**
  String get europe_stockholm;

  /// Timezone translation for europe_tiraspol
  ///
  /// In en, this message translates to:
  /// **'Europe / Tiraspol'**
  String get europe_tiraspol;

  /// Timezone translation for europe_uzhgorod
  ///
  /// In en, this message translates to:
  /// **'Europe / Uzhgorod'**
  String get europe_uzhgorod;

  /// Timezone translation for europe_vaduz
  ///
  /// In en, this message translates to:
  /// **'Europe / Vaduz'**
  String get europe_vaduz;

  /// Timezone translation for europe_vatican
  ///
  /// In en, this message translates to:
  /// **'Europe / Vatican'**
  String get europe_vatican;

  /// Timezone translation for europe_zagreb
  ///
  /// In en, this message translates to:
  /// **'Europe / Zagreb'**
  String get europe_zagreb;

  /// Timezone translation for europe_zaporozhye
  ///
  /// In en, this message translates to:
  /// **'Europe / Zaporozhye'**
  String get europe_zaporozhye;

  /// Timezone translation for factory
  ///
  /// In en, this message translates to:
  /// **'Factory'**
  String get factory;

  /// Timezone translation for indian_chagos
  ///
  /// In en, this message translates to:
  /// **'Indian / Chagos'**
  String get indian_chagos;

  /// Timezone translation for indian_maldives
  ///
  /// In en, this message translates to:
  /// **'Indian / Maldives'**
  String get indian_maldives;

  /// Timezone translation for indian_mauritius
  ///
  /// In en, this message translates to:
  /// **'Indian / Mauritius'**
  String get indian_mauritius;

  /// Timezone translation for pacific_apia
  ///
  /// In en, this message translates to:
  /// **'Pacific / Apia'**
  String get pacific_apia;

  /// Timezone translation for pacific_auckland
  ///
  /// In en, this message translates to:
  /// **'Pacific / Auckland'**
  String get pacific_auckland;

  /// Timezone translation for pacific_bougainville
  ///
  /// In en, this message translates to:
  /// **'Pacific / Bougainville'**
  String get pacific_bougainville;

  /// Timezone translation for pacific_chatham
  ///
  /// In en, this message translates to:
  /// **'Pacific / Chatham'**
  String get pacific_chatham;

  /// Timezone translation for pacific_easter
  ///
  /// In en, this message translates to:
  /// **'Pacific / Easter'**
  String get pacific_easter;

  /// Timezone translation for pacific_efate
  ///
  /// In en, this message translates to:
  /// **'Pacific / Efate'**
  String get pacific_efate;

  /// Timezone translation for pacific_fakaofo
  ///
  /// In en, this message translates to:
  /// **'Pacific / Fakaofo'**
  String get pacific_fakaofo;

  /// Timezone translation for pacific_fiji
  ///
  /// In en, this message translates to:
  /// **'Pacific / Fiji'**
  String get pacific_fiji;

  /// Timezone translation for pacific_galapagos
  ///
  /// In en, this message translates to:
  /// **'Pacific / Galapagos'**
  String get pacific_galapagos;

  /// Timezone translation for pacific_gambier
  ///
  /// In en, this message translates to:
  /// **'Pacific / Gambier'**
  String get pacific_gambier;

  /// Timezone translation for pacific_guadalcanal
  ///
  /// In en, this message translates to:
  /// **'Pacific / Guadalcanal'**
  String get pacific_guadalcanal;

  /// Timezone translation for pacific_guam
  ///
  /// In en, this message translates to:
  /// **'Pacific / Guam'**
  String get pacific_guam;

  /// Timezone translation for pacific_honolulu
  ///
  /// In en, this message translates to:
  /// **'Pacific / Honolulu'**
  String get pacific_honolulu;

  /// Timezone translation for pacific_kanton
  ///
  /// In en, this message translates to:
  /// **'Pacific / Kanton'**
  String get pacific_kanton;

  /// Timezone translation for pacific_kiritimati
  ///
  /// In en, this message translates to:
  /// **'Pacific / Kiritimati'**
  String get pacific_kiritimati;

  /// Timezone translation for pacific_kosrae
  ///
  /// In en, this message translates to:
  /// **'Pacific / Kosrae'**
  String get pacific_kosrae;

  /// Timezone translation for pacific_kwajalein
  ///
  /// In en, this message translates to:
  /// **'Pacific / Kwajalein'**
  String get pacific_kwajalein;

  /// Timezone translation for pacific_marquesas
  ///
  /// In en, this message translates to:
  /// **'Pacific / Marquesas'**
  String get pacific_marquesas;

  /// Timezone translation for pacific_nauru
  ///
  /// In en, this message translates to:
  /// **'Pacific / Nauru'**
  String get pacific_nauru;

  /// Timezone translation for pacific_niue
  ///
  /// In en, this message translates to:
  /// **'Pacific / Niue'**
  String get pacific_niue;

  /// Timezone translation for pacific_norfolk
  ///
  /// In en, this message translates to:
  /// **'Pacific / Norfolk'**
  String get pacific_norfolk;

  /// Timezone translation for pacific_noumea
  ///
  /// In en, this message translates to:
  /// **'Pacific / Noumea'**
  String get pacific_noumea;

  /// Timezone translation for pacific_pago_pago
  ///
  /// In en, this message translates to:
  /// **'Pacific / Pago Pago'**
  String get pacific_pago_pago;

  /// Timezone translation for pacific_palau
  ///
  /// In en, this message translates to:
  /// **'Pacific / Palau'**
  String get pacific_palau;

  /// Timezone translation for pacific_pitcairn
  ///
  /// In en, this message translates to:
  /// **'Pacific / Pitcairn'**
  String get pacific_pitcairn;

  /// Timezone translation for pacific_port_moresby
  ///
  /// In en, this message translates to:
  /// **'Pacific / Port Moresby'**
  String get pacific_port_moresby;

  /// Timezone translation for pacific_rarotonga
  ///
  /// In en, this message translates to:
  /// **'Pacific / Rarotonga'**
  String get pacific_rarotonga;

  /// Timezone translation for pacific_tahiti
  ///
  /// In en, this message translates to:
  /// **'Pacific / Tahiti'**
  String get pacific_tahiti;

  /// Timezone translation for pacific_tarawa
  ///
  /// In en, this message translates to:
  /// **'Pacific / Tarawa'**
  String get pacific_tarawa;

  /// Timezone translation for pacific_tongatapu
  ///
  /// In en, this message translates to:
  /// **'Pacific / Tongatapu'**
  String get pacific_tongatapu;

  /// Timezone translation for pacific_chuuk
  ///
  /// In en, this message translates to:
  /// **'Pacific / Chuuk'**
  String get pacific_chuuk;

  /// Timezone translation for pacific_enderbury
  ///
  /// In en, this message translates to:
  /// **'Pacific / Enderbury'**
  String get pacific_enderbury;

  /// Timezone translation for pacific_funafuti
  ///
  /// In en, this message translates to:
  /// **'Pacific / Funafuti'**
  String get pacific_funafuti;

  /// Timezone translation for pacific_johnston
  ///
  /// In en, this message translates to:
  /// **'Pacific / Johnston'**
  String get pacific_johnston;

  /// Timezone translation for pacific_majuro
  ///
  /// In en, this message translates to:
  /// **'Pacific / Majuro'**
  String get pacific_majuro;

  /// Timezone translation for pacific_midway
  ///
  /// In en, this message translates to:
  /// **'Pacific / Midway'**
  String get pacific_midway;

  /// Timezone translation for pacific_pohnpei
  ///
  /// In en, this message translates to:
  /// **'Pacific / Pohnpei'**
  String get pacific_pohnpei;

  /// Timezone translation for pacific_ponape
  ///
  /// In en, this message translates to:
  /// **'Pacific / Ponape'**
  String get pacific_ponape;

  /// Timezone translation for pacific_saipan
  ///
  /// In en, this message translates to:
  /// **'Pacific / Saipan'**
  String get pacific_saipan;

  /// Timezone translation for pacific_samoa
  ///
  /// In en, this message translates to:
  /// **'Pacific / Samoa'**
  String get pacific_samoa;

  /// Timezone translation for pacific_truk
  ///
  /// In en, this message translates to:
  /// **'Pacific / Truk'**
  String get pacific_truk;

  /// Timezone translation for pacific_wake
  ///
  /// In en, this message translates to:
  /// **'Pacific / Wake'**
  String get pacific_wake;

  /// Timezone translation for pacific_wallis
  ///
  /// In en, this message translates to:
  /// **'Pacific / Wallis'**
  String get pacific_wallis;

  /// Timezone translation for pacific_yap
  ///
  /// In en, this message translates to:
  /// **'Pacific / Yap'**
  String get pacific_yap;

  /// Timezone translation for brazil_acre
  ///
  /// In en, this message translates to:
  /// **'Brazil / Acre'**
  String get brazil_acre;

  /// Timezone translation for brazil_denoronha
  ///
  /// In en, this message translates to:
  /// **'Brazil / De Noronha'**
  String get brazil_denoronha;

  /// Timezone translation for brazil_east
  ///
  /// In en, this message translates to:
  /// **'Brazil / East'**
  String get brazil_east;

  /// Timezone translation for brazil_west
  ///
  /// In en, this message translates to:
  /// **'Brazil / West'**
  String get brazil_west;

  /// Timezone translation for cet
  ///
  /// In en, this message translates to:
  /// **'Central European Time'**
  String get cet;

  /// Timezone translation for cst6cdt
  ///
  /// In en, this message translates to:
  /// **'Central Standard Time (US)'**
  String get cst6cdt;

  /// Timezone translation for canada_atlantic
  ///
  /// In en, this message translates to:
  /// **'Canada / Atlantic'**
  String get canada_atlantic;

  /// Timezone translation for canada_central
  ///
  /// In en, this message translates to:
  /// **'Canada / Central'**
  String get canada_central;

  /// Timezone translation for canada_eastern
  ///
  /// In en, this message translates to:
  /// **'Canada / Eastern'**
  String get canada_eastern;

  /// Timezone translation for canada_mountain
  ///
  /// In en, this message translates to:
  /// **'Canada / Mountain'**
  String get canada_mountain;

  /// Timezone translation for canada_newfoundland
  ///
  /// In en, this message translates to:
  /// **'Canada / Newfoundland'**
  String get canada_newfoundland;

  /// Timezone translation for canada_pacific
  ///
  /// In en, this message translates to:
  /// **'Canada / Pacific'**
  String get canada_pacific;

  /// Timezone translation for canada_saskatchewan
  ///
  /// In en, this message translates to:
  /// **'Canada / Saskatchewan'**
  String get canada_saskatchewan;

  /// Timezone translation for canada_yukon
  ///
  /// In en, this message translates to:
  /// **'Canada / Yukon'**
  String get canada_yukon;

  /// Timezone translation for chile_continental
  ///
  /// In en, this message translates to:
  /// **'Chile / Continental'**
  String get chile_continental;

  /// Timezone translation for chile_easterisland
  ///
  /// In en, this message translates to:
  /// **'Chile / Easter Island'**
  String get chile_easterisland;

  /// Timezone translation for cuba
  ///
  /// In en, this message translates to:
  /// **'Cuba'**
  String get cuba;

  /// Timezone translation for eet
  ///
  /// In en, this message translates to:
  /// **'Eastern European Time'**
  String get eet;

  /// Timezone translation for est
  ///
  /// In en, this message translates to:
  /// **'Eastern Standard Time'**
  String get est;

  /// Timezone translation for est5edt
  ///
  /// In en, this message translates to:
  /// **'Eastern Standard Time (US)'**
  String get est5edt;

  /// Timezone translation for egypt
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// Timezone translation for eire
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get eire;

  /// Timezone translation for gb
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get gb;

  /// Timezone translation for gb_eire
  ///
  /// In en, this message translates to:
  /// **'United Kingdom / Ireland'**
  String get gb_eire;

  /// Timezone translation for gmt
  ///
  /// In en, this message translates to:
  /// **'Greenwich Mean Time'**
  String get gmt;

  /// Timezone translation for gmt_plus_0
  ///
  /// In en, this message translates to:
  /// **'GMT+0'**
  String get gmt_plus_0;

  /// Timezone translation for gmt_minus_0
  ///
  /// In en, this message translates to:
  /// **'GMT-0'**
  String get gmt_minus_0;

  /// Timezone translation for gmt0
  ///
  /// In en, this message translates to:
  /// **'GMT0'**
  String get gmt0;

  /// Timezone translation for greenwich
  ///
  /// In en, this message translates to:
  /// **'Greenwich'**
  String get greenwich;

  /// Timezone translation for hst
  ///
  /// In en, this message translates to:
  /// **'Hawaii Standard Time'**
  String get hst;

  /// Timezone translation for hongkong
  ///
  /// In en, this message translates to:
  /// **'Hong Kong'**
  String get hongkong;

  /// Timezone translation for iceland
  ///
  /// In en, this message translates to:
  /// **'Iceland'**
  String get iceland;

  /// Timezone translation for indian_antananarivo
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Antananarivo'**
  String get indian_antananarivo;

  /// Timezone translation for indian_christmas
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Christmas Island'**
  String get indian_christmas;

  /// Timezone translation for indian_cocos
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Cocos Islands'**
  String get indian_cocos;

  /// Timezone translation for indian_comoro
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Comoros'**
  String get indian_comoro;

  /// Timezone translation for indian_kerguelen
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Kerguelen'**
  String get indian_kerguelen;

  /// Timezone translation for indian_mahe
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Mahé'**
  String get indian_mahe;

  /// Timezone translation for indian_mayotte
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Mayotte'**
  String get indian_mayotte;

  /// Timezone translation for indian_reunion
  ///
  /// In en, this message translates to:
  /// **'Indian Ocean / Réunion'**
  String get indian_reunion;

  /// Timezone translation for iran
  ///
  /// In en, this message translates to:
  /// **'Iran'**
  String get iran;

  /// Timezone translation for israel
  ///
  /// In en, this message translates to:
  /// **'Israel'**
  String get israel;

  /// Timezone translation for jamaica
  ///
  /// In en, this message translates to:
  /// **'Jamaica'**
  String get jamaica;

  /// Timezone translation for japan
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get japan;

  /// Timezone translation for kwajalein
  ///
  /// In en, this message translates to:
  /// **'Kwajalein'**
  String get kwajalein;

  /// Timezone translation for libya
  ///
  /// In en, this message translates to:
  /// **'Libya'**
  String get libya;

  /// Timezone translation for met
  ///
  /// In en, this message translates to:
  /// **'Middle European Time'**
  String get met;

  /// Timezone translation for mst
  ///
  /// In en, this message translates to:
  /// **'Mountain Standard Time'**
  String get mst;

  /// Timezone translation for mst7mdt
  ///
  /// In en, this message translates to:
  /// **'Mountain Time (US)'**
  String get mst7mdt;

  /// Timezone translation for mexico_bajanorte
  ///
  /// In en, this message translates to:
  /// **'Mexico / Baja Norte'**
  String get mexico_bajanorte;

  /// Timezone translation for mexico_bajasur
  ///
  /// In en, this message translates to:
  /// **'Mexico / Baja Sur'**
  String get mexico_bajasur;

  /// Timezone translation for mexico_general
  ///
  /// In en, this message translates to:
  /// **'Mexico / General'**
  String get mexico_general;

  /// Timezone translation for nz
  ///
  /// In en, this message translates to:
  /// **'New Zealand'**
  String get nz;

  /// Timezone translation for nz_chat
  ///
  /// In en, this message translates to:
  /// **'New Zealand / Chatham'**
  String get nz_chat;

  /// Timezone translation for navajo
  ///
  /// In en, this message translates to:
  /// **'Navajo'**
  String get navajo;

  /// Timezone translation for prc
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get prc;

  /// Timezone translation for pst8pdt
  ///
  /// In en, this message translates to:
  /// **'Pacific Time (US)'**
  String get pst8pdt;

  /// Timezone translation for poland
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get poland;

  /// Timezone translation for portugal
  ///
  /// In en, this message translates to:
  /// **'Portugal'**
  String get portugal;

  /// Timezone translation for roc
  ///
  /// In en, this message translates to:
  /// **'Republic of China (Taiwan)'**
  String get roc;

  /// Timezone translation for rok
  ///
  /// In en, this message translates to:
  /// **'Republic of Korea'**
  String get rok;

  /// Timezone translation for singapore
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get singapore;

  /// Timezone translation for turkey
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get turkey;

  /// Timezone translation for uct
  ///
  /// In en, this message translates to:
  /// **'Coordinated Universal Time'**
  String get uct;

  /// Timezone translation for us_alaska
  ///
  /// In en, this message translates to:
  /// **'United States / Alaska'**
  String get us_alaska;

  /// Timezone translation for us_aleutian
  ///
  /// In en, this message translates to:
  /// **'United States / Aleutian'**
  String get us_aleutian;

  /// Timezone translation for us_arizona
  ///
  /// In en, this message translates to:
  /// **'United States / Arizona'**
  String get us_arizona;

  /// Timezone translation for us_central
  ///
  /// In en, this message translates to:
  /// **'United States / Central'**
  String get us_central;

  /// Timezone translation for us_east_indiana
  ///
  /// In en, this message translates to:
  /// **'United States / East Indiana'**
  String get us_east_indiana;

  /// Timezone translation for us_eastern
  ///
  /// In en, this message translates to:
  /// **'United States / Eastern'**
  String get us_eastern;

  /// Timezone translation for us_hawaii
  ///
  /// In en, this message translates to:
  /// **'United States / Hawaii'**
  String get us_hawaii;

  /// Timezone translation for us_indiana_starke
  ///
  /// In en, this message translates to:
  /// **'United States / Indiana Starke'**
  String get us_indiana_starke;

  /// Timezone translation for us_michigan
  ///
  /// In en, this message translates to:
  /// **'United States / Michigan'**
  String get us_michigan;

  /// Timezone translation for us_mountain
  ///
  /// In en, this message translates to:
  /// **'United States / Mountain'**
  String get us_mountain;

  /// Timezone translation for us_pacific
  ///
  /// In en, this message translates to:
  /// **'United States / Pacific'**
  String get us_pacific;

  /// Timezone translation for us_samoa
  ///
  /// In en, this message translates to:
  /// **'United States / Samoa'**
  String get us_samoa;

  /// Timezone translation for utc
  ///
  /// In en, this message translates to:
  /// **'Coordinated Universal Time'**
  String get utc;

  /// Timezone translation for universal
  ///
  /// In en, this message translates to:
  /// **'Universal Time'**
  String get universal;

  /// Timezone translation for w_su
  ///
  /// In en, this message translates to:
  /// **'Western Soviet Union'**
  String get w_su;

  /// Timezone translation for wet
  ///
  /// In en, this message translates to:
  /// **'Western European Time'**
  String get wet;

  /// Timezone translation for zulu
  ///
  /// In en, this message translates to:
  /// **'Zulu Time'**
  String get zulu;
}

class _TimezonesLocalizationsDelegate
    extends LocalizationsDelegate<TimezonesLocalizations> {
  const _TimezonesLocalizationsDelegate();

  @override
  Future<TimezonesLocalizations> load(Locale locale) {
    return SynchronousFuture<TimezonesLocalizations>(
      lookupTimezonesLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_TimezonesLocalizationsDelegate old) => false;
}

TimezonesLocalizations lookupTimezonesLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return TimezonesLocalizationsEn();
    case 'es':
      return TimezonesLocalizationsEs();
    case 'fr':
      return TimezonesLocalizationsFr();
  }

  throw FlutterError(
    'TimezonesLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
