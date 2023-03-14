// // ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/articles/bloc/articles_bloc.dart';
// import 'package:news_app/articles/model/articles_model.dart';
// import 'package:news_app/common/bloc/navigation/bloc/navigation_bloc.dart';


// class ChoiceChips extends StatefulWidget {
//   final List<Articles> originalArticles;
//   final List<Articles> articlesFilter;

//   const ChoiceChips({
//     required this.originalArticles,
//     required this.articlesFilter,
//   });

//   @override
//   State<ChoiceChips> createState() => _ChoiceChipsState(
//         articlesFilter: articlesFilter,
//         originalArticles: originalArticles,
//       );
// }

// class _ChoiceChipsState extends State<ChoiceChips> {
//   final List<Articles> originalArticles;
//    List<Articles> articlesFilter;

//   _ChoiceChipsState({
//     required this.originalArticles,
//     required this.articlesFilter,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // return BlocBuilder<NavigationBloc, NavigationState>(
//     //   builder: (context, state) {
//         List<Widget> _returnList {
//         List<Widget> chips = [];
//         int? _selectedIndex;

//         DateTime now = DateTime.now();
//         var nowToday = DateTime(now.year, now.month, now.day);
//         var now_10d = now.subtract(const Duration(days: 10));
//         List<String> choiceChipsNames =
//             BlocProvider.of<ArticlesBloc>(context).choiceChipsNames;

//         for (int i = 0; i < choiceChipsNames.length; i++) {
//           Widget item = Padding(
//             padding: const EdgeInsets.only(left: 10, right: 5),
//             child: ChoiceChip(
//               label: Text(choiceChipsNames[i]),
//               labelStyle:
//                   TextStyle(color: Theme.of(context).colorScheme.secondary),
//               backgroundColor: Theme.of(context).colorScheme.primary,
//               selected: _selectedIndex == i,
//               selectedColor: Colors.black,
//               side: BorderSide(color: Theme.of(context).colorScheme.secondary),
//               onSelected: (bool value) {

//                 setState(() {
//                   _selectedIndex = i;
//                    // Vietoj indeksu galiu pasidaryt state
//                   //  1 state
//                   if (_selectedIndex == 0) {
//                     articlesFilter = originalArticles.where((article) {
//                       DateTime publishedAt = article.publishedAt;
//                       DateTime newPublishedAt = DateTime(
//                         publishedAt.year,
//                         publishedAt.month,
//                         publishedAt.day,
//                       );

//                       return newPublishedAt.isAtSameMomentAs(nowToday);
//                     }).toList();
//                   }
//                   // 2 state
//                   if (_selectedIndex == 1) {
//                     articlesFilter = originalArticles.where((article) {
//                       return now_10d.isBefore(article.publishedAt);
//                     }).toList();
//                   }
//                   //3 state
//                   if (_selectedIndex == 2) {
//                     articlesFilter = originalArticles;
//                   }
//                 });
                          
          

//               },
//             ),
//           );
// chips.add(item);
//         }
//           return chips;
//          }

//       }
      
//     // );

     
//   }
// }
