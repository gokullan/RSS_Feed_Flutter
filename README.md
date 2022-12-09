# RSS_Feed

A Flutter application that retrieves and displays the NASA [Image of the Day](https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss) RSS Feed. 


Add `android:usesClearTextTraffic="true"` under the `application` tag of app/src/main/AndroidManifest.xml`to allow opening of the feed links from the app.

## External Dependencies
- [webfeed](https://pub.dev/packages/webfeed)
- [http](https://pub.dev/packages/http)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [url_launcher](https://pub.dev/packages/url_launcher)

## Quick Revision (If you're looking to do this in an exam)
- Convert the url (string) to a Uri object using `Uri.parse(urlString)`
- Loading the feed
    - Make a http-get request using the Uri object - `Client().get(UriObj)` (return-type: `Future<Response>`)
    - Parse the response using `RssFeed.parse(response.body)` 
- Displaying the feed
    - Display the feed using `FutureBuilder` and `ListView`
    - Use the `CachedNetworkImage` widget for image caching
- Opening the feed
    - Check if the link can be launched using the `canLauch(uriObj)` function in the url_launcher package
    - If yes, lauch the url using the `launchUrl(uriObj)` function 

## References

- [NASA RSS Feeds](https://www.nasa.gov/content/nasa-rss-feeds)
- [Parsing RSS Feeds in Flutter](www.coderzheaven.com/2019/12/08/parsing-rss-feeds-in-flutter/)

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
