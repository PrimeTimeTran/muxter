// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:icon_forest/amazingneoicons.dart';
// import 'package:icon_forest/app_crypto_icons.dart';
// import 'package:icon_forest/bytesize.dart';
// import 'package:icon_forest/don_icons.dart';
// import 'package:icon_forest/flat_icons_arrows.dart';
// import 'package:icon_forest/flat_icons_medium.dart';
// import 'package:icon_forest/gala_icons.dart';
// import 'package:icon_forest/icon_search.dart';
// import 'package:icon_forest/iconoir.dart';
// import 'package:icon_forest/kicons_emoji.dart';
// import 'package:icon_forest/mbi_combi.dart';
// import 'package:icon_forest/mbi_linecons.dart';
// import 'package:icon_forest/system_uicons.dart';
// import 'package:icon_forest/ternav_icons_duotone.dart';

// class AvailableIcons extends StatelessWidget {
//   const AvailableIcons({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const IconsPage(title: 'Icon Forest Demo');
//   }
// }

// class CustomScrollBehavior extends MaterialScrollBehavior {
//   const CustomScrollBehavior() : super();
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse,
//         PointerDeviceKind.stylus,
//         PointerDeviceKind.invertedStylus,
//         PointerDeviceKind.unknown,
//       };
// }

// class IconsPage extends StatefulWidget {
//   final String title;
//   const IconsPage({super.key, required this.title});

//   @override
//   State<IconsPage> createState() => _IconsPageState();
// }

// class _IconsPageState extends State<IconsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ListView(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             children: const [
//               SizedBox(
//                   height: 500, width: double.infinity, child: IconSearch()),
//               ListTile(
//                 title: Text('AmazingNeoIcons'),
//                 leading: Icon(AmazingNeoIcons.airplane),
//               ),
//               ListTile(
//                 title: Text('Iconoir'),
//                 leading: Iconoir(Iconoir.dice_five),
//               ),
//               ListTile(
//                 title: Text('Mbi combi'),
//                 leading: Icon(MbiCombiIcons.placeholder),
//               ),
//               ListTile(
//                 title: Text('Mbi linecons'),
//                 leading: Icon(MbiLineconsIcons.data),
//               ),
//               ListTile(
//                 title: Text('DonIcons'),
//                 leading: Icon(DonIcons.add_square),
//               ),
//               ListTile(
//                 title: Text('FlatIconsArrows'),
//                 leading: Icon(FlatIconsArrows.back_a),
//               ),
//               ListTile(
//                 title: Text('FlatIconsMedium'),
//                 leading: Icon(FlatIconsMedium.agenda),
//               ),
//               ListTile(
//                 title: Text('KiconsEmoji'),
//                 leading: Icon(KiconsEmoji.astonished),
//               ),
//               ListTile(
//                 title: Text('SystemUicons'),
//                 leading: SystemUicons(SystemUicons.browser),
//               ),
//               ListTile(
//                 title: Text('TernavIconsDuotone'),
//                 leading: TernavIconsDuotone(TernavIconsDuotone.Aligncenter),
//               ),
//               ListTile(
//                 title: Text('AppCryptoIcons'),
//                 leading: AppCryptoIcons(AppCryptoIcons.band),
//               ),
//               ListTile(
//                 title: Text('Bytesize'),
//                 leading: Bytesize(Bytesize.camera),
//               ),
//               ListTile(
//                 title: Text('GalaIcons'),
//                 leading: GalaIcons(GalaIcons.gala_airplay),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
