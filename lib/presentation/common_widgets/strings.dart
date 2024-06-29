import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final sessionGlobalKey = GlobalKey();

enum Tabs { Home, Notifications, Profile }

final navigatorKeys = {
  Tabs.Home: GlobalKey<NavigatorState>(),
  Tabs.Notifications: GlobalKey<NavigatorState>(),
  Tabs.Profile: GlobalKey<NavigatorState>(),
};

enum AllowedDates { all, before, after }

enum Roles { individual, entity }

enum MRSorts { newAsc, newDesc, miaAsc, miaDesc }

const DEFAULT_LOCALE = 'ru';

const PLATFORM_IOS = 1;
const PLATFORM_ANDROID = 2;

const String formError = 'Заполните поле';
const Duration minFirstDateOfCalendar = Duration(days: -(365 * 150));
const Duration maxLastDateOfCalendar = Duration(days: 365 * 100);
final GlobalKey bottomNavBarKey = GlobalKey();
NumberFormat formatter = NumberFormat.decimalPattern();

// enum Use