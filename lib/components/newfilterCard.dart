import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Newfiltercard extends StatelessWidget {
  final String newtitle;
  final String imageUrl;

  Newfiltercard({required this.newtitle, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(16),
      //   color: const Color(0xFFF7F6FA),
      // ),
      child: Row(
        children: [
          Container(
            // height: 74,
            width: 124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(8),
                  Text(
                    newtitle,
                    style: const TextStyle(
                      color: Color(0xFF29272E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.56,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  
                  const Text(
                    'October 30, 2023',
                    style: TextStyle(
                      color: Color(0xFFA7A5AC),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
