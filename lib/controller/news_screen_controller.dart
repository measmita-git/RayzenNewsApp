import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../component/news_item.dart';

class NewsScreenController extends GetxController {
  var isLoading = true.obs;
  var newsItems = <NewsItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  void loadNews() async {
    // Simulate a delay for fetching data
    await Future.delayed(Duration(seconds: 2));

    // Assign the news items
    newsItems.value = [
      NewsItem(
        headline: "Deputy General Secretary Pradip Yadav recommended for minister for health and population...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/third-party/thumb-1715594086.jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "Special Court fines Paudel Rs230 million and orders to recover misappropriated amount from him...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/third-party/sunil-1715088453.jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "In order to promote the friendship and further facilitate the personnel exchange between China and Nepal...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/third-party/thumb-1714296916.jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "Nepal on Saturday hosted the first international LGBTIQ tourism conference...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/third-party/thumb-1714296916.jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "Chaos ensued on Thursday evening when internet services across the country were abruptly interrupted for several hours...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/money/Untitled-1%20(1).jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "Nepal has been waiving visa fees for Chinese nationals since 2016 and had been looking for reciprocal treatment...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/money/Untitled1-1713147555.jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "Experts say traditional parties remain relevant and identity politics continues to thrive...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/third-party/4375415009854531096070575583147412016394281n-1714526830.jpg&w=900&height=601",
      ),
      NewsItem(
        headline: "While international adoptions have been banned over child trafficking and abuse concerns, domestic adoptions are also not easy...",
        imageUrl: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2024/news/thumb14-1714527484.jpg&w=900&height=601",
      ),
    ];

    isLoading.value = false;
  }
}