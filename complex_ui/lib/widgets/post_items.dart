// // import 'package:flutter/material.dart';

// // import '../models/posts.dart';

// // class PostItems extends StatefulWidget {
// //   const PostItems({super.key, required this.posts});
// //   final Posts posts;

// //   @override
// //   State<PostItems> createState() => _PostItemsState();
// // }

// // class _PostItemsState extends State<PostItems> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return 
// //   }
// // }

// ListView.builder(
//               itemCount: UserModel.user.length,
//               itemBuilder: (context, index) {
//                 Users user = UserModel.user[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Container(
//                     height: 300,
//                     // width: 200,
//                     decoration: BoxDecoration(
//                         color: const Color.fromARGB(97, 16, 15, 15)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(CupertinoIcons.person_crop_circle),
//                             Text(user.name),
//                           ],
//                         ),
//                         ListView.builder(
//                           itemCount: user.posts.length,
//                           itemBuilder: (context, index) {
//                             Posts post = user.posts[index];
//                             return Container(
//                               height: 220,
//                               width: 355,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     post.image,
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Icon(CupertinoIcons.suit_heart),
//                             Text("Like"),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Icon(CupertinoIcons.captions_bubble),
//                             Text("Comment"),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Icon(CupertinoIcons.bookmark),
//                             Text("Save"),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Icon(CupertinoIcons.arrowshape_turn_up_right),
//                             Text("Share"),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),