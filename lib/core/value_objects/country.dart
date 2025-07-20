/// Using Latin-character country code
library;

import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
// ignore_for_file: constant_identifier_names

enum Country {
  // @JsonValue(0)

  // /// Andorra
  // AD,

  // @JsonValue(1)

  // /// United Arab Emirates
  // AE,

  // @JsonValue(2)

  // /// Afghanistan
  // AF,

  // @JsonValue(3)

  // /// Antigua and Barbuda
  // AG,
  // @JsonValue(4)

  // /// Anguilla
  // AI,
  // @JsonValue(5)

  // /// Albania
  // AL,

  // @JsonValue(6)

  // /// Armenia
  // AM,

  // @JsonValue(7)

  // /// Angola
  // AO,

  // @JsonValue(8)

  // /// Argentina
  // AR,

  // @JsonValue(9)

  // /// American Samoa
  // AS,

  // @JsonValue(10)

  // /// Austria
  // AT,

  // @JsonValue(11)

  // /// Australia
  // AU,

  // @JsonValue(12)

  // /// Aruba
  // AW,

  // @JsonValue(13)

  // /// Åland Islands
  // AX,

  // @JsonValue(14)

  // /// Azerbaijan
  // AZ,

  // @JsonValue(15)

  // /// Bosnia and Herzegovina
  // BA,

  // @JsonValue(16)

  // /// Barbados
  // BB,

  // @JsonValue(17)

  // /// Bangladesh
  // BD,

  // @JsonValue(18)

  // /// Belgium
  // BE,

  // @JsonValue(19)

  // /// Burkina Faso
  // BF,

  // @JsonValue(20)

  // /// Bulgaria
  // BG,

  // @JsonValue(21)

  // /// Bahrain
  // BH,

  // @JsonValue(22)

  // /// Burundi
  // BI,

  // @JsonValue(23)

  // /// Benin
  // BJ,

  // @JsonValue(24)

  // /// Saint Barthélemy
  // BL,

  // @JsonValue(25)

  // /// Bermuda
  // BM,

  // @JsonValue(26)

  // /// Brunei Darussalam
  // BN,

  // @JsonValue(27)

  // /// Bolivia (Plurinational State of)
  // BO,

  // @JsonValue(28)

  // /// Bonaire, Sint Eustatius and Saba
  // BQ,

  // @JsonValue(29)

  // /// Brazil
  // BR,

  // @JsonValue(30)

  // /// Bahamas
  // BS,

  // @JsonValue(31)

  // /// Bhutan
  // BT,

  // @JsonValue(32)

  // /// Bouvet Island
  // BV,

  // @JsonValue(33)

  // /// Botswana
  // BW,

  // @JsonValue(34)

  // /// Belarus
  // BY,

  // @JsonValue(35)

  // /// Belize
  // BZ,

  // @JsonValue(36)

  // /// Canada
  // CA,

  // @JsonValue(37)

  // /// Cocos (Keeling) Islands
  // CC,

  // @JsonValue(38)

  // /// Congo (Democratic Republic of the)
  // CD,

  // @JsonValue(39)

  // /// Central African Republic
  // CF,

  // @JsonValue(40)

  // /// Congo
  // CG,

  // @JsonValue(41)

  // /// Switzerland
  // CH,

  // @JsonValue(42)

  // /// Côte d'Ivoire
  // CI,

  // @JsonValue(43)

  // /// Cook Islands
  // CK,

  // @JsonValue(44)

  // /// Chile
  // CL,

  // @JsonValue(45)

  // /// Cameroon
  // CM,

  // @JsonValue(46)

  // /// China
  // CN,

  // @JsonValue(47)

  // /// Colombia
  // CO,

  // @JsonValue(48)

  // /// Costa Rica
  // CR,

  // @JsonValue(49)

  // /// Cuba
  // CU,

  // @JsonValue(50)

  // /// Cabo Verde
  // CV,

  // @JsonValue(51)

  // /// Curaçao
  // CW,

  // @JsonValue(52)

  // /// Christmas Island
  // CX,

  // @JsonValue(53)

  // /// Cyprus
  // CY,

  // @JsonValue(54)

  // /// Czech Republic
  // CZ,

  // @JsonValue(55)

  // /// Germany
  // DE,

  // @JsonValue(56)

  // /// Djibouti
  // DJ,

  // @JsonValue(57)

  // /// Denmark
  // DK,

  // @JsonValue(58)

  // /// Dominica
  // DM,

  // @JsonValue('DO')

  /// Dominican Republic
  DO('DO'),

  // @JsonValue(60)

  // /// Algeria
  // DZ,

  // @JsonValue(61)

  // /// Ecuador
  // EC,

  // @JsonValue(62)

  // /// Estonia
  // EE,

  // @JsonValue(63)

  // /// Egypt
  // EG,

  // @JsonValue(64)

  // /// Western Sahara
  // EH,

  // @JsonValue(65)

  // /// Eritrea
  // ER,

  // @JsonValue(66)

  // /// Spain
  // ES,

  // @JsonValue(67)

  // /// Ethiopia
  // ET,

  // @JsonValue(68)

  // /// Finland
  // FI,

  // @JsonValue(69)

  // /// Fiji
  // FJ,

  // @JsonValue(70)

  // /// Falkland Islands (Malvinas)
  // FK,

  // @JsonValue(71)

  // /// Micronesia (Federated States of)
  // FM,

  // @JsonValue(72)

  // /// Faroe Islands
  // FO,

  // @JsonValue(73)

  // /// France
  // FR,

  // @JsonValue(74)

  // /// Gabon
  // GA,

  // @JsonValue(75)

  // /// United Kingdom of Great Britain and Northern Ireland
  // GB,

  // @JsonValue(76)

  // /// Grenada
  // GD,

  // @JsonValue(77)

  // /// Georgia
  // GE,

  // @JsonValue(78)

  // /// French Guiana
  // GF,

  // @JsonValue(79)

  // /// Guernsey
  // GG,

  // @JsonValue(80)

  // /// Ghana
  // GH,

  // @JsonValue(81)

  // /// Gibraltar
  // GI,

  // @JsonValue(82)

  // /// Greenland
  // GL,

  // @JsonValue(83)

  // /// Gambia
  // GM,

  // @JsonValue(84)

  // /// Guinea
  // GN,

  // @JsonValue(85)

  // /// Guadeloupe
  // GP,

  // @JsonValue(86)

  // /// Equatorial Guinea
  // GQ,

  // @JsonValue(87)

  // /// Greece
  // GR,

  // @JsonValue(88)

  // /// South Georgia and the South Sandwich Islands
  // GS,

  // @JsonValue('GT')

  /// Guatemala
  GT('GT'),

  // @JsonValue(90)

  // /// Guam
  // GU,

  // @JsonValue(91)

  // /// Guinea-Bissau
  // GW,

  // @JsonValue(92)

  // /// Guyana
  // GY,

  // @JsonValue(93)

  // /// Hong Kong
  // HK,

  // @JsonValue(94)

  // /// Heard Island and McDonald Islands
  // HM,

  // @JsonValue(95)

  // /// Honduras
  // HN,

  // @JsonValue(96)

  // /// Croatia
  // HR,

  // @JsonValue(97)

  // /// Haiti
  // HT,

  // @JsonValue(98)

  // /// Hungary
  // HU,

  // @JsonValue(99)

  // /// Indonesia
  // ID,

  // @JsonValue(100)

  // /// Ireland
  // IE,

  // @JsonValue(101)

  // /// Israel
  // IL,

  // @JsonValue(102)

  // /// Isle of Man
  // IM,

  // @JsonValue(103)

  // /// India
  // IN,

  // @JsonValue(104)

  // /// British Indian Ocean Territory
  // IO,

  // @JsonValue(105)

  // /// Iraq
  // IQ,

  // @JsonValue(106)

  // /// Iran (Islamic Republic of)
  // IR,

  // @JsonValue(107)

  // /// Iceland
  // IS,

  // @JsonValue(108)

  // /// Italy
  // IT,

  // @JsonValue(109)

  // /// Jersey
  // JE,

  // @JsonValue(110)

  // /// Jamaica
  // JM,

  // @JsonValue(111)

  // /// Jordan
  // JO,

  // @JsonValue(112)

  // /// Japan
  // JP,

  // @JsonValue(113)

  // /// Kenya
  // KE,

  // @JsonValue(114)

  // /// Kyrgyzstan
  // KG,

  // @JsonValue(115)

  // /// Cambodia
  // KH,

  // @JsonValue(116)

  // /// Kiribati
  // KI,

  // @JsonValue(117)

  // /// Comoros
  // KM,

  // @JsonValue(118)

  // /// Saint Kitts and Nevis
  // KN,

  // @JsonValue(119)

  // /// Korea (Democratic People's Republic of)
  // KP,

  // @JsonValue(120)

  // /// Korea (Republic of)
  // KR,

  // @JsonValue(121)

  // /// Kuwait
  // KW,

  // @JsonValue(122)

  // /// Cayman Islands
  // KY,

  // @JsonValue(123)

  // /// Kazakhstan
  // KZ,

  // @JsonValue(124)

  // /// Lao People's Democratic Republic
  // LA,

  // @JsonValue(125)

  // /// Lebanon
  // LB,

  // @JsonValue(126)

  // /// Saint Lucia
  // LC,

  // @JsonValue(127)

  // /// Liechtenstein
  // LI,

  // @JsonValue(128)

  // /// Sri Lanka
  // LK,

  // @JsonValue(129)

  // /// Liberia
  // LR,

  // @JsonValue(130)

  // /// Lesotho
  // LS,

  // @JsonValue(131)

  // /// Lithuania
  // LT,

  // @JsonValue(132)

  // /// Luxembourg
  // LU,

  // @JsonValue(133)

  // /// Latvia
  // LV,

  // @JsonValue(134)

  // /// Libya
  // LY,

  // @JsonValue(135)

  // /// Morocco
  // MA,

  // @JsonValue(136)

  // /// Monaco
  // MC,

  // @JsonValue(137)

  // /// Moldova (Republic of)
  // MD,

  // @JsonValue(138)

  // /// Montenegro
  // ME,

  // @JsonValue(139)

  // /// Saint Martin (French part)
  // MF,

  // @JsonValue(140)

  // /// Madagascar
  // MG,

  // @JsonValue(141)

  // /// Marshall Islands
  // MH,

  // @JsonValue(142)

  // /// North Macedonia
  // MK,

  // @JsonValue(143)

  // /// Mali
  // ML,

  // @JsonValue(144)

  // /// Myanmar
  // MM,

  // @JsonValue(145)

  // /// Mongolia
  // MN,

  // @JsonValue(146)

  // /// Macao
  // MO,

  // @JsonValue(147)

  // /// Northern Mariana Islands
  // MP,

  // @JsonValue(148)

  // /// Martinique
  // MQ,

  // @JsonValue(149)

  // /// Mauritania
  // MR,

  // @JsonValue(150)

  // /// Montserrat
  // MS,

  // @JsonValue(151)

  // /// Malta
  // MT,

  // @JsonValue(152)

  // /// Mauritius
  // MU,

  // @JsonValue(153)

  // /// Maldives
  // MV,

  // @JsonValue(154)

  // /// Malawi
  // MW,

  // @JsonValue(155)

  // /// Mexico
  // MX,

  // @JsonValue(156)

  // /// Malaysia
  // MY,

  // @JsonValue(157)

  // /// Mozambique
  // MZ,

  // @JsonValue(158)

  // /// Namibia
  // NA,

  // @JsonValue(159)

  // /// New Caledonia
  // NC,

  // @JsonValue(160)

  // /// Niger
  // NE,

  // @JsonValue(161)

  // /// Norfolk Island
  // NF,

  // @JsonValue(162)

  // /// Nigeria
  // NG,

  // @JsonValue(163)

  // /// Nicaragua
  // NI,

  // @JsonValue(164)

  // /// Netherlands
  // NL,

  // @JsonValue(165)

  // /// Norway
  // NO,

  // @JsonValue(166)

  // /// Nepal
  // NP,

  // @JsonValue(167)

  // /// Nauru
  // NR,

  // @JsonValue(168)

  // /// Niue
  // NU,

  // @JsonValue(169)

  // /// New Zealand
  // NZ,

  // @JsonValue(170)

  // /// Oman
  // OM,

  // @JsonValue(171)

  // /// Panama
  // PA,

  // @JsonValue(172)

  // /// Peru
  // PE,

  // @JsonValue(173)

  // /// French Polynesia
  // PF,

  // @JsonValue(174)

  // /// Papua New Guinea
  // PG,

  // @JsonValue(175)

  // /// Philippines
  // PH,

  // @JsonValue(176)

  // /// Pakistan
  // PK,

  // @JsonValue(177)

  // /// Poland
  // PL,

  // @JsonValue(178)

  // /// Saint Pierre and Miquelon
  // PM,

  // @JsonValue(179)

  // /// Pitcairn
  // PN,

  // @JsonValue(180)

  // /// Puerto Rico
  // PR,

  // @JsonValue(181)

  // /// Palestine, State of
  // PS,

  // @JsonValue(182)

  // /// Portugal
  // PT,

  // @JsonValue(183)

  // /// Palau
  // PW,

  // @JsonValue(184)

  // /// Paraguay
  // PY,

  // @JsonValue(185)

  // /// Qatar
  // QA,

  // @JsonValue(186)

  // /// Réunion
  // RE,

  // @JsonValue(187)

  // /// Romania
  // RO,

  // @JsonValue(188)

  // /// Serbia
  // RS,

  // @JsonValue(189)

  // /// Russian Federation
  // RU,

  // @JsonValue(190)

  // /// Rwanda
  // RW,

  // @JsonValue(191)

  // /// Saudi Arabia
  // SA,

  // @JsonValue(192)

  // /// Solomon Islands
  // SB,

  // @JsonValue(193)

  // /// Seychelles
  // SC,

  // @JsonValue(194)

  // /// Sudan
  // SD,

  // @JsonValue(195)

  // /// Sweden
  // SE,

  // @JsonValue(196)

  // /// Singapore
  // SG,

  // @JsonValue(197)

  // /// Saint Helena, Ascension and Tristan da Cunha
  // SH,

  // @JsonValue(198)

  // /// Slovenia
  // SI,

  // @JsonValue(199)

  // /// Svalbard and Jan Mayen
  // SJ,

  // @JsonValue(200)

  // /// Slovakia
  // SK,

  // @JsonValue(201)

  // /// Sierra Leone
  // SL,

  // @JsonValue(202)

  // /// San Marino
  // SM,

  // @JsonValue(203)

  // /// Senegal
  // SN,

  // @JsonValue(204)

  // /// Somalia
  // SO,

  // @JsonValue(205)

  // /// Suriname
  // SR,

  // @JsonValue(206)

  // /// South Sudan
  // SS,

  // @JsonValue(207)

  // /// Sao Tome and Principe
  // ST,

  // @JsonValue(208)

  // /// El Salvador
  // SV,

  // @JsonValue(209)

  // /// Sint Maarten (Dutch part)
  // SX,

  // @JsonValue(210)

  // /// Syrian Arab Republic
  // SY,

  // @JsonValue(211)

  // /// Eswatini
  // SZ,

  // @JsonValue(212)

  // /// Turks and Caicos Islands
  // TC,

  // @JsonValue(213)

  // /// Chad
  // TD,

  // @JsonValue(214)

  // /// French Southern Territories
  // TF,

  // @JsonValue(215)

  // /// Togo
  // TG,

  // @JsonValue(216)

  // /// Thailand
  // TH,

  // @JsonValue(217)

  // /// Tajikistan
  // TJ,

  // @JsonValue(218)

  // /// Tokelau
  // TK,

  // @JsonValue(219)

  // /// Timor-Leste
  // TL,

  // @JsonValue(220)

  // /// Turkmenistan
  // TM,

  // @JsonValue(221)

  // /// Tunisia
  // TN,

  // @JsonValue(222)

  // /// Tonga
  // TO,

  // @JsonValue(223)

  // /// Turkey
  // TR,

  // @JsonValue(224)

  // /// Trinidad and Tobago
  // TT,

  // @JsonValue(225)

  // /// Tuvalu
  // TV,

  // @JsonValue(226)

  // /// Taiwan
  // TW,

  // @JsonValue(227)

  // /// Tanzania, United Republic of
  // TZ,

  // @JsonValue(228)

  // /// Ukraine
  // UA,

  // @JsonValue(229)

  // /// Uganda
  // UG,

  // @JsonValue(230)

  // /// United States Minor Outlying Islands
  // UM,

  // @JsonValue('US')
  /// United States of America
  US('US');

  // @JsonValue(232)

  // /// Uruguay
  // UY,

  // @JsonValue(233)

  // /// Uzbekistan
  // UZ,

  // @JsonValue(234)

  // /// Holy See
  // VA,

  // @JsonValue(235)

  // /// Saint Vincent and the Grenadines
  // VC,

  // @JsonValue(236)

  // /// Venezuela (Bolivarian Republic of)
  // VE,

  // @JsonValue(237)

  // /// Virgin Islands (British)
  // VG,

  // @JsonValue(238)

  // /// Virgin Islands (U.S.)
  // VI,

  // @JsonValue(239)

  // /// Viet Nam
  // VN,

  // @JsonValue(240)

  // /// Vanuatu
  // VU,

  // @JsonValue(241)

  // /// Wallis and Futuna
  // WF,

  // @JsonValue(242)

  // /// Samoa
  // WS,

  // @JsonValue(243)

  // /// Yemen
  // YE,

  // @JsonValue(244)

  // /// Mayotte
  // YT,

  // @JsonValue(245)

  // /// South Africa
  // ZA,

  // @JsonValue(246)

  // /// Zambia
  // ZM,

  // @JsonValue(247)

  // /// Zimbabwe
  // ZW,

  const Country(this.value);
  final String value;
}

String emoji(Country country) {
  return switch (country) {
    Country.US => '🇺🇸',
    Country.DO => '🇩🇴',
    Country.GT => '🇬🇹',
  };
}

String callingCode(Country country) {
  return switch (country) {
    Country.US => '+1',
    Country.DO => '+1',
    Country.GT => '+502',
  };
}

String country(Country country, BuildContext context) {
  return switch (country) {
    // Country.AD => AppLocalizations.of(context)!.countryAndorra,
    // Country.AE => AppLocalizations.of(context)!.countryUnitedArabEmirates,
    // Country.AF => AppLocalizations.of(context)!.countryAfghanistan,
    // Country.AG => AppLocalizations.of(context)!.countryAntiguaAndBarbuda,
    // Country.AI => AppLocalizations.of(context)!.countryAnguilla,
    // Country.AL => AppLocalizations.of(context)!.countryAlbania,
    // Country.AM => AppLocalizations.of(context)!.countryArmenia,
    // Country.AO => AppLocalizations.of(context)!.countryAngola,
    // Country.AR => AppLocalizations.of(context)!.countryArgentina,
    // Country.AS => AppLocalizations.of(context)!.countryAmericanSamoa,
    // Country.AT => AppLocalizations.of(context)!.countryAustria,
    // Country.AU => AppLocalizations.of(context)!.countryAustralia,
    // Country.AW => AppLocalizations.of(context)!.countryAruba,
    // Country.AX => AppLocalizations.of(context)!.countryAlandIslands,
    // Country.AZ => AppLocalizations.of(context)!.countryAzerbaijan,
    // Country.BA => AppLocalizations.of(context)!.countryBosniaAndHerzegovina,
    // Country.BB => AppLocalizations.of(context)!.countryBarbados,
    // Country.BD => AppLocalizations.of(context)!.countryBangladesh,
    // Country.BE => AppLocalizations.of(context)!.countryBelgium,
    // Country.BF => AppLocalizations.of(context)!.countryBurkinaFaso,
    // Country.BG => AppLocalizations.of(context)!.countryBulgaria,
    // Country.BH => AppLocalizations.of(context)!.countryBahrain,
    // Country.BI => AppLocalizations.of(context)!.countryBurundi,
    // Country.BJ => AppLocalizations.of(context)!.countryBenin,
    // Country.BL => AppLocalizations.of(context)!.countrySaintBarthelemy,
    // Country.BM => AppLocalizations.of(context)!.countryBermuda,
    // Country.BN => AppLocalizations.of(context)!.countryBruneiDarussalam,
    // Country.BO => AppLocalizations.of(context)!.countryBolivia,
    // Country.BQ => AppLocalizations.of(context)!.countryBonaireSintEustatiusAndSaba,
    // Country.BR => AppLocalizations.of(context)!.countryBrazil,
    // Country.BS => AppLocalizations.of(context)!.countryBahamas,
    // Country.BT => AppLocalizations.of(context)!.countryBhutan,
    // Country.BV => AppLocalizations.of(context)!.countryBouvetIsland,
    // Country.BW => AppLocalizations.of(context)!.countryBotswana,
    // Country.BY => AppLocalizations.of(context)!.countryBelarus,
    // Country.BZ => AppLocalizations.of(context)!.countryBelize,
    // Country.CA => AppLocalizations.of(context)!.countryCanada,
    // Country.CC => AppLocalizations.of(context)!.countryCocosKeelingIslands,
    // Country.CD => AppLocalizations.of(context)!.countryCongoDemocraticRepublicOfThe,
    // Country.CF => AppLocalizations.of(context)!.countryCentralAfricanRepublic,
    // Country.CG => AppLocalizations.of(context)!.countryCongo,
    // Country.CH => AppLocalizations.of(context)!.countrySwitzerland,
    // Country.CI => AppLocalizations.of(context)!.countryCôteDivoire,
    // Country.CK => AppLocalizations.of(context)!.countryCookIslands,
    // Country.CL => AppLocalizations.of(context)!.countryChile,
    // Country.CM => AppLocalizations.of(context)!.countryCameroon,
    // Country.CN => AppLocalizations.of(context)!.countryChina,
    // Country.CO => AppLocalizations.of(context)!.countryColombia,
    // Country.CR => AppLocalizations.of(context)!.countryCostaRica,
    // Country.CU => AppLocalizations.of(context)!.countryCuba,
    // Country.CV => AppLocalizations.of(context)!.countryCaboVerde,
    // Country.CW => AppLocalizations.of(context)!.countryCuraçao,
    // Country.CX => AppLocalizations.of(context)!.countryChristmasIsland,
    // Country.CY => AppLocalizations.of(context)!.countryCyprus,
    // Country.CZ => AppLocalizations.of(context)!.countryCzechia,
    // Country.DE => AppLocalizations.of(context)!.countryGermany,
    // Country.DJ => AppLocalizations.of(context)!.countryDjibouti,
    // Country.DK => AppLocalizations.of(context)!.countryDenmark,
    // Country.DM => AppLocalizations.of(context)!.countryDominica,
    Country.DO => AppLocalizations.of(context)!.countryDominicanRepublic,
    // Country.DZ => AppLocalizations.of(context)!.countryAlgeria,
    // Country.EC => AppLocalizations.of(context)!.countryEcuador,
    // Country.EE => AppLocalizations.of(context)!.countryEstonia,
    // Country.EG => AppLocalizations.of(context)!.countryEgypt,
    // Country.EH => AppLocalizations.of(context)!.countryWesternSahara,
    // Country.ER => AppLocalizations.of(context)!.countryEritrea,
    // Country.ES => AppLocalizations.of(context)!.countrySpain,
    // Country.ET => AppLocalizations.of(context)!.countryEthiopia,
    // Country.FI => AppLocalizations.of(context)!.countryFinland,
    // Country.FJ => AppLocalizations.of(context)!.countryFiji,
    // Country.FK => AppLocalizations.of(context)!.countryFalklandIslandsMalvinas,
    // Country.FM => AppLocalizations.of(context)!.countryMicronesiaFederatedStatesOf,
    // Country.FO => AppLocalizations.of(context)!.countryFaroeIslands,
    // Country.FR => AppLocalizations.of(context)!.countryFrance,
    // Country.GA => AppLocalizations.of(context)!.countryGabon,
    // Country.GB => AppLocalizations.of(context)!.countryUnitedKingdomOfGreatBritainAndNorthernIreland,
    // Country.GD => AppLocalizations.of(context)!.countryGrenada,
    // Country.GE => AppLocalizations.of(context)!.countryGeorgia,
    // Country.GF => AppLocalizations.of(context)!.countryFrenchGuiana,
    // Country.GG => AppLocalizations.of(context)!.countryGuernsey,
    // Country.GH => AppLocalizations.of(context)!.countryGhana,
    // Country.GI => AppLocalizations.of(context)!.countryGibraltar,
    // Country.GL => AppLocalizations.of(context)!.countryGreenland,
    // Country.GM => AppLocalizations.of(context)!.countryGambia,
    // Country.GN => AppLocalizations.of(context)!.countryGuinea,
    // Country.GP => AppLocalizations.of(context)!.countryGuadeloupe,
    // Country.GQ => AppLocalizations.of(context)!.countryEquatorialGuinea,
    // Country.GR => AppLocalizations.of(context)!.countryGreece,
    // Country.GS => AppLocalizations.of(context)!.countrySouthGeorgiaAndTheSouthSandwichIslands,
    Country.GT => AppLocalizations.of(context)!.countryGuatemala,
    // Country.GU => AppLocalizations.of(context)!.countryGuam,
    // Country.GW => AppLocalizations.of(context)!.countryGuineaBissau,
    // Country.GY => AppLocalizations.of(context)!.countryGuyana,
    // Country.HK => AppLocalizations.of(context)!.countryHongKong,
    // Country.HM => AppLocalizations.of(context)!.countryHeardIslandAndMcDonaldIslands,
    // Country.HN => AppLocalizations.of(context)!.countryHonduras,
    // Country.HR => AppLocalizations.of(context)!.countryCroatia,
    // Country.HT => AppLocalizations.of(context)!.countryHaiti,
    // Country.HU => AppLocalizations.of(context)!.countryHungary,
    // Country.ID => AppLocalizations.of(context)!.countryIndonesia,
    // Country.IE => AppLocalizations.of(context)!.countryIreland,
    // Country.IL => AppLocalizations.of(context)!.countryIsrael,
    // Country.IM => AppLocalizations.of(context)!.countryIsleOfMan,
    // Country.IN => AppLocalizations.of(context)!.countryIndia,
    // Country.IO => AppLocalizations.of(context)!.countryBritishIndianOceanTerritory,
    // Country.IQ => AppLocalizations.of(context)!.countryIraq,
    // Country.IR => AppLocalizations.of(context)!.countryIranIslamicRepublicOf,
    // Country.IS => AppLocalizations.of(context)!.countryIceland,
    // Country.IT => AppLocalizations.of(context)!.countryItaly,
    // Country.JE => AppLocalizations.of(context)!.countryJersey,
    // Country.JM => AppLocalizations.of(context)!.countryJamaica,
    // Country.JO => AppLocalizations.of(context)!.countryJordan,
    // Country.JP => AppLocalizations.of(context)!.countryJapan,
    // Country.KE => AppLocalizations.of(context)!.countryKenya,
    // Country.KG => AppLocalizations.of(context)!.countryKyrgyzstan,
    // Country.KH => AppLocalizations.of(context)!.countryCambodia,
    // Country.KI => AppLocalizations.of(context)!.countryKiribati,
    // Country.KM => AppLocalizations.of(context)!.countryComoros,
    // Country.KN => AppLocalizations.of(context)!.countrySaintKittsAndNevis,
    // Country.KP => AppLocalizations.of(context)!.countryKoreaDemocraticPeopleSRepublic,
    // Country.KR => AppLocalizations.of(context)!.countryKoreaRepublic,
    // Country.KW => AppLocalizations.of(context)!.countryKuwait,
    // Country.KY => AppLocalizations.of(context)!.countryCaymanIslands,
    // Country.KZ => AppLocalizations.of(context)!.countryKazakhstan,
    // Country.LA => AppLocalizations.of(context)!.countryLaoPeopleSDemocraticRepublic,
    // Country.LB => AppLocalizations.of(context)!.countryLebanon,
    // Country.LC => AppLocalizations.of(context)!.countrySaintLucia,
    // Country.LI => AppLocalizations.of(context)!.countryLiechtenstein,
    // Country.LK => AppLocalizations.of(context)!.countrySriLanka,
    // Country.LR => AppLocalizations.of(context)!.countryLiberia,
    // Country.LS => AppLocalizations.of(context)!.countryLesotho,
    // Country.LT => AppLocalizations.of(context)!.countryLithuania,
    // Country.LU => AppLocalizations.of(context)!.countryLuxembourg,
    // Country.LV => AppLocalizations.of(context)!.countryLatvia,
    // Country.LY => AppLocalizations.of(context)!.countryLibya,
    // Country.MA => AppLocalizations.of(context)!.countryMorocco,
    // Country.MC => AppLocalizations.of(context)!.countryMonaco,
    // Country.MD => AppLocalizations.of(context)!.countryMoldovaRepublicOf,
    // Country.ME => AppLocalizations.of(context)!.countryMontenegro,
    // Country.MF => AppLocalizations.of(context)!.countrySaintMartinFrenchPart,
    // Country.MG => AppLocalizations.of(context)!.countryMadagascar,
    // Country.MH => AppLocalizations.of(context)!.countryMarshallIslands,
    // Country.MK => AppLocalizations.of(context)!.countryNorthMacedonia,
    // Country.ML => AppLocalizations.of(context)!.countryMali,
    // Country.MM => AppLocalizations.of(context)!.countryMyanmar,
    // Country.MN => AppLocalizations.of(context)!.countryMongolia,
    // Country.MO => AppLocalizations.of(context)!.countryMacao,
    // Country.MP => AppLocalizations.of(context)!.countryNorthernMarianaIslands,
    // Country.MQ => AppLocalizations.of(context)!.countryMartinique,
    // Country.MR => AppLocalizations.of(context)!.countryMauritania,
    // Country.MS => AppLocalizations.of(context)!.countryMontserrat,
    // Country.MT => AppLocalizations.of(context)!.countryMalta,
    // Country.MU => AppLocalizations.of(context)!.countryMauritius,
    // Country.MV => AppLocalizations.of(context)!.countryMaldives,
    // Country.MW => AppLocalizations.of(context)!.countryMalawi,
    // Country.MX => AppLocalizations.of(context)!.countryMexico,
    // Country.MY => AppLocalizations.of(context)!.countryMalaysia,
    // Country.MZ => AppLocalizations.of(context)!.countryMozambique,
    // Country.NA => AppLocalizations.of(context)!.countryNamibia,
    // Country.NC => AppLocalizations.of(context)!.countryNewCaledonia,
    // Country.NE => AppLocalizations.of(context)!.countryNiger,
    // Country.NF => AppLocalizations.of(context)!.countryNorfolkIsland,
    // Country.NG => AppLocalizations.of(context)!.countryNigeria,
    // Country.NI => AppLocalizations.of(context)!.countryNicaragua,
    // Country.NL => AppLocalizations.of(context)!.countryNetherlands,
    // Country.NO => AppLocalizations.of(context)!.countryNorway,
    // Country.NP => AppLocalizations.of(context)!.countryNepal,
    // Country.NR => AppLocalizations.of(context)!.countryNauru,
    // Country.NU => AppLocalizations.of(context)!.countryNiue,
    // Country.NZ => AppLocalizations.of(context)!.countryNewZealand,
    // Country.OM => AppLocalizations.of(context)!.countryOman,
    // Country.PA => AppLocalizations.of(context)!.countryPanama,
    // Country.PE => AppLocalizations.of(context)!.countryPeru,
    // Country.PF => AppLocalizations.of(context)!.countryFrenchPolynesia,
    // Country.PG => AppLocalizations.of(context)!.countryPapuaNewGuinea,
    // Country.PH => AppLocalizations.of(context)!.countryPhilippines,
    // Country.PK => AppLocalizations.of(context)!.countryPakistan,
    // Country.PL => AppLocalizations.of(context)!.countryPoland,
    // Country.PM => AppLocalizations.of(context)!.countrySaintPierreAndMiquelon,
    // Country.PN => AppLocalizations.of(context)!.countryPitcairn,
    // Country.PR => AppLocalizations.of(context)!.countryPuertoRico,
    // Country.PS => AppLocalizations.of(context)!.countryPalestineStateOf,
    // Country.PT => AppLocalizations.of(context)!.countryPortugal,
    // Country.PW => AppLocalizations.of(context)!.countryPalau,
    // Country.PY => AppLocalizations.of(context)!.countryParaguay,
    // Country.QA => AppLocalizations.of(context)!.countryQatar,
    // Country.RE => AppLocalizations.of(context)!.countryRéunion,
    // Country.RO => AppLocalizations.of(context)!.countryRomania,
    // Country.RS => AppLocalizations.of(context)!.countrySerbia,
    // Country.RU => AppLocalizations.of(context)!.countryRussianFederation,
    // Country.RW => AppLocalizations.of(context)!.countryRwanda,
    // Country.SA => AppLocalizations.of(context)!.countrySaudiArabia,
    // Country.SB => AppLocalizations.of(context)!.countrySolomonIslands,
    // Country.SC => AppLocalizations.of(context)!.countrySeychelles,
    // Country.SD => AppLocalizations.of(context)!.countrySudan,
    // Country.SE => AppLocalizations.of(context)!.countrySweden,
    // Country.SG => AppLocalizations.of(context)!.countrySingapore,
    // Country.SH => AppLocalizations.of(context)!.countrySaintHelenaAscensionAndTristanDaCunha,
    // Country.SI => AppLocalizations.of(context)!.countrySlovenia,
    // Country.SJ => AppLocalizations.of(context)!.countrySvalbardAndJanMayen,
    // Country.SK => AppLocalizations.of(context)!.countrySlovakia,
    // Country.SL => AppLocalizations.of(context)!.countrySierraLeone,
    // Country.SM => AppLocalizations.of(context)!.countrySanMarino,
    // Country.SN => AppLocalizations.of(context)!.countrySenegal,
    // Country.SO => AppLocalizations.of(context)!.countrySomalia,
    // Country.SR => AppLocalizations.of(context)!.countrySuriname,
    // Country.SS => AppLocalizations.of(context)!.countrySouthSudan,
    // Country.ST => AppLocalizations.of(context)!.countrySaoTomeAndPrincipe,
    // Country.SV => AppLocalizations.of(context)!.countryElSalvador,
    // Country.SX => AppLocalizations.of(context)!.countrySintMaartenDutchPart,
    // Country.SY => AppLocalizations.of(context)!.countrySyrianArabRepublic,
    // Country.SZ => AppLocalizations.of(context)!.countryEswatini,
    // Country.TC => AppLocalizations.of(context)!.countryTurksAndCaicosIslands,
    // Country.TD => AppLocalizations.of(context)!.countryChad,
    // Country.TF => AppLocalizations.of(context)!.countryFrenchSouthernTerritories,
    // Country.TG => AppLocalizations.of(context)!.countryTogo,
    // Country.TH => AppLocalizations.of(context)!.countryThailand,
    // Country.TJ => AppLocalizations.of(context)!.countryTajikistan,
    // Country.TK => AppLocalizations.of(context)!.countryTokelau,
    // Country.TL => AppLocalizations.of(context)!.countryTimorLeste,
    // Country.TM => AppLocalizations.of(context)!.countryTurkmenistan,
    // Country.TN => AppLocalizations.of(context)!.countryTunisia,
    // Country.TO => AppLocalizations.of(context)!.countryTonga,
    // Country.TR => AppLocalizations.of(context)!.countryTurkey,
    // Country.TT => AppLocalizations.of(context)!.countryTrinidadAndTobago,
    // Country.TV => AppLocalizations.of(context)!.countryTuvalu,
    // Country.TW => AppLocalizations.of(context)!.countryTaiwanProvinceOfChina,
    // Country.TZ => AppLocalizations.of(context)!.countryTanzaniaUnitedRepublicOf,
    // Country.UA => AppLocalizations.of(context)!.countryUkraine,
    // Country.UG => AppLocalizations.of(context)!.countryUganda,
    // Country.UM => AppLocalizations.of(context)!.countryUnitedStatesMinorOutlyingIslands,
    Country.US => AppLocalizations.of(context)!.countryUnitedStatesOfAmerica,
    // Country.UY => AppLocalizations.of(context)!.countryUruguay,
    // Country.UZ => AppLocalizations.of(context)!.countryUzbekistan,
    // Country.VA => AppLocalizations.of(context)!.countryHolySee,
    // Country.VC => AppLocalizations.of(context)!.countrySaintVincentAndTheGrenadines,
    // Country.VE => AppLocalizations.of(context)!.countryVenezuelaBolivarianRepublicOf,
    // Country.VG => AppLocalizations.of(context)!.countryVirginIslandsBritish,
    // Country.VI => AppLocalizations.of(context)!.countryVirginIslandsUS,
    // Country.VN => AppLocalizations.of(context)!.countryVietNam,
    // Country.VU => AppLocalizations.of(context)!.countryVanuatu,
    // Country.WF => AppLocalizations.of(context)!.countryWallisAndFutuna,
    // Country.WS => AppLocalizations.of(context)!.countrySamoa,
    // Country.YE => AppLocalizations.of(context)!.countryYemen,
    // Country.YT => AppLocalizations.of(context)!.countryMayotte,
    // Country.ZA => AppLocalizations.of(context)!.countrySouthAfrica,
    // Country.ZM => AppLocalizations.of(context)!.countryZambia,
    // Country.ZW => AppLocalizations.of(context)!.countryZimbabwe,
  };
}

final Map<String, Country> emojiToCountry = {
  // '🇦🇩': Country.AD, // Andorra
  // '🇦🇪': Country.AE, // United Arab Emirates
  // '🇦🇫': Country.AF, // Afghanistan
  // '🇦🇬': Country.AG, // Antigua and Barbuda
  // '🇦🇮': Country.AI, // Anguilla
  // '🇦🇱': Country.AL, // Albania
  // '🇦🇲': Country.AM, // Armenia
  // '🇦🇴': Country.AO, // Angola
  // '🇦🇷': Country.AR, // Argentina
  // '🇦🇸': Country.AS, // American Samoa
  // '🇦🇹': Country.AT, // Austria
  // '🇦🇺': Country.AU, // Australia
  // '🇦🇼': Country.AW, // Aruba
  // '🇦🇽': Country.AX, // Åland Islands
  // '🇦🇿': Country.AZ, // Azerbaijan
  // '🇧🇦': Country.BA, // Bosnia and Herzegovina
  // '🇧🇧': Country.BB, // Barbados
  // '🇧🇩': Country.BD, // Bangladesh
  // '🇧🇪': Country.BE, // Belgium
  // '🇧🇫': Country.BF, // Burkina Faso
  // '🇧🇬': Country.BG, // Bulgaria
  // '🇧🇭': Country.BH, // Bahrain
  // '🇧🇮': Country.BI, // Burundi
  // '🇧🇯': Country.BJ, // Benin
  // '🇧🇱': Country.BL, // Saint Barthélemy
  // '🇧🇲': Country.BM, // Bermuda
  // '🇧🇳': Country.BN, // Brunei Darussalam
  // '🇧🇴': Country.BO, // Bolivia (Plurinational State of)
  // '🇧🇶': Country.BQ, // Bonaire, Sint Eustatius and Saba
  // '🇧🇷': Country.BR, // Brazil
  // '🇧🇸': Country.BS, // Bahamas
  // '🇧🇹': Country.BT, // Bhutan
  // '🇧🇻': Country.BV, // Bouvet Island
  // '🇧🇼': Country.BW, // Botswana
  // '🇧🇾': Country.BY, // Belarus
  // '🇧🇿': Country.BZ, // Belize
  // '🇨🇦': Country.CA, // Canada
  // '🇨🇨': Country.CC, // Cocos (Keeling) Islands
  // '🇨🇩': Country.CD, // Congo (Democratic Republic of the)
  // '🇨🇫': Country.CF, // Central African Republic
  // '🇨🇬': Country.CG, // Congo
  // '🇨🇭': Country.CH, // Switzerland
  // '🇨🇮': Country.CI, // Côte d'Ivoire
  // '🇨🇰': Country.CK, // Cook Islands
  // '🇨🇱': Country.CL, // Chile
  // '🇨🇲': Country.CM, // Cameroon
  // '🇨🇳': Country.CN, // China
  // '🇨🇴': Country.CO, // Colombia
  // '🇨🇷': Country.CR, // Costa Rica
  // '🇨🇺': Country.CU, // Cuba
  // '🇨🇻': Country.CV, // Cabo Verde
  // '🇨🇼': Country.CW, // Curaçao
  // '🇨🇽': Country.CX, // Christmas Island
  // '🇨🇾': Country.CY, // Cyprus
  // '🇨🇿': Country.CZ, // Czech Republic
  // '🇩🇪': Country.DE, // Germany
  // '🇩🇯': Country.DJ, // Djibouti
  // '🇩🇰': Country.DK, // Denmark
  // '🇩🇲': Country.DM, // Dominica
  '🇩🇴': Country.DO, // Dominican Republic
  // '🇩🇿': Country.DZ, // Algeria
  // '🇪🇨': Country.EC, // Ecuador
  // '🇪🇪': Country.EE, // Estonia
  // '🇪🇬': Country.EG, // Egypt
  // '🇪🇭': Country.EH, // Western Sahara
  // '🇪🇷': Country.ER, // Eritrea
  // '🇪🇸': Country.ES, // Spain
  // '🇪🇹': Country.ET, // Ethiopia
  // '🇫🇮': Country.FI, // Finland
  // '🇫🇯': Country.FJ, // Fiji
  // '🇫🇰': Country.FK, // Falkland Islands (Malvinas)
  // '🇫🇲': Country.FM, // Micronesia (Federated States of)
  // '🇫🇴': Country.FO, // Faroe Islands
  // '🇫🇷': Country.FR, // France
  // '🇬🇦': Country.GA, // Gabon
  // '🇬🇧': Country.GB, // United Kingdom of Great Britain and Northern Ireland
  // '🇬🇩': Country.GD, // Grenada
  // '🇬🇪': Country.GE, // Georgia
  // '🇬🇫': Country.GF, // French Guiana
  // '🇬🇬': Country.GG, // Guernsey
  // '🇬🇭': Country.GH, // Ghana
  // '🇬🇮': Country.GI, // Gibraltar
  // '🇬🇱': Country.GL, // Greenland
  // '🇬🇲': Country.GM, // Gambia
  // '🇬🇳': Country.GN, // Guinea
  // '🇬🇵': Country.GP, // Guadeloupe
  // '🇬🇶': Country.GQ, // Equatorial Guinea
  // '🇬🇷': Country.GR, // Greece
  // '🇬🇸': Country.GS, // South Georgia and the South Sandwich Islands
  '🇬🇹': Country.GT, // Guatemala
  // '🇬🇺': Country.GU, // Guam
  // '🇬🇼': Country.GW, // Guinea-Bissau
  // '🇬🇾': Country.GY, // Guyana
  // '🇭🇰': Country.HK, // Hong Kong
  // '🇭🇲': Country.HM, // Heard Island and McDonald Islands
  // '🇭🇳': Country.HN, // Honduras
  // '🇭🇷': Country.HR, // Croatia
  // '🇭🇹': Country.HT, // Haiti
  // '🇭🇺': Country.HU, // Hungary
  // '🇮🇩': Country.ID, // Indonesia
  // '🇮🇪': Country.IE, // Ireland
  // '🇮🇱': Country.IL, // Israel
  // '🇮🇲': Country.IM, // Isle of Man
  // '🇮🇳': Country.IN, // India
  // '🇮🇴': Country.IO, // British Indian Ocean Territory
  // '🇮🇶': Country.IQ, // Iraq
  // '🇮🇷': Country.IR, // Iran (Islamic Republic of)
  // '🇮🇸': Country.IS, // Iceland
  // '🇮🇹': Country.IT, // Italy
  // '🇯🇪': Country.JE, // Jersey
  // '🇯🇲': Country.JM, // Jamaica
  // '🇯🇴': Country.JO, // Jordan
  // '🇯🇵': Country.JP, // Japan
  // '🇰🇪': Country.KE, // Kenya
  // '🇰🇬': Country.KG, // Kyrgyzstan
  // '🇰🇭': Country.KH, // Cambodia
  // '🇰🇮': Country.KI, // Kiribati
  // '🇰🇲': Country.KM, // Comoros
  // '🇰🇳': Country.KN, // Saint Kitts and Nevis
  // '🇰🇵': Country.KP, // Korea (Democratic People's Republic of)
  // '🇰🇷': Country.KR, // Korea (Republic of)
  // '🇰🇼': Country.KW, // Kuwait
  // '🇰🇾': Country.KY, // Cayman Islands
  // '🇰🇿': Country.KZ, // Kazakhstan
  // '🇱🇦': Country.LA, // Lao People's Democratic Republic
  // '🇱🇧': Country.LB, // Lebanon
  // '🇱🇨': Country.LC, // Saint Lucia
  // '🇱🇮': Country.LI, // Liechtenstein
  // '🇱🇰': Country.LK, // Sri Lanka
  // '🇱🇷': Country.LR, // Liberia
  // '🇱🇸': Country.LS, // Lesotho
  // '🇱🇹': Country.LT, // Lithuania
  // '🇱🇺': Country.LU, // Luxembourg
  // '🇱🇻': Country.LV, // Latvia
  // '🇱🇾': Country.LY, // Libya
  // '🇲🇦': Country.MA, // Morocco
  // '🇲🇨': Country.MC, // Monaco
  // '🇲🇩': Country.MD, // Moldova (Republic of)
  // '🇲🇪': Country.ME, // Montenegro
  // '🇲🇫': Country.MF, // Saint Martin (French part)
  // '🇲🇬': Country.MG, // Madagascar
  // '🇲🇭': Country.MH, // Marshall Islands
  // '🇲🇰': Country.MK, // North Macedonia
  // '🇲🇱': Country.ML, // Mali
  // '🇲🇲': Country.MM, // Myanmar
  // '🇲🇳': Country.MN, // Mongolia
  // '🇲🇴': Country.MO, // Macao
  // '🇲🇵': Country.MP, // Northern Mariana Islands
  // '🇲🇶': Country.MQ, // Martinique
  // '🇲🇷': Country.MR, // Mauritania
  // '🇲🇸': Country.MS, // Montserrat
  // '🇲🇹': Country.MT, // Malta
  // '🇲🇺': Country.MU, // Mauritius
  // '🇲🇻': Country.MV, // Maldives
  // '🇲🇼': Country.MW, // Malawi
  // '🇲🇽': Country.MX, // Mexico
  // '🇲🇾': Country.MY, // Malaysia
  // '🇲🇿': Country.MZ, // Mozambique
  // '🇳🇦': Country.NA, // Namibia
  // '🇳🇨': Country.NC, // New Caledonia
  // '🇳🇪': Country.NE, // Niger
  // '🇳🇫': Country.NF, // Norfolk Island
  // '🇳🇬': Country.NG, // Nigeria
  // '🇳🇮': Country.NI, // Nicaragua
  // '🇳🇱': Country.NL, // Netherlands
  // '🇳🇴': Country.NO, // Norway
  // '🇳🇵': Country.NP, // Nepal
  // '🇳🇷': Country.NR, // Nauru
  // '🇳🇺': Country.NU, // Niue
  // '🇳🇿': Country.NZ, // New Zealand
  // '🇴🇲': Country.OM, // Oman
  // '🇵🇦': Country.PA, // Panama
  // '🇵🇪': Country.PE, // Peru
  // '🇵🇫': Country.PF, // French Polynesia
  // '🇵🇬': Country.PG, // Papua New Guinea
  // '🇵🇭': Country.PH, // Philippines
  // '🇵🇰': Country.PK, // Pakistan
  // '🇵🇱': Country.PL, // Poland
  // '🇵🇲': Country.PM, // Saint Pierre and Miquelon
  // '🇵🇳': Country.PN, // Pitcairn
  // '🇵🇷': Country.PR, // Puerto Rico
  // '🇵🇸': Country.PS, // Palestine, State of
  // '🇵🇹': Country.PT, // Portugal
  // '🇵🇼': Country.PW, //
  // '🇵🇾': Country.PY, // Paraguay
  // '🇶🇦': Country.QA, // Qatar
  // '🇷🇪': Country.RE, // Réunion
  // '🇷🇴': Country.RO, // Romania
  // '🇷🇸': Country.RS, // Serbia
  // '🇷🇺': Country.RU, // Russian Federation
  // '🇷🇼': Country.RW, // Rwanda
  // '🇸🇦': Country.SA, // Saudi Arabia
  // '🇸🇧': Country.SB, // Solomon Islands
  // '🇸🇨': Country.SC, // Seychelles
  // '🇸🇩': Country.SD, // Sudan
  // '🇸🇪': Country.SE, // Sweden
  // '🇸🇬': Country.SG, // Singapore
  // '🇸🇭': Country.SH, // Saint Helena, Ascension and Tristan da Cunha
  // '🇸🇮': Country.SI, // Slovenia
  // '🇸🇯': Country.SJ, // Svalbard and Jan Mayen
  // '🇸🇰': Country.SK, // Slovakia
  // '🇸🇱': Country.SL, // Sierra Leone
  // '🇸🇲': Country.SM, // San Marino
  // '🇸🇳': Country.SN, // Senegal
  // '🇸🇴': Country.SO, // Somalia
  // '🇸🇷': Country.SR, // Suriname
  // '🇸🇸': Country.SS, // South Sudan
  // '🇸🇹': Country.ST, // Sao Tome and Principe
  // '🇸🇻': Country.SV, // El Salvador
  // '🇸🇽': Country.SX, // Sint Maarten (Dutch part)
  // '🇸🇾': Country.SY, // Syrian Arab Republic
  // '🇸🇿': Country.SZ, // Eswatini
  // '🇹🇨': Country.TC, // Turks and Caicos Islands
  // '🇹🇩': Country.TD, // Chad
  // '🇹🇫': Country.TF, // French Southern Territories
  // '🇹🇬': Country.TG, // Togo
  // '🇹🇭': Country.TH, // Thailand
  // '🇹🇯': Country.TJ, // Tajikistan
  // '🇹🇰': Country.TK, // Tokelau
  // '🇹🇱': Country.TL, // Timor-Leste
  // '🇹🇲': Country.TM, // Turkmenistan
  // '🇹🇳': Country.TN, // Tunisia
  // '🇹🇴': Country.TO, // Tonga
  // '🇹🇷': Country.TR, // Turkey
  // '🇹🇹': Country.TT, // Trinidad and Tobago
  // '🇹🇻': Country.TV, // Tuvalu
  // '🇹🇼': Country.TW, // Taiwan
  // '🇹🇿': Country.TZ, // Tanzania, United Republic of
  // '🇺🇦': Country.UA, // Ukraine
  // '🇺🇬': Country.UG, // Uganda
  // '🇺🇲': Country.UM, // United States Minor Outlying Islands
  '🇺🇸': Country.US, // United States of America
  // '🇺🇾': Country.UY, // Uruguay
  // '🇺🇿': Country.UZ, // Uzbekistan
  // '🇻🇦': Country.VA, // Holy See
  // '🇻🇨': Country.VC, // Saint Vincent and the Grenadines
  // '🇻🇪': Country.VE, // Venezuela (Bolivarian Republic of)
  // '🇻🇬': Country.VG, // Virgin Islands (British)
  // '🇻🇮': Country.VI, // Virgin Islands (U.S.)
  // '🇻🇳': Country.VN, // Viet Nam
  // '🇻🇺': Country.VU, // Vanuatu
  // '🇼🇫': Country.WF, // Wallis and Futuna
  // '🇼🇸': Country.WS, // Samoa
  // '🇾🇪': Country.YE, // Yemen
  // '🇾🇹': Country.YT, // Mayotte
  // '🇿🇦': Country.ZA, // South Africa
  // '🇿🇲': Country.ZM, // Zambia
  // '🇿🇼': Country.ZW, // Zimbabwe
};

final Map<Country, String> countryToEmoji = {
  // Country.AD: '🇦🇩', // Andorra
  // Country.AE: '🇦🇪', // United Arab Emirates
  // Country.AF: '🇦🇫', // Afghanistan
  // Country.AG: '🇦🇬', // Antigua and Barbuda
  // Country.AI: '🇦🇮', // Anguilla
  // Country.AL: '🇦🇱', // Albania
  // Country.AM: '🇦🇲', // Armenia
  // Country.AO: '🇦🇴', // Angola
  // Country.AR: '🇦🇷', // Argentina
  // Country.AS: '🇦🇸', // American Samoa
  // Country.AT: '🇦🇹', // Austria
  // Country.AU: '🇦🇺', // Australia
  // Country.AW: '🇦🇼', // Aruba
  // Country.AX: '🇦🇽', // Åland Islands
  // Country.AZ: '🇦🇿', // Azerbaijan
  // Country.BA: '🇧🇦', // Bosnia and Herzegovina
  // Country.BB: '🇧🇧', // Barbados
  // Country.BD: '🇧🇩', // Bangladesh
  // Country.BE: '🇧🇪', // Belgium
  // Country.BF: '🇧🇫', // Burkina Faso
  // Country.BG: '🇧🇬', // Bulgaria
  // Country.BH: '🇧🇭', // Bahrain
  // Country.BI: '🇧🇮', // Burundi
  // Country.BJ: '🇧🇯', // Benin
  // Country.BL: '🇧🇱', // Saint Barthélemy
  // Country.BM: '🇧🇲', // Bermuda
  // Country.BN: '🇧🇳', // Brunei Darussalam
  // Country.BO: '🇧🇴', // Bolivia (Plurinational State of)
  // Country.BQ: '🇧🇶', // Bonaire, Sint Eustatius and Saba
  // Country.BR: '🇧🇷', // Brazil
  // Country.BS: '🇧🇸', // Bahamas
  // Country.BT: '🇧🇹', // Bhutan
  // Country.BV: '🇧🇻', // Bouvet Island
  // Country.BW: '🇧🇼', // Botswana
  // Country.BY: '🇧🇾', // Belarus
  // Country.BZ: '🇧🇿', // Belize
  // Country.CA: '🇨🇦', // Canada
  // Country.CC: '🇨🇨', // Cocos (Keeling) Islands
  // Country.CD: '🇨🇩', // Congo (Democratic Republic of the)
  // Country.CF: '🇨🇫', // Central African Republic
  // Country.CG: '🇨🇬', // Congo
  // Country.CH: '🇨🇭', // Switzerland
  // Country.CI: '🇨🇮', // Côte d'Ivoire
  // Country.CK: '🇨🇰', // Cook Islands
  // Country.CL: '🇨🇱', // Chile
  // Country.CM: '🇨🇲', // Cameroon
  // Country.CN: '🇨🇳', // China
  // Country.CO: '🇨🇴', // Colombia
  // Country.CR: '🇨🇷', // Costa Rica
  // Country.CU: '🇨🇺', // Cuba
  // Country.CV: '🇨🇻', // Cabo Verde
  // Country.CW: '🇨🇼', // Curaçao
  // Country.CX: '🇨🇽', // Christmas Island
  // Country.CY: '🇨🇾', // Cyprus
  // Country.CZ: '🇨🇿', // Czech Republic
  // Country.DE: '🇩🇪', // Germany
  // Country.DJ: '🇩🇯', // Djibouti
  // Country.DK: '🇩🇰', // Denmark
  // Country.DM: '🇩🇲', // Dominica
  Country.DO: '🇩🇴', // Dominican Republic
  // Country.DZ: '🇩🇿', // Algeria
  // Country.EC: '🇪🇨', // Ecuador
  // Country.EE: '🇪🇪', // Estonia
  // Country.EG: '🇪🇬', // Egypt
  // Country.EH: '🇪🇭', // Western Sahara
  // Country.ER: '🇪🇷', // Eritrea
  // Country.ES: '🇪🇸', // Spain
  // Country.ET: '🇪🇹', // Ethiopia
  // Country.FI: '🇫🇮', // Finland
  // Country.FJ: '🇫🇯', // Fiji
  // Country.FK: '🇫🇰', // Falkland Islands (Malvinas)
  // Country.FM: '🇫🇲', // Micronesia (Federated States of)
  // Country.FO: '🇫🇴', // Faroe Islands
  // Country.FR: '🇫🇷', // France
  // Country.GA: '🇬🇦', // Gabon
  // Country.GB: '🇬🇧', // United Kingdom of Great Britain and Northern Ireland
  // Country.GD: '🇬🇩', // Grenada
  // Country.GE: '🇬🇪', // Georgia
  // Country.GF: '🇬🇫', // French Guiana
  // Country.GG: '🇬🇬', // Guernsey
  // Country.GH: '🇬🇭', // Ghana
  // Country.GI: '🇬🇮', // Gibraltar
  // Country.GL: '🇬🇱', // Greenland
  // Country.GM: '🇬🇲', // Gambia
  // Country.GN: '🇬🇳', // Guinea
  // Country.GP: '🇬🇵', // Guadeloupe
  // Country.GQ: '🇬🇶', // Equatorial Guinea
  // Country.GR: '🇬🇷', // Greece
  // Country.GS: '🇬🇸', // South Georgia and the South Sandwich Islands
  Country.GT: '🇬🇹', // Guatemala
  // Country.GU: '🇬🇺', // Guam
  // Country.GW: '🇬🇼', // Guinea-Bissau
  // Country.GY: '🇬🇾', // Guyana
  // Country.HK: '🇭🇰', // Hong Kong
  // Country.HM: '🇭🇲', // Heard Island and McDonald Islands
  // Country.HN: '🇭🇳', // Honduras
  // Country.HR: '🇭🇷', // Croatia
  // Country.HT: '🇭🇹', // Haiti
  // Country.HU: '🇭🇺', // Hungary
  // Country.ID: '🇮🇩', // Indonesia
  // Country.IE: '🇮🇪', // Ireland
  // Country.IL: '🇮🇱', // Israel
  // Country.IM: '🇮🇲', // Isle of Man
  // Country.IN: '🇮🇳', // India
  // Country.IO: '🇮🇴', // British Indian Ocean Territory
  // Country.IQ: '🇮🇶', // Iraq
  // Country.IR: '🇮🇷', // Iran (Islamic Republic of)
  // Country.IS: '🇮🇸', // Iceland
  // Country.IT: '🇮🇹', // Italy
  // Country.JE: '🇯🇪', // Jersey
  // Country.JM: '🇯🇲', // Jamaica
  // Country.JO: '🇯🇴', // Jordan
  // Country.JP: '🇯🇵', // Japan
  // Country.KE: '🇰🇪', // Kenya
  // Country.KG: '🇰🇬', // Kyrgyzstan
  // Country.KH: '🇰🇭', // Cambodia
  // Country.KI: '🇰🇮', // Kiribati
  // Country.KM: '🇰🇲', // Comoros
  // Country.KN: '🇰🇳', // Saint Kitts and Nevis
  // Country.KP: '🇰🇵', // Korea (Democratic People's Republic of)
  // Country.KR: '🇰🇷', // Korea (Republic of)
  // Country.KW: '🇰🇼', // Kuwait
  // Country.KY: '🇰🇾', // Cayman Islands
  // Country.KZ: '🇰🇿', // Kazakhstan
  // Country.LA: '🇱🇦', // Lao People's Democratic Republic
  // Country.LB: '🇱🇧', // Lebanon
  // Country.LC: '🇱🇨', // Saint Lucia
  // Country.LI: '🇱🇮', // Liechtenstein
  // Country.LK: '🇱🇰', // Sri Lanka
  // Country.LR: '🇱🇷', // Liberia
  // Country.LS: '🇱🇸', // Lesotho
  // Country.LT: '🇱🇹', // Lithuania
  // Country.LU: '🇱🇺', // Luxembourg
  // Country.LV: '🇱🇻', // Latvia
  // Country.LY: '🇱🇾', // Libya
  // Country.MA: '🇲🇦', // Morocco
  // Country.MC: '🇲🇨', // Monaco
  // Country.MD: '🇲🇩', // Moldova (Republic of)
  // Country.ME: '🇲🇪', // Montenegro
  // Country.MF: '🇲🇫', // Saint Martin (French part)
  // Country.MG: '🇲🇬', // Madagascar
  // Country.MH: '🇲🇭', // Marshall Islands
  // Country.MK: '🇲🇰', // North Macedonia
  // Country.ML: '🇲🇱', // Mali
  // Country.MM: '🇲🇲', // Myanmar
  // Country.MN: '🇲🇳', // Mongolia
  // Country.MO: '🇲🇴', // Macao
  // Country.MP: '🇲🇵', // Northern Mariana Islands
  // Country.MQ: '🇲🇶', // Martinique
  // Country.MR: '🇲🇷', // Mauritania
  // Country.MS: '🇲🇸', // Montserrat
  // Country.MT: '🇲🇹', // Malta
  // Country.MU: '🇲🇺', // Mauritius
  // Country.MV: '🇲🇻', // Maldives
  // Country.MW: '🇲🇼', // Malawi
  // Country.MX: '🇲🇽', // Mexico
  // Country.MY: '🇲🇾', // Malaysia
  // Country.MZ: '🇲🇿', // Mozambique
  // Country.NA: '🇳🇦', // Namibia
  // Country.NC: '🇳🇨', // New Caledonia
  // Country.NE: '🇳🇪', // Niger
  // Country.NF: '🇳🇫', // Norfolk Island
  // Country.NG: '🇳🇬', // Nigeria
  // Country.NI: '🇳🇮', // Nicaragua
  // Country.NL: '🇳🇱', // Netherlands
  // Country.NO: '🇳🇴', // Norway
  // Country.NP: '🇳🇵', // Nepal
  // Country.NR: '🇳🇷', // Nauru
  // Country.NU: '🇳🇺', // Niue
  // Country.NZ: '🇳🇿', // New Zealand
  // Country.OM: '🇴🇲', // Oman
  // Country.PA: '🇵🇦', // Panama
  // Country.PE: '🇵🇪', // Peru
  // Country.PF: '🇵🇫', // French Polynesia
  // Country.PG: '🇵🇬', // Papua New Guinea
  // Country.PH: '🇵🇭', // Philippines
  // Country.PK: '🇵🇰', // Pakistan
  // Country.PL: '🇵🇱', // Poland
  // Country.PM: '🇵🇲', // Saint Pierre and Miquelon
  // Country.PN: '🇵🇳', // Pitcairn
  // Country.PR: '🇵🇷', // Puerto Rico
  // Country.PS: '🇵🇸', // Palestine, State of
  // Country.PT: '🇵🇹', // Portugal
  // Country.PW: '🇵🇼', // Palau
  // Country.PY: '🇵🇾', // Paraguay
  // Country.QA: '🇶🇦', // Qatar
  // Country.RE: '🇷🇪', // Réunion
  // Country.RO: '🇷🇴', // Romania
  // Country.RS: '🇷🇸', // Serbia
  // Country.RU: '🇷🇺', // Russian Federation
  // Country.RW: '🇷🇼', // Rwanda
  // Country.SA: '🇸🇦', // Saudi Arabia
  // Country.SB: '🇸🇧', // Solomon Islands
  // Country.SC: '🇸🇨', // Seychelles
  // Country.SD: '🇸🇩', // Sudan
  // Country.SE: '🇸🇪', // Sweden
  // Country.SG: '🇸🇬', // Singapore
  // Country.SH: '🇸🇭', // Saint Helena, Ascension and Tristan da Cunha
  // Country.SI: '🇸🇮', // Slovenia
  // Country.SJ: '🇸🇯', // Svalbard and Jan Mayen
  // Country.SK: '🇸🇰', // Slovakia
  // Country.SL: '🇸🇱', // Sierra Leone
  // Country.SM: '🇸🇲', // San Marino
  // Country.SN: '🇸🇳', // Senegal
  // Country.SO: '🇸🇴', // Somalia
  // Country.SR: '🇸🇷', // Suriname
  // Country.SS: '🇸🇸', // South Sudan
  // Country.ST: '🇸🇹', // Sao Tome and Principe
  // Country.SV: '🇸🇻', // El Salvador
  // Country.SX: '🇸🇽', // Sint Maarten (Dutch part)
  // Country.SY: '🇸🇾', // Syrian Arab Republic
  // Country.SZ: '🇸🇿', // Eswatini
  // Country.TC: '🇹🇨', // Turks and Caicos Islands
  // Country.TD: '🇹🇩', // Chad
  // Country.TF: '🇹🇫', // French Southern Territories
  // Country.TG: '🇹🇬', // Togo
  // Country.TH: '🇹🇭', // Thailand
  // Country.TJ: '🇹🇯', // Tajikistan
  // Country.TK: '🇹🇰', // Tokelau
  // Country.TL: '🇹🇱', // Timor-Leste
  // Country.TM: '🇹🇲', // Turkmenistan
  // Country.TN: '🇹🇳', // Tunisia
  // Country.TO: '🇹🇴', // Tonga
  // Country.TR: '🇹🇷', // Turkey
  // Country.TT: '🇹🇹', // Trinidad and Tobago
  // Country.TV: '🇹🇻', // Tuvalu
  // Country.TW: '🇹🇼', // Taiwan
  // Country.TZ: '🇹🇿', // Tanzania, United Republic of
  // Country.UA: '🇺🇦', // Ukraine
  // Country.UG: '🇺🇬', // Uganda
  // Country.UM: '🇺🇲', // United States Minor Outlying Islands
  Country.US: '🇺🇸', // United States of America
  // Country.UY: '🇺🇾', // Uruguay
  // Country.UZ: '🇺🇿', // Uzbekistan
  // Country.VA: '🇻🇦', // Holy See
  // Country.VC: '🇻🇨', // Saint Vincent and the Grenadines
  // Country.VE: '🇻🇪', // Venezuela (Bolivarian Republic of)
  // Country.VG: '🇻🇬', // Virgin Islands (British)
  // Country.VI: '🇻🇮', // Virgin Islands (U.S.)
  // Country.VN: '🇻🇳', // Viet Nam
  // Country.VU: '🇻🇺', // Vanuatu
  // Country.WF: '🇼🇫', // Wallis and Futuna
  // Country.WS: '🇼🇸', // Samoa
  // Country.YE: '🇾🇪', // Yemen
  // Country.YT: '🇾🇹', // Mayotte
  // Country.ZA: '🇿🇦', // South Africa
  // Country.ZM: '🇿🇲', // Zambia
  // Country.ZW: '🇿🇼', // Zimbabwe
};

final Map<Country, String> countryToCallingCode = {
  // Country.AD: '+376', // Andorra
  // Country.AE: '+971', // United Arab Emirates
  // Country.AF: '+93', // Afghanistan
  // Country.AG: '+1', // Antigua and Barbuda
  // Country.AI: '+1', // Anguilla
  // Country.AL: '+355', // Albania
  // Country.AM: '+374', // Armenia
  // Country.AO: '+244', // Angola
  // Country.AR: '+54', // Argentina
  // Country.AS: '+1', // American Samoa
  // Country.AT: '+43', // Austria
  // Country.AU: '+61', // Australia
  // Country.AW: '+297', // Aruba
  // Country.AX: '+358', // Åland Islands
  // Country.AZ: '+994', // Azerbaijan
  // Country.BA: '+387', // Bosnia and Herzegovina
  // Country.BB: '+1', // Barbados
  // Country.BD: '+880', // Bangladesh
  // Country.BE: '+32', // Belgium
  // Country.BF: '+226', // Burkina Faso
  // Country.BG: '+359', // Bulgaria
  // Country.BH: '+973', // Bahrain
  // Country.BI: '+257', // Burundi
  // Country.BJ: '+229', // Benin
  // Country.BL: '+590', // Saint Barthélemy
  // Country.BM: '+1', // Bermuda
  // Country.BN: '+673', // Brunei Darussalam
  // Country.BO: '+591', // Bolivia (Plurinational State of)
  // Country.BQ: '+599', // Bonaire, Sint Eustatius and Saba
  // Country.BR: '+55', // Brazil
  // Country.BS: '+1', // Bahamas
  // Country.BT: '+975', // Bhutan
  // Country.BV: '+47', // Bouvet Island
  // Country.BW: '+267', // Botswana
  // Country.BY: '+375', // Belarus
  // Country.BZ: '+501', // Belize
  // Country.CA: '+1', // Canada
  // Country.CC: '+61', // Cocos (Keeling) Islands
  // Country.CD: '+243', // Congo (Democratic Republic of the)
  // Country.CF: '+236', // Central African Republic
  // Country.CG: '+242', // Congo
  // Country.CH: '+41', // Switzerland
  // Country.CI: '+225', // Côte d'Ivoire
  // Country.CK: '+682', // Cook Islands
  // Country.CL: '+56', // Chile
  // Country.CM: '+237', // Cameroon
  // Country.CN: '+86', // China
  // Country.CO: '+57', // Colombia
  // Country.CR: '+506', // Costa Rica
  // Country.CU: '+53', // Cuba
  // Country.CV: '+238', // Cabo Verde
  // Country.CW: '+599', // Curaçao
  // Country.CX: '+61', // Christmas Island
  // Country.CY: '+357', // Cyprus
  // Country.CZ: '+420', // Czech Republic
  // Country.DE: '+49', // Germany
  // Country.DJ: '+253', // Djibouti
  // Country.DK: '+45', // Denmark
  // Country.DM: '+1', // Dominica
  Country.DO: '+1', // Dominican Republic
  // Country.DZ: '+213', // Algeria
  // Country.EC: '+593', // Ecuador
  // Country.EE: '+372', // Estonia
  // Country.EG: '+20', // Egypt
  // Country.EH: '+212', // Western Sahara
  // Country.ER: '+291', // Eritrea
  // Country.ES: '+34', // Spain
  // Country.ET: '+251', // Ethiopia
  // Country.FI: '+358', // Finland
  // Country.FJ: '+679', // Fiji
  // Country.FK: '+500', // Falkland Islands (Malvinas)
  // Country.FM: '+691', // Micronesia (Federated States of)
  // Country.FO: '+298', // Faroe Islands
  // Country.FR: '+33', // France
  // Country.GA: '+241', // Gabon
  // Country.GB: '+44', // United Kingdom of Great Britain and Northern Ireland
  // Country.GD: '+1', // Grenada
  // Country.GE: '+995', // Georgia
  // Country.GF: '+594', // French Guiana
  // Country.GG: '+44', // Guernsey
  // Country.GH: '+233', // Ghana
  // Country.GI: '+350', // Gibraltar
  // Country.GL: '+299', // Greenland
  // Country.GM: '+220', // Gambia
  // Country.GN: '+224', // Guinea
  // Country.GP: '+590', // Guadeloupe
  // Country.GQ: '+240', // Equatorial Guinea
  // Country.GR: '+30', // Greece
  // Country.GS: '+500', // South Georgia and the South Sandwich Islands
  Country.GT: '+502', // Guatemala
  // Country.GU: '+1', // Guam
  // Country.GW: '+245', // Guinea-Bissau
  // Country.GY: '+592', // Guyana
  // Country.HK: '+852', // Hong Kong
  // Country.HM: '+672', // Heard Island and McDonald Islands
  // Country.HN: '+504', // Honduras
  // Country.HR: '+385', // Croatia
  // Country.HT: '+509', // Haiti
  // Country.HU: '+36', // Hungary
  // Country.ID: '+62', // Indonesia
  // Country.IE: '+353', // Ireland
  // Country.IL: '+972', // Israel
  // Country.IM: '+44', // Isle of Man
  // Country.IN: '+91', // India
  // Country.IO: '+246', // British Indian Ocean Territory
  // Country.IQ: '+964', // Iraq
  // Country.IR: '+98', // Iran (Islamic Republic of)
  // Country.IS: '+354', // Iceland
  // Country.IT: '+39', // Italy
  // Country.JE: '+44', // Jersey
  // Country.JM: '+1', // Jamaica
  // Country.JO: '+962', // Jordan
  // Country.JP: '+81', // Japan
  // Country.KE: '+254', // Kenya
  // Country.KG: '+996', // Kyrgyzstan
  // Country.KH: '+855', // Cambodia
  // Country.KI: '+686', // Kiribati
  // Country.KM: '+269', // Comoros
  // Country.KN: '+1', // Saint Kitts and Nevis
  // Country.KP: '+850', // Korea (Democratic People's Republic of)
  // Country.KR: '+82', // Korea (Republic of)
  // Country.KW: '+965', // Kuwait
  // Country.KY: '+1', // Cayman Islands
  // Country.KZ: '+7', // Kazakhstan
  // Country.LA: '+856', // Lao People's Democratic Republic
  // Country.LB: '+961', // Lebanon
  // Country.LC: '+1', // Saint Lucia
  // Country.LI: '+423', // Liechtenstein
  // Country.LK: '+94', // Sri Lanka
  // Country.LR: '+231', // Liberia
  // Country.LS: '+266', // Lesotho
  // Country.LT: '+370', // Lithuania
  // Country.LU: '+352', // Luxembourg
  // Country.LV: '+371', // Latvia
  // Country.LY: '+218', // Libya
  // Country.MA: '+212', // Morocco
  // Country.MC: '+377', // Monaco
  // Country.MD: '+373', // Moldova (Republic of)
  // Country.ME: '+382', // Montenegro
  // Country.MF: '+590', // Saint Martin (French part)
  // Country.MG: '+261', // Madagascar
  // Country.MH: '+692', // Marshall Islands
  // Country.MK: '+389', // North Macedonia
  // Country.ML: '+223', // Mali
  // Country.MM: '+95', // Myanmar
  // Country.MN: '+976', // Mongolia
  // Country.MO: '+853', // Macao
  // Country.MP: '+1', // Northern Mariana Islands
  // Country.MQ: '+596', // Martinique
  // Country.MR: '+222', // Mauritania
  // Country.MS: '+1', // Montserrat
  // Country.MT: '+356', // Malta
  // Country.MU: '+230', // Mauritius
  // Country.MV: '+960', // Maldives
  // Country.MW: '+265', // Malawi
  // Country.MX: '+52', // Mexico
  // Country.MY: '+60', // Malaysia
  // Country.MZ: '+258', // Mozambique
  // Country.NA: '+264', // Namibia
  // Country.NC: '+687', // New Caledonia
  // Country.NE: '+227', // Niger
  // Country.NF: '+672', // Norfolk Island
  // Country.NG: '+234', // Nigeria
  // Country.NI: '+505', // Nicaragua
  // Country.NL: '+31', // Netherlands
  // Country.NO: '+47', // Norway
  // Country.NP: '+977', // Nepal
  // Country.NR: '+674', // Nauru
  // Country.NU: '+683', // Niue
  // Country.NZ: '+64', // New Zealand
  // Country.OM: '+968', // Oman
  // Country.PA: '+507', // Panama
  // Country.PE: '+51', // Peru
  // Country.PF: '+689', // French Polynesia
  // Country.PG: '+675', // Papua New Guinea
  // Country.PH: '+63', // Philippines
  // Country.PK: '+92', // Pakistan
  // Country.PL: '+48', // Poland
  // Country.PM: '+508', // Saint Pierre and Miquelon
  // Country.PN: '+872', // Pitcairn
  // Country.PR: '+1', // Puerto Rico
  // Country.PS: '+970', // Palestine, State of
  // Country.PT: '+351', // Portugal
  // Country.PW: '+680', // Palau
  // Country.PY: '+595', // Paraguay
  // Country.QA: '+974', // Qatar
  // Country.RE: '+262', // Réunion
  // Country.RO: '+40', // Romania
  // Country.RS: '+381', // Serbia
  // Country.RU: '+7', // Russian Federation
  // Country.RW: '+250', // Rwanda
  // Country.SA: '+966', // Saudi Arabia
  // Country.SB: '+677', // Solomon Islands
  // Country.SC: '+248', // Seychelles
  // Country.SD: '+249', // Sudan
  // Country.SE: '+46', // Sweden
  // Country.SG: '+65', // Singapore
  // Country.SH: '+290', // Saint Helena, Ascension and Tristan da Cunha
  // Country.SI: '+386', // Slovenia
  // Country.SJ: '+47', // Svalbard and Jan Mayen
  // Country.SK: '+421', // Slovakia
  // Country.SL: '+232', // Sierra Leone
  // Country.SM: '+378', // San Marino
  // Country.SN: '+221', // Senegal
  // Country.SO: '+252', // Somalia
  // Country.SR: '+597', // Suriname
  // Country.SS: '+211', // South Sudan
  // Country.ST: '+239', // Sao Tome and Principe
  // Country.SV: '+503', // El Salvador
  // Country.SX: '+1', // Sint Maarten (Dutch part)
  // Country.SY: '+963', // Syrian Arab Republic
  // Country.SZ: '+268', // Eswatini
  // Country.TC: '+1', // Turks and Caicos Islands
  // Country.TD: '+235', // Chad
  // Country.TF: '+262', // French Southern Territories
  // Country.TG: '+228', // Togo
  // Country.TH: '+66', // Thailand
  // Country.TJ: '+992', // Tajikistan
  // Country.TK: '+690', // Tokelau
  // Country.TL: '+670', // Timor-Leste
  // Country.TM: '+993', // Turkmenistan
  // Country.TN: '+216', // Tunisia
  // Country.TO: '+676', // Tonga
  // Country.TR: '+90', // Turkey
  // Country.TT: '+1', // Trinidad and Tobago
  // Country.TV: '+688', // Tuvalu
  // Country.TW: '+886', // Taiwan
  // Country.TZ: '+255', // Tanzania, United Republic of
  // Country.UA: '+380', // Ukraine
  // Country.UG: '+256', // Uganda
  // Country.UM:
  //     '', // United States Minor Outlying Islands (No specific calling code)
  Country.US: '+1', // United States of America
  // Country.UY: '+598', // Uruguay
  // Country.UZ: '+998', // Uzbekistan
  // Country.VA: '+379', // Holy See
  // Country.VC: '+1', // Saint Vincent and the Grenadines
  // Country.VE: '+58', // Venezuela (Bolivarian Republic of)
  // Country.VG: '+1', // Virgin Islands (British)
  // Country.VI: '+1', // Virgin Islands (U.S.)
  // Country.VN: '+84', // Viet Nam
  // Country.VU: '+678', // Vanuatu
  // Country.WF: '+681', // Wallis and Futuna
  // Country.WS: '+685', // Samoa
  // Country.YE: '+967', // Yemen
  // Country.YT: '+262', // Mayotte
  // Country.ZA: '+27', // South Africa
  // Country.ZM: '+260', // Zambia
  // Country.ZW: '+263', // Zimbabwe
};
