import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../../bloc/news_states.dart';


class FavoriteNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite News', style: GoogleFonts.poppins()),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state!.favoritesList.isEmpty) {
            return Center(
              child: Text('No favorite articles found.',
                  style: GoogleFonts.poppins(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: state.favoritesList.length,
            itemBuilder: (context, index) {
              final article = state.favoritesList[index];
              return ListTile(
                leading: Image.network(
                  article.urlToImage ?? '',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 60,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
                ),
                title: Text(
                  article.title ?? 'No Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  article.source?.name ?? 'Unknown Source',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    // Remove article from favorites
                    context.read<NewsBloc>().add(RemoveFromFavorites(article));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
