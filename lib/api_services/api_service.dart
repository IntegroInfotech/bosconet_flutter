import 'dart:math';

import 'package:bosconet/models/news.dart';
import 'package:bosconet/models/news_images.dart';
import 'package:bosconet/models/newsletter.dart';
import 'package:bosconet/models/notifications.dart';
import 'package:bosconet/models/photos.dart';
import 'package:bosconet/models/photos_album.dart';
import 'package:bosconet/models/success_stories.dart';
import 'package:bosconet/models/videos.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://bosco-net.in';

  final String newsApi = '$baseUrl/bosconet_news.php';
  final String newsImagesApi = '$baseUrl/bosconet_newsimage.php';
  final String notificationsApi = '$baseUrl/bosconet_notification.php';
  final String newsLetterApi = '$baseUrl/bosconet_newsletter.php';
  final String successStoriesApi = '$baseUrl/bosconet_sstory.php';
  final String photosAlbumApi = '$baseUrl/bosconet_photos.php';
  final String photosApi = '$baseUrl/bosconet_photo1.php';
  final String videosApi = '$baseUrl/bosconet_videos.php';

  Future<List<BosconetNews>> fetchNews() async {
    try {
      http.Response response = await http.get(Uri.parse(newsApi));
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonData = News.fromJson(json).bosconetNews;
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<NewsImage>> fetchNewsImages(String newsId) async {
    try {
      http.Response response = await http.post(
        Uri.parse(newsImagesApi),
        body: {'news_id': newsId},
      );
      var jsonData = BosconetNewsImages.fromJson(response.body).newsImages;
      print(response.body);
      print('news_id is $newsId');
      print('newsImages jsonData is$jsonData');
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<BosconetNotification>> fetchNotifications() async {
    try {
      http.Response response = await http.get(Uri.parse(notificationsApi));
      if (response.statusCode == 200) {
        var jsonData =
            Notifications.fromJson(response.body).bosconetNotification;
        return jsonData;
      } else {
        return [];
      }
    } catch (exceptions) {
      print(exceptions);
    }
    return [];
  }

  Future<List<BosconetNewsletter>> fetchNewsLetter() async {
    try {
      http.Response response = await http.get(Uri.parse(newsLetterApi));
      if (response.statusCode == 200) {
        var jsonData = NewsLetter.fromJson(response.body).bosconetNewsletter;
        print(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<BosconetSuccessStories>> fetchSuccessStories() async {
    try {
      http.Response response = await http.get(Uri.parse(successStoriesApi));
      if (response.statusCode == 200) {
        var jsonData = SuccessStories.fromJson(response.body).successStory;
        print(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<BosconetPhotoAlbum>> fetchPhotoAlbums() async {
    try {
      http.Response response = await http.get(Uri.parse(photosAlbumApi));
      if (response.statusCode == 200) {
        var jsonData = PhotosAlbums.fromJson(response.body).bosconetPhotos;
        print(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<BosconetPhotos>> fetchPhotos(String pId) async {
    try {
      http.Response response = await http.post(
        Uri.parse(photosApi),
        body: {'p_id': pId},
      );
      var jsonData = Photos.fromJson(response.body).photoimages;
      print('jsondata is$jsonData');
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<BosconetVideo>> fetchVideos() async {
    try {
      http.Response response = await http.get(Uri.parse(videosApi));
      var jsonData = Videos.fromJson(response.body).bosconetVideos;
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
