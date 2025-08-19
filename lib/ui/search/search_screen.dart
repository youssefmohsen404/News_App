import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

import '../home/category details/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<News> allNews = [];
  List<News> filteredNews = [];

  void _filterNews(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNews = allNews;
      });
    } else {
      setState(() {
        filteredNews = allNews
            .where(
              (news) =>
                  news.title?.toLowerCase().contains(query.toLowerCase()) ??
                  false,
            )
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.02,
              ),
              child: TextField(
                style: AppStyles.medium12Gray.copyWith(fontSize: 20),
                onChanged: _filterNews,

                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.whiteColor),
                  ),
                  hintText: 'search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
            ),
            FutureBuilder<NewsResponse?>(
              future: ApiManager.giveNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greyColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(
                        'something went wrong',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greyColor,
                        ),
                        onPressed: () {
                          ApiManager.giveNews();
                          setState(() {});
                        },
                        child: Text(
                          'try again',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.data?.status != 'ok') {
                  return Column(
                    children: [
                      Text(
                        snapshot.data!.message!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greyColor,
                        ),
                        onPressed: () {
                          ApiManager.giveNews();
                          setState(() {});
                        },
                        child: Text(
                          'try again',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  );
                }
                if (allNews.isEmpty) {
                  allNews = snapshot.data?.articles ?? [];
                  filteredNews = allNews;
                }
                var newsList = snapshot.data?.articles ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsItem(news: filteredNews[index]);
                    },

                    itemCount: filteredNews.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
