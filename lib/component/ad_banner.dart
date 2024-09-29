// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class AdBanner extends StatefulWidget {
//   const AdBanner({Key? key}) : super(key: key);
//
//   @override
//   _AdBannerState createState() => _AdBannerState();
// }
//
// class _AdBannerState extends State<AdBanner> {
//   BannerAd? _bannerAd;
//   bool _isAdLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadAd();
//   }
//
//   void _loadAd() {
//     _bannerAd = BannerAd(
//       adUnitId: '<YOUR_AD_UNIT_ID>',
//       request: AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           setState(() {
//             _isAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           ad.dispose();
//         },
//       ),
//     )..load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_isAdLoaded && _bannerAd != null) {
//       return Container(
//         width: _bannerAd!.size.width.toDouble(),
//         height: _bannerAd!.size.height.toDouble(),
//         child: AdWidget(ad: _bannerAd!),
//       );
//     } else {
//       return SizedBox.shrink();
//     }
//   }
//
//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }
// }
