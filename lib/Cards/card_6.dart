import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class Card6 extends StatelessWidget {
  const Card6({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F6FA),
        borderRadius: BorderRadius.circular(16)
      ),
      child:  Row(
        children: [
          const SizedBox(
            height: 48,
            width: 48,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://s3-alpha-sig.figma.com/img/0e5d/8279/8e2becda16e2f3abc85e162b63a8d214?Expires=1704067200&Signature=m-pJeD~ylRMmgirPNxn9wu78ryYRNN8xngruQYngKINrixxDESYinftuHmb~9F~CQx2-GdfV0fRs~X1gW2IB-8IEFU-hF5Nv4Vw8c5MVQzGuGDP31efhIiT8l2QzxZxlLRjIuiX3d3HugZ-ov6JJOKYiDLhrABDu5PCiB4dxip93zNbONILiQ2RQwz-pibJOhAZvQ1oQ2FPLj26KbmdVBFvon~t8h79qZstV8eKeox0~v4h71uFRIFMDQKJ8WlqJq~s~exK9JZq7QXazdc9V9UXjd92~JacRpjPS4kG896j8dtbbDlvJCFghb9Fb81W~L8WclNPcC1bRWNRT1RwMjA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),

            ),
          ),
          const Gap(8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Jerome Bell", style: TextStyle(
                  color: Color(0xFF29272E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.64,
                ),),
                Gap(8),
                Text("@whitefish664", style: TextStyle(
                  color: Color(0xFFA7A5AC),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.56,
                ),)
              ],
            ),
          ),
         const Gap(8),
         SizedBox(
           width: 65,
           height: 41,
           child: FilledButton(

               onPressed: null,
               style: ButtonStyle(
                 padding:const WidgetStatePropertyAll(EdgeInsets.all(12)),
                 backgroundColor: const WidgetStatePropertyAll(Color(0xFF7949FF)),
                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),),

               ),
               child:const Text("Follow", style: TextStyle(
                 color: Colors.white,
                 fontSize: 14,
                 fontFamily: 'Inter',
                 fontWeight: FontWeight.w600,
                 height: 0,
                 letterSpacing: -0.56,
               ),),
           ),
         )
        
          
        ],
      ),
    );
  }
}
