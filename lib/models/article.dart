import 'package:flutter/material.dart';
import 'package:news_app/services/api_service.dart';


class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    loadJsonData(); // Call the loadJsonData function once
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: ListView.builder(
        itemCount: newsData['articles']?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(newsData['articles'][index]['title']),
            subtitle: Text(newsData['articles'][index]['description']),
          );
        },
      ),
    );
  }
}


// // import 'dart:convert';

// // Define Article model
// import 'dart:convert';

// import 'package:flutter/services.dart';

// class Article {
//   final String? author;
//   final String title;
//   final String description;
//   final String url;
//   final String urlToImage;
//   final String publishedAt;
//   final String? content;

//   Article({
//     this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     this.content,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) {
//     return Article(
//       author: json['author'],
//       title: json['title'],
//       description: json['description'],
//       url: json['url'],
//       urlToImage: json['urlToImage'],
//       publishedAt: json['publishedAt'],
//       content: json['content'],
//     );
//   }
// }

// // Define NewsData model
// class NewsData {
//   final String status;
//   final int totalResults;
//   final List<Article> articles;

//   NewsData({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });

//   factory NewsData.fromJson(Map<String, dynamic> json) {
//     return NewsData(
//       status: json['status'],
//       totalResults: json['totalResults'],
//       articles: (json['articles'] as List)
//           .map((article) => Article.fromJson(article))
//           .toList(),
//     );
//   }
// }




// const demoJsonData = '''
// {
//   "status": "ok",
//   "totalResults": 34,
//   "articles": [
//     {
//       "source": {
//         "id": "cnn",
//         "name": "CNN"
//       },
//       "author": "John Fritze",
//       "title": "Durbin uses new report to accuse Justices Thomas and Alito of violating disclosure laws - CNN",
//       "description": "A top Senate Democrat on Saturday accused conservative Supreme Court justices of violating federal disclosure laws in a lengthy report that caps a monthslong investigation by the Senate Judiciary Committee and comes weeks before Republicans take control of th…",
//       "url": "https://www.cnn.com/2024/12/21/politics/durbin-report-thomas-alito-disclosure-laws-supreme-court/index.html",
//       "urlToImage": "https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1235407844.jpg?c=16x9&q=w_800,c_fill",
//       "publishedAt": "2024-12-21T12:00:00Z",
//       "content": "A top Senate Democrat on Saturday accused conservative Supreme Court justices of violating federal disclosure laws in a lengthy report that caps a monthslong investigation by the Senate Judiciary Com… [+2734 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Aviationa2z.com"
//       },
//       "author": "Kashyap Velani",
//       "title": "Malaysia Approves New \$70 Million Search for Missing MH370 Flight - Aviation A2z",
//       "description": "Malaysia announces restart of the MH370 flight search, offering hope to families after nearly a decade of uncertainty.",
//       "url": "https://aviationa2z.com/index.php/2024/12/21/malaysia-approves-search-for-missing-mh370-flight/",
//       "urlToImage": "https://aviationa2z.com/wp-content/uploads/2024/03/Boeing_777_Malaysia_Airlines_Auckland.jpg",
//       "publishedAt": "2024-12-21T11:57:09Z",
//       "content": "KUALA LUMPUR- The Malaysian government has announced its agreement, in principle, to restart the search for a passenger jet that disappeared a decade ago, marking one of aviation’s most perplexing my… [+3799 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Forbes"
//       },
//       "author": "Brian Mazique",
//       "title": "Tyson Fury Weighs In With Massive Weight Advantage Over Oleksandr Usyk - Forbes",
//       "description": "Tyson Fury has to believe he’ll be better if he’s heavier. He weighed in a whopping 281 pounds while Usyk tipped the scales at 226 pounds.",
//       "url": "https://www.forbes.com/sites/brianmazique/2024/12/21/tyson-fury-weighs-in-with-massive-weight-advantage-over-oleksandr-usyk/",
//       "urlToImage": "https://imageio.forbes.com/specials-images/imageserve/676633620e1066872af33dd5/0x0.jpg?format=jpg&crop=2343,1318,x0,y50,safe&height=900&width=1600&fit=bounds",
//       "publishedAt": "2024-12-21T07:00:52Z",
//       "content": "RIYADH, SAUDI ARABIA - DECEMBER 20: Oleksandr Usyk and Tyson Fury 2 pose for a photo during the ... [+] weigh-in as part of Oleksandr Usyk v Tyson Fury 2 at on December 20, 2024 in Riyadh, . (Photo b… [+2601 chars]"
//     },
//     {
//       "source": {
//         "id": "al-jazeera-english",
//         "name": "Al Jazeera English"
//       },
//       "author": "Al Jazeera",
//       "title": "At least two dead as car slams into crowded Christmas market in Germany - Al Jazeera English",
//       "description": "The driver involved in the ramming has been taken into custody, with officials calling the incident an attack.",
//       "url": "https://www.aljazeera.com/news/2024/12/20/two-dead-as-car-ploughs-into-christmas-market-crowd-in-germany",
//       "urlToImage": "https://www.aljazeera.com/wp-content/uploads/2024/12/2024-12-20T214844Z_564922975_RC29TBA1QLAB_RTRMADP_3_GERMANY-SECURITY-1734732245.jpg?resize=1920%2C1440",
//       "publishedAt": "2024-12-21T05:55:23Z",
//       "content": "At least two people are dead and as many as 68 injured after a car rammed into a crowded Christmas market in the city of Magdeburg, the capital of the central German state of Saxony-Anhalt.\r\nOfficial… [+6398 chars]"
//     },
//     {
//       "source": {
//         "id": "associated-press",
//         "name": "Associated Press"
//       },
//       "author": "MELISSA GOLDIN",
//       "title": "Musk helped kill a congressional spending bill. But much of what he spread was misinformation - The Associated Press",
//       "description": "President Donald Trump’s billionaire ally Elon Musk used his outsize influence on X to help kill a bipartisan funding proposal that would have prevented a government shutdown, spreading multiple false claims in the process. The X owner, an unelected figure, p…",
//       "url": "https://apnews.com/article/elon-musk-misinformation-government-shutdown-bill-budget-trump-musk-1235b15b425856bf902d0c8133eec222",
//       "urlToImage": "https://dims.apnews.com/dims4/default/42ceb36/2147483647/strip/true/crop/8256x4644+0+430/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F60%2F0d%2F072e89420e65a597522299bb32f5%2F1ee306173ed546a1823bb6c202233951",
//       "publishedAt": "2024-12-21T05:52:00Z",
//       "content": "President-elect Donald Trumps billionaire ally Elon Musk played a key role this week in killing a bipartisan funding proposal that would have prevented a government shutdown, railing against the plan… [+4492 chars]"
//     },
//     {
//       "source": {
//         "id": "fortune",
//         "name": "Fortune"
//       },
//       "author": "Sasha Rogelberg",
//       "title": "Despite missing deadline, Congress avoids government shutdown by passing spending bill without Trump's debt ceiling raise - Fortune",
//       "description": "Republicans, keen to dodge a shutdown, decided to only introduce a one-vote spending package.",
//       "url": "https://fortune.com/2024/12/21/government-shutdown-congress-spending-bill-donald-trump-debt-ceiling-elon-musk/",
//       "urlToImage": "https://fortune.com/img-assets/wp-content/uploads/2024/12/GettyImages-2190746766-e1734727159577.jpg?resize=1200,600",
//       "publishedAt": "2024-12-21T05:41:00Z",
//       "content": null
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "CBS Sports"
//       },
//       "author": "",
//       "title": "WATCH: Notre Dame explodes out of CFP gates with incredible 98-yard TD by Jeremiyah Love vs. Indiana - CBS Sports",
//       "description": "Love's 98-yard carry tied the longest in school history",
//       "url": "https://www.cbssports.com/college-football/news/watch-notre-dame-explodes-out-of-cfp-gates-with-incredible-98-yard-td-by-jeremiyah-love-vs-indiana/",
//       "urlToImage": "https://sportshub.cbsistatic.com/i/r/2024/12/21/3474e38e-93ab-4f5c-a275-39b0affdc3ac/thumbnail/1200x675/e5bfc3cac2af2f82efab1927499d64c4/love-td-1.jpg",
//       "publishedAt": "2024-12-21T04:56:00Z",
//       "content": "Notre Dame running back Jeremiyah Love etched his name into the history books by breaking off a 98-yard touchdown for the first points of the 12-team College Football Playoff. The rush tied for the l… [+1202 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "New York Post"
//       },
//       "author": "Mark W. Sanchez",
//       "title": "Yankees trade Jose Trevino to Reds for Fernando Cruz, Alex Jackson - New York Post ",
//       "description": "The Yankees have traded the veteran catcher to the Reds in exchange for reliever Fernando Cruz and catcher Alex Jackson, The Post’s Joel Sherman reported.",
//       "url": "https://nypost.com/2024/12/20/sports/yankees-trade-jose-trevino-to-reds-for-fernando-cruz-alex-jackson/",
//       "urlToImage": "https://nypost.com/wp-content/uploads/sites/2/2024/12/newspress-collage-089wwiqld-1734752039509.jpg?quality=75&strip=all&1734734064&w=1024",
//       "publishedAt": "2024-12-21T03:39:00Z",
//       "content": "With a surprise late-Friday trade, the Yankees added a high-octane bullpen arm, trimmed a bit of payroll and lost an elite pitch-framer. \r\nJose Trevino, an All-Star in 2022 and among the games best a… [+1920 chars]"
//     },
//     {
//       "source": {
//         "id": "cnn",
//         "name": "CNN"
//       },
//       "author": "Lauren Izso, Edward Szekeres",
//       "title": "Tel Aviv hit by projectile fired from Yemen, say Israeli officials - CNN",
//       "description": "A projectile fired from Yemen hit Tel Aviv overnight into Saturday, Israeli authorities said, in a rare instance of a failed interception over the city.",
//       "url": "https://www.cnn.com/2024/12/20/middleeast/tel-aviv-hit-by-projectile-from-yemen-intl-hnk/index.html",
//       "urlToImage": "https://media.cnn.com/api/v1/images/stellar/prod/2024-12-21t031227z-855308617-rc2etbadw2xt-rtrmadp-3-israel-palestinians-yemen.JPG?c=16x9&q=w_800,c_fill",
//       "publishedAt": "2024-12-21T03:26:34Z",
//       "content": "A projectile fired from Yemen hit Tel Aviv overnight into Saturday, Israeli authorities said, in a rare instance of a failed interception over the city.\r\nThe projectile landed in Tel Avivs southern J… [+2112 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Chalkbeat Colorado"
//       },
//       "author": "Reema Amin",
//       "title": "Chicago school board fires Chicago Public Schools CEO Pedro Martinez after months of tension - Chalkbeat",
//       "description": "The firing comes after a months-long effort by the mayor’s office to oust Martinez amid contract negotiations with the Chicago Teachers Union.",
//       "url": "https://www.chalkbeat.org/chicago/2024/12/21/board-of-education-fires-pedro-martinez/",
//       "urlToImage": "https://www.chalkbeat.org/resizer/v2/2CC26HCMNVD5VNBAZDTYSWW62I.jpg?smart=true&auth=b8989d841f6f1cde10bb8fb4ac6edbbc2f1947732ac11141d8226d780eb80ebb&width=1200&height=630",
//       "publishedAt": "2024-12-21T03:17:00Z",
//       "content": "Sign up for Chalkbeat Chicagos free daily newsletter to keep up with the latest news on Chicago Public Schools.\r\nChicago Mayor Brandon Johnsons hand-picked school board voted Friday to fire Chicago P… [+10073 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Hindustan Times"
//       },
//       "author": "Aditi Srivastava",
//       "title": "Diddy sued by 2006 NYC contest winner for sexual assault, shares photos; mogul’s attorney responds - Hindustan Times",
//       "description": "LaTroya Grayson is suing Sean Diddy Combs for \$15 million, alleging drugging and rape during a 2006 party. Combs' legal team has refuted the claims. | Hollywood",
//       "url": "https://www.hindustantimes.com/entertainment/hollywood/diddy-sued-by-2006-nyc-contest-winner-for-sexual-assault-shares-photos-mogul-s-attorney-responds-101734750416194.html",
//       "urlToImage": "https://www.hindustantimes.com/ht-img/img/2024/12/21/1600x900/PEOPLE-SEAN-COMBS--0_1733406914208_1734750688901.JPG",
//       "publishedAt": "2024-12-21T03:16:16Z",
//       "content": "Sean \"Diddy\" Combs is facing a new lawsuit from a woman who claims he sexually assaulted her in 2006. The woman, who won a contest to spend a day with Diddy and enjoy his party, alleges that he drugg… [+3214 chars]"
//     },
//     {
//       "source": {
//         "id": "associated-press",
//         "name": "Associated Press"
//       },
//       "author": "STEPHEN GROVES",
//       "title": "Senate to take final vote on boosting Social Security benefits for many public service retirees - The Associated Press",
//       "description": "The Senate is moving to a final vote on a proposal to boost Social Security payments for millions of people, potentially pushing a longtime priority for former public employees through Congress in one of its last acts for the year. The bipartisan bill next he…",
//       "url": "https://apnews.com/article/social-security-congress-565aaf221de6d607f207e286655eef25",
//       "urlToImage": "https://dims.apnews.com/dims4/default/79033f2/2147483647/strip/true/crop/5555x3125+0+289/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F72%2F44%2Fa19b768c47401387c719396c4dc6%2F03a47f808fb344119a0f3100b6348269",
//       "publishedAt": "2024-12-21T01:48:00Z",
//       "content": "WASHINGTON (AP) The Senate was moving late Friday to a final vote on a proposal to boost Social Security payments for millions of people, potentially pushing a longtime priority for former public emp… [+4231 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Wrestleview.com"
//       },
//       "author": "Alex Kahrs",
//       "title": "WWE SmackDown Results – 12/20/24 (Women’s Tag Titles on the line, and more!) - Wrestleview.com",
//       "description": "WWE SmackDown ResultsDecember 20, 2024Hartford, Connecticut (XL Center)Results by: Alex Kahrs of Wrestleview.com With just two shows left…",
//       "url": "https://www.wrestleview.com/top-story/336664-wwe-smackdown-results-12-20-24-womens-tag-titles-on-the-line-and-more/",
//       "urlToImage": "http://www.wrestleview.com/wp-content/uploads/2024/12/wwesmackdown2024.jpg",
//       "publishedAt": "2024-12-21T01:02:02Z",
//       "content": "WWE SmackDown ResultsDecember 20, 2024Hartford, Connecticut (XL Center)Results by: Alex Kahrs of Wrestleview.com\r\nWith just two shows left in the year (and the last two 2-hour episodes for the forese… [+15893 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "BBC News"
//       },
//       "author": null,
//       "title": "Sega considering Netflix-like game subscription service - BBC.com",
//       "description": "It's another sign the industry is moving away from owning games - some fear that means gamers having to "shell out more."",
//       "url": "https://www.bbc.com/news/articles/ckgnj7e8028o",
//       "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/4027/live/5adff460-bd4e-11ef-a164-7d6c07cbd92c.png",
//       "publishedAt": "2024-12-20T23:37:41Z",
//       "content": "Sonic x Shadow Generations sold more than 1 million copies in a single day when it launched in October\r\nSega is considering launching its own Netflix-like subscription service for video games, a move… [+5807 chars]"
//     },
//     {
//       "source": {
//         "id": "associated-press",
//         "name": "Associated Press"
//       },
//       "author": "THE ASSOCIATED PRESS",
//       "title": "Cyclone Chido's devastation of Mayotte was immediate and decades coming - The Associated Press",
//       "description": "The devastation from Cyclone Chido that shattered corrugated metal shacks and thousands of lives on the island of Mayotte was both immediate and long coming.",
//       "url": "https://apnews.com/article/mayotte-cyclone-photos-dad1e05aea1ec1de518fec9b2b0fbef1",
//       "urlToImage": "https://dims.apnews.com/dims4/default/80bc437/2147483647/strip/true/crop/3000x1688+0+156/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F1d%2F86%2F85c10bc543d07108d18853b51852%2F54bd73ba33e94a4fa4529babfb99e086",
//       "publishedAt": "2024-12-20T23:15:00Z",
//       "content": "The devastation from Cyclone Chido that shattered corrugated metal shacks and thousands of lives on the island of Mayotte was both immediate and long coming.\r\nResidents of Mayotte, one of 12 tiny ove… [+4981 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Financial Times"
//       },
//       "author": "Zehra Munir",
//       "title": "Eli Lilly given green light in US to treat sleep disorder with weight-loss drug - Financial Times",
//       "description": "Regulatory go-ahead marks latest boost for drugmaker’s blockbuster anti-obesity franchise",
//       "url": "https://www.ft.com/content/d7fb5cf1-e6d2-4aa9-8c42-8faf67388069",
//       "urlToImage": "https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fd1e00ek4ebabms.cloudfront.net%2Fproduction%2F8724dfdf-3344-40b4-a65a-dce09901e854.jpg?source=next-barrier-page",
//       "publishedAt": "2024-12-20T22:33:21Z",
//       "content": "Try unlimited access\r\nOnly \$1 for 4 weeks\r\nThen \$75 per month.\r\nComplete digital access to quality FT journalism on any device. \r\nCancel anytime during your trial."
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "Kansas City Star"
//       },
//       "author": "Jonathan Shorman, Kacen Bayless",
//       "title": "Missouri governor frees Eric DeValkenaere, first KC cop convicted of killing a Black man - Kansas City Star",
//       "description": "MO Governor Mike Parson commutes prison sentence of Eric DeValkenaere, first Kansas City police officer convicted of killing a Black man.",
//       "url": "https://www.kansascity.com/news/local/crime/article277065808.html",
//       "urlToImage": "https://www.kansascity.com/latest-news/iuq24t/picture295506404/alternates/LANDSCAPE_1140/devalkenaere.JPG",
//       "publishedAt": "2024-12-20T22:23:00Z",
//       "content": "Crime\r\nMissouri Gov. Mike Parson on Friday commuted the prison sentence of former Kansas City police detective Eric DeValkenaere, the first Kansas City officer ever convicted of killing a Black man, … [+10584 chars]"
//     },
//     {
//       "source": {
//         "id": "usa-today",
//         "name": "USA Today"
//       },
//       "author": "Clare Mulroy, Jay Stahl",
//       "title": "Barack Obama shares 2024 favorites: Sally Rooney, 'Dune: Part Two' make the list - USA TODAY",
//       "description": "The former president unveiled his favorite things to read, watch and listen to over the past year. "Dune: Part Two" and Shaboozey received mentions.",
//       "url": "https://www.usatoday.com/story/entertainment/celebrities/2024/12/20/barack-obama-favorites-2024/77105982007/",
//       "urlToImage": "https://www.usatoday.com/gcdn/authoring/authoring-images/2024/10/17/USAT/75717095007-afp-2177111514.jpg?crop=5637,3171,x6,y151&width=3200&height=1801&format=pjpg&auto=webp",
//       "publishedAt": "2024-12-20T22:22:07Z",
//       "content": "Forty-four is naming his 2024 favorites.\r\nFormer President Barack Obama unveiled his annual list of pop culture picks Friday.\r\n\"I always look forward to sharing my annual list of favorite books, movi… [+2590 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "New York Post"
//       },
//       "author": "Associated Press",
//       "title": "JPMorgan, Wells Fargo, BofA facing federal lawsuit over Zelle payment network fraud - New York Post ",
//       "description": "A federal regulator sued JPMorgan Chase, Wells Fargo and Bank of America on Friday, claiming the banks failed to protect hundreds of thousands of consumers from rampant fraud on the popular payment…",
//       "url": "https://nypost.com/2024/12/20/business/jpmorgan-wells-fargo-bofa-facing-federal-lawsuit-over-zelle-payment-network-fraud/",
//       "urlToImage": "https://nypost.com/wp-content/uploads/sites/2/2024/12/newspress-collage-nd1zmpibm-1734728485776.jpg?quality=75&strip=all&1734710583&w=1024",
//       "publishedAt": "2024-12-20T21:53:00Z",
//       "content": "A federal regulator sued JPMorgan Chase, Wells Fargo and Bank of America on Friday, claiming the banks failed to protect hundreds of thousands of consumers from rampant fraud on the popular payments … [+2564 chars]"
//     },
//     {
//       "source": {
//         "id": null,
//         "name": "STAT"
//       },
//       "author": "Megan Molteni",
//       "title": "Rapid spread of H5N1 bird flu through California dairy herds suggests unknown paths of transmission - STAT",
//       "description": "Reports that cows have been infected despite farmers' preventive measures indicate there are multiple routes of transmission",
//       "url": "https://www.statnews.com/2024/12/20/california-h5n1-bird-flu-emergency-declaration-avian-flu-spread-dairy-cattle/",
//       "urlToImage": "https://www.statnews.com/wp-content/uploads/2024/12/GettyImages-1210114330-1024x576.jpg",
//       "publishedAt": "2024-12-20T21:29:07Z",
//       "content": "In the ongoing outbreak of H5N1 bird flu among the nations dairy cattle, federal officials have consistently expressed confidence that they know enough about how the virus is spreading to put a stop … [+11968 chars]"
//     }
//   ]
// }
// ''';


// Future<NewsData> loadDemoNews() async {
//   final jsonString = await rootBundle.loadString('demo.json');
//   final jsonData = jsonDecode(jsonString);
//   return NewsData.fromJson(jsonData);
// }


// void getdata() async{
//   final jsonString = await rootBundle.loadString('demo.json');
//   final jsonData = jsonDecode(jsonString);
//   NewsData newsData = NewsData.fromJson(jsonData);
//   print(newsData.articles.first.title); // Output: Durbin uses new report...
  
//   // print(newsData.articles.first.title); // Output: Durbin uses new report...
// }