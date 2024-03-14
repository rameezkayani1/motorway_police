// import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdmobHelper {
//   static String get bannerID => Platform.isAndroid
//       ? 'ca-app-pub-1520756577490510/6755705022'
//       : 'ca-app-pub-1520756577490510/6755705022';

//   static initialize() {
//     // ignore: unnecessary_null_comparison
//     if (MobileAds.instance == null) {
//       MobileAds.instance.initialize();
//     }
//   }

//   static BannerAd getBannerAd() {
//     BannerAd bAd = BannerAd(
//         size: AdSize.fullBanner,
//         adUnitId: bannerID,
//         listener: BannerAdListener(onAdClosed: (Ad ad) {
//           print("Ad Closed");
//         }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           ad.dispose();
//         }, onAdLoaded: (Ad ad) {
//           print('Ad Loaded');
//         }, onAdOpened: (Ad ad) {
//           print('Ad opened');
//         }),
//         request: const AdRequest());

//     return bAd;
//   }
// }
