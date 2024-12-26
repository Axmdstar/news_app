import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/components/HomeCard.dart';


class Topicscards extends StatefulWidget {
  String? title;
  String? urlToImage;
  String? publishedAt;
  String? url;
  final String topic;

  Topicscards({super.key, required this.topic});

  @override
  _NewfiltercardState createState() => _NewfiltercardState();
}

class _NewfiltercardState extends State<Topicscards> {
  @override
  Widget build(BuildContext context) {
    print(widget.topic);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: widget.url ?? '', 
              title: widget.title ?? '', 
              imgUrl: widget.urlToImage ?? ''),
          ),
        );
      },
      child:  Container(
      height: 123,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(widget.urlToImage ?? ''),
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
                  widget.title ?? '',
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
        ],
      ),
    )
  );
  }
}
