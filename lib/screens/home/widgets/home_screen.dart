import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/screens/home/widgets/web_view_screen.dart';
import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../../bloc/news_states.dart';
import 'headlines_widget.dart';
import 'home_app_bar_widget.dart';


class HomeScreen extends StatefulWidget {
  final int userId;

  const HomeScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final format = DateFormat('MMMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    // Fetch headlines and categories together
    context.read<NewsBloc>()
      ..add(FetchNewsChannelHeadlines('bbc-news'))
      ..add(NewsCategories('general'));
  }

  Future<void> _handleRefresh() async {
    // Refresh data when pull-to-refresh is triggered
    context.read<NewsBloc>()
      ..add(FetchNewsChannelHeadlines('bbc-news'))
      ..add(NewsCategories('general'));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(59),
        child: HomeAppBarWidget(),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh, // Pull-to-refresh functionality
        child: ListView(
          children: [
            // Headlines Section
            SizedBox(
              height: height * 0.55,
              width: width,
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case Status.initial:
                      return const Center(
                        child: SpinKitCircle(size: 50, color: Colors.blue),
                      );
                    case Status.failure:
                      return Center(
                        child: Text(state.message ?? 'Error fetching data'),
                      );
                    case Status.success:
                      return ListView.builder(
                        itemCount: state.newsList?.articles?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final article = state.newsList?.articles?[index];
                          if (article == null) return const SizedBox.shrink();

                          DateTime dateTime = DateTime.parse(
                            article.publishedAt ?? DateTime.now().toString(),
                          );

                          return HeadlinesWidget(
                            dateAndTime: format.format(dateTime),
                            index: index,
                          );
                        },
                      );
                  }
                },
              ),
            ),

            // News Categories Section
            // News Categories Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  switch (state.categoriesStatus) {
                    case Status.initial:
                      return const Center(
                        child: SpinKitCircle(size: 50, color: Colors.blue),
                      );
                    case Status.failure:
                      return Center(
                        child: Text(state.categoriesMessage ?? 'Error loading categories'),
                      );
                    case Status.success:
                      return ListView.builder(
                        itemCount: state.newsCategoriesList?.articles?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final article = state.newsCategoriesList?.articles?[index];
                          if (article == null) return const SizedBox.shrink();

                          DateTime dateTime = DateTime.parse(
                            article.publishedAt ?? DateTime.now().toString(),
                          );

                          return GestureDetector(
                            onTap: () {
                              // Navigate to WebViewScreen with the article's URL
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebViewScreen(url: article.url ?? ''),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: article.urlToImage ?? '',
                                      fit: BoxFit.cover,
                                      height: height * 0.18,
                                      width: width * 0.3,
                                      placeholder: (context, url) => const Center(
                                        child: SpinKitCircle(size: 50, color: Colors.blue),
                                      ),
                                      errorWidget: (context, url, error) => const Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height * 0.18,
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article.title ?? '',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: isDarkMode
                                                  ? Colors.white70
                                                  : Colors.black87,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  article.source?.name ?? '',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    color: isDarkMode
                                                        ? Colors.white54
                                                        : Colors.black54,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                format.format(dateTime),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: isDarkMode
                                                      ? Colors.white60
                                                      : Colors.black54,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}




const spinKit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);

