import 'package:flutter/material.dart';

import 'Screens/CategoriesScreen/Categories.dart';
import 'Screens/FavouriteAds/FavAds.dart';
import 'Screens/Hidden Ads/hiddenAds.dart';
import 'Screens/My Account/myAccount.dart';
import 'Screens/MyAds/myAds.dart';
import 'Screens/Pending Ads/pendingAds.dart';
import 'Screens/Resubmit Ads/resubmitAds.dart';
import 'Screens/Sub-Categories/subCategory.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2962D1),
        accentColor: Color(0xFFF3F3F3),
      ),
      home: ResubmitAds(),

));