import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'rss.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA RSS Feed',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorSchemeSeed: Colors.red,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "RSS Feed - NASA",
          ),
          centerTitle: true,
        ),
        body: RSSHome(
            feedUrl: "https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss"),
        ),
      );
  }
}

class RSSHome extends StatelessWidget {
  final String feedUrl;
  final Future<RssFeed> rssFuture;

  RSSHome({Key? key, required this.feedUrl}) :
      rssFuture = RSSFeedService.loadFeed(feedUrl), super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rssFuture,
      builder: (BuildContext context, AsyncSnapshot<RssFeed> snapshot) {
        if (snapshot.hasData) {
          RssFeed feed = snapshot.data as RssFeed;
          return ListView.builder(
            itemCount: feed.items?.length,
            itemBuilder: (BuildContext context, int index) {
              final item = feed.items?[index];
              return ListTile(
                leading: RSSFeedService.thumbnail(item?.enclosure?.url),
                title: Text(item?.title as String),
                subtitle: Text(item?.description as String),
                onTap: () => RSSFeedService.openFeed(item?.link as String),
              );
            },
          );
        }
        return const Center(
          child: Text(
            "Loading Feed ...",
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
        );
      }
    );
  }
}
