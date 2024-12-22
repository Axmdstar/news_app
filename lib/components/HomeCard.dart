// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class Homecard extends StatelessWidget {
//   const Homecard({Key? key}) : super(key: key);
  

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       height: 320,
//       width: double.infinity,
//       clipBehavior: Clip.antiAlias,
//       decoration: ShapeDecoration(
//         image: const DecorationImage(image: AssetImage("images/thomas-charters-zAi2Is48-MA-unsplash.jpg"), fit: BoxFit.fill),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment(0.00, -1.00),
//                 end: Alignment(0, 1),
//                 colors: [Color(0x0029272E), Color(0xFF29272E)],
//               ),
//             ),
//             child: const Row(
//               children: [
                
//                 Gap(16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Gap(4),
//                       Text(
//                         'Constructive and destructive waves',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w600,
//                           height: 0,
//                           letterSpacing: -0.96,
//                         ),
//                       ),
//                       const Gap(4),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Homecard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const Homecard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 900,
      // clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fitHeight),
        shape: RoundedRectangleBorder(
          
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0x0029272E), Color(0xFF29272E)],
              ),
            ),
            child: Row(
              children: [
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(4),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: -0.96,
                        ),
                      ),
                      const Gap(4),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
