import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../../bloc/news_states.dart';
import '../../../model/categories_new_model.dart';


class NewsDetailScreen extends StatefulWidget {
  final String newsImage;
  final String newsTitle;
  final String newsDate;
  final String newsAuthor;
  final String newsDesc;
  final String newsContent;
  final String newsSourceName; // Assuming it's a name
  // final String newsSourceId; // If you have an ID

  NewsDetailScreen(this.newsImage, this.newsTitle, this.newsDate,
      this.newsAuthor, this.newsDesc, this.newsContent, this.newsSourceName, );

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final format = DateFormat('MMMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    double Kwidth = MediaQuery.of(context).size.width;
    double Kheight = MediaQuery.of(context).size.height;
    DateTime dateTime = DateTime.parse(widget.newsDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[600],
          ),
        ),
        actions: [
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              // Check if the article is a favorite
              bool isFavorite = state.favoritesList.any((article) => article.title == widget.newsTitle);

              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  Source source = Source(
                    // id: widget.newsSourceId, // Set the ID if applicable
                    name: widget.newsSourceName, // Set the name
                  );

                  Articles article = Articles(
                    title: widget.newsTitle,
                    urlToImage: widget.newsImage,
                    source: source, // Use the Source instance here
                  );

                  if (isFavorite) {
                    context.read<NewsBloc>().add(RemoveFromFavorites(article));
                  } else {
                    context.read<NewsBloc>().add(AddToFavorites(article));
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: Kheight * 0.45,
            width: Kwidth,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: CachedNetworkImage(
                imageUrl: widget.newsImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Kheight * 0.4),
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            height: Kheight * 0.6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            child: ListView(
              children: [
                Text(widget.newsTitle,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: Kheight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.newsSourceName,
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      format.format(dateTime),
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: Kheight * 0.03),
                Text(widget.newsDesc,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
