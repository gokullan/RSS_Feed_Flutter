import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RSSFeedService {

  static Widget thumbnail(String? url) {
    return CachedNetworkImage(
      imageUrl: url as String,
      placeholder: (context, url) => const Image(image: AssetImage('images/placeholder_image.jpg')),
      errorWidget: (context, url, error) => const Image(
        image: AssetImage('images/placeholder_image.jpg'),
      ),
    );
  }

  static Future<RssFeed> loadFeed(String feedUrl) async {
    try {
      final uri = Uri.parse(feedUrl);
      final client = Client();
      final response = await client.get(uri);
      return RssFeed.parse(response.body);
    }
    catch (e) {
      return Future.error("Error Loading Feed");
    }
  }

  static Future<void> openFeed(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

}
