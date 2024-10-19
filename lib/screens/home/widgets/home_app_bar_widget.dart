


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/home/widgets/user_selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import 'cateogires_screen.dart';
import 'favorite_news_screen.dart';



enum FilterList { bbcNews, aryNews , independent , reuters, cnn, alJazeera}
FilterList? selectedMenu ;

class HomeAppBarWidget extends StatelessWidget {
   HomeAppBarWidget({Key? key}) : super(key: key);

  String name = 'bbc-news' ;

   // Function to handle logout
   void _logout(BuildContext context) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.remove('userId');  // Remove the stored userId

     // Navigate to the UserSelectionScreen after logout
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const UserSelectionScreen()),
     );
   }

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
        },
        icon: Icon(Icons.category ,
          size: 30,

        ),
      ),
      title: Text('News' , style: GoogleFonts.poppins(fontSize: 24 , fontWeight: FontWeight.w700),),
      actions: [
        PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon: Icon(Icons.more_vert , color: Colors.black,),
            onSelected: (FilterList item){

              if(FilterList.bbcNews.name == item.name){
                name = 'bbc-news' ;
              }
              if(FilterList.aryNews.name ==item.name){
                name  = 'ary-news';
              }

              if(FilterList.alJazeera.name ==item.name){
                name  = 'al-jazeera-english';
              }


              context.read<NewsBloc>()..add(FetchNewsChannelHeadlines(name));


            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>> [
              PopupMenuItem<FilterList>(
                value: FilterList.bbcNews ,
                child: Text('BBC News'),
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.aryNews ,
                child: Text('Ary News'),
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.alJazeera ,
                child: Text('Al-Jazeera News'),
              ),
            ]
        ),
        IconButton(
          icon: Icon(Icons.bookmark, color: Colors.blueAccent),
          onPressed: () {
            // Navigate to Favorite News Screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoriteNewsScreen()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Call the logout function when logout button is pressed
            _logout(context);
          },
        ),

      ],

    );
  }
}
