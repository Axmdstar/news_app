import 'package:flutter/material.dart';
class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 136,
      width: double.infinity,
      decoration: ShapeDecoration(
          color:const Color(0xFFF7F6FA),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(12)
       )


      ),
      child: Row(
        children: [
          Expanded(child: Container(
            padding:const EdgeInsets.all(16),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const  Text("Constructive and destructive waves", style: TextStyle(
                  color: Color(0xFF29272E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.64,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:List.generate(5, (index) => Icon(Icons.star, color: index==0?const Color(0xFFF5BE2E):const Color(0xFFE2DEE9),)),
                    ),
                    const Icon(Icons.bookmark_border, color: Colors.black, size: 24,)
                  ],
                )
              ],
            ),
          )),
          Container(
            height: 136,
            width: 148,
            decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://s3-alpha-sig.figma.com/img/234b/2a75/407c63c81bbefe9dce7316920415ce51?Expires=1704067200&Signature=Tz8~chAPIx1vszCFzqWtOb8vWpk~gACjJi-KQd-nSOZIsSc--EfxT6av7UR849GzYT77XjPv72M1pgo8bgsK9AOro1LUMnqI7MraqlZ4q-X8FE~QUU67fkQAjZu1ep5uYkleMs42dgQipwVXvB~agOqzQ3d3QsYCDOIkevwD~mylZ1HRkIcaTt7NS~Xk-cx3w5t23pMmsfkRMZI498bVouZc9B33u~9X3-r9v8CIENBOwGD79If8YyrJJexFNqIOls6BFdmrhtklJd-jftkwOkUEws-ItsF10gfb-kr4qhXWdP-pkrKxKDqci6TESs~sl6oB7mbCM8hXPASBDZKwTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"), fit: BoxFit.fill
              )
            ),

          )
        ],
      ),
    );
  }
}
