import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/app_colors.dart';

class DescriptionBottomSheet extends StatefulWidget {
  DescriptionBottomSheet({super.key, required this.news});

  News news;

  @override
  State<DescriptionBottomSheet> createState() => _DescriptionBottomSheetState();
}

class _DescriptionBottomSheetState extends State<DescriptionBottomSheet> {
  Uri? get url => null;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: width * 0.015,
        vertical: height * 0.01,
      ),
      height: height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: CachedNetworkImage(
              imageUrl: widget.news?.urlToImage ?? '',
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: AppColors.greyColor),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(widget.news.content! ?? '', style: AppStyles.medium14Black),
          SizedBox(height: height * 0.02),
          InkWell(
            //todo: goto full article url
            onTap: () {
              final Uri url = Uri.parse('${widget.news.url}');
              _launchInBrowserView(url);
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: height * 0.06,
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              child: Text("View Full Article", style: AppStyles.bold16White),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
