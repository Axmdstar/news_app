// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:intl/intl.dart';
// import 'package:news_app/components/HomeCard.dart';


// class Newfiltercard extends StatefulWidget {
//   final String title;
//   final String urlToImage;
//   final String publishedAt;
//   final String url;

//   const Newfiltercard({super.key, required this.title, required this.urlToImage, required this.publishedAt, required this.url});

//   @override
//   _NewfiltercardState createState() => _NewfiltercardState();
// }



// class _NewfiltercardState extends State<Newfiltercard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => WebViewScreen(url: widget.url, title: widget.title, imgUrl: widget.urlToImage),
//           ),
//         );
//       },
//       child:  Container(
//         margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 3,
//               spreadRadius: 2,
//               offset: const Offset(2, 6)
//             ),
//           ],
//         ),
//       height: 123,
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           Container(
//             width: 124,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   offset: const Offset(12, 26),
//                   blurRadius: 50,
//                   spreadRadius: 0,
//                   color: Colors.black.withOpacity(.1),
//                 )
//               ],
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                 image: NetworkImage(widget.urlToImage),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const Gap(16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Gap(8),
//                 Text(
//                   widget.title,
//                   style: const TextStyle(
//                     color: Color(0xFF29272E),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                     letterSpacing: -0.56,
//                     overflow: TextOverflow.fade,
//                   ),
//                 ),
//                 Text(
//                   DateFormat("MMMM dd, HH:mm")
//                   .format(DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(widget.publishedAt, true)),
//                   style: const TextStyle(
//                     color: Color(0xFFA7A5AC),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                     letterSpacing: -0.56,
//                     overflow: TextOverflow.fade,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     )
//   );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:news_app/components/HomeCard.dart';

class Newfiltercard extends StatefulWidget {
  final String title;
  final String urlToImage;
  final String publishedAt;
  final String url;

  const Newfiltercard({
    super.key,
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
    required this.url,
  });

  @override
  _NewfiltercardState createState() => _NewfiltercardState();
}

class _NewfiltercardState extends State<Newfiltercard> {
  // String formattedDate() {
  //   try {
  //     return DateFormat("MMMM dd, HH:mm").format(
  //       DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(widget.publishedAt, true),
  //     );
  //   } catch (e) {
  //     return "Invalid date";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: widget.url,
              title: widget.title,
              imgUrl: widget.urlToImage,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(2, 6),
            ),
          ],
        ),
        height: 123,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 124,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: widget.urlToImage.isNotEmpty
                      ? NetworkImage(widget.urlToImage)
                      : Image.asset(
                    "images/News.png",
                    height: 140,
                  ) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(8),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xFF29272E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      letterSpacing: -0.56,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Gap(8),
                  Text(
                    widget.publishedAt,
                    style: const TextStyle(
                      color: Color(0xFFA7A5AC),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
