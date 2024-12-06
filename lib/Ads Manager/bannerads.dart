import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  static String get bannerID => Platform.isAndroid
      ? 'ca-app-pub-2626852667226982/4236321266'
      : 'ca-app-pub-2626852667226982/4236321266';

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd() {
    BannerAd bAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: bannerID,
        listener: BannerAdListener(onAdClosed: (Ad ad) {
          print("Ad Closed");
        }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        }, onAdLoaded: (Ad ad) {
          print('Ad Loaded');
        }, onAdOpened: (Ad ad) {
          print('Ad opened');
        }),
        request: const AdRequest());

    return bAd;
  }
}
