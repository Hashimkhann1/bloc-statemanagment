
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blockstatemanagment/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsViewModel {

  ////// feteching all post method
  Future<List<PostsMdel>> fetchPosts() async {
    try{
      final String baseUrl = 'https://jsonplaceholder.typicode.com/comments';

      final responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if(responce.statusCode == 200){
         final body = json.decode(responce.body) as List;
         return body.map((e) {
           return PostsMdel(
             postId: e['postId'] as int,
             email: e['email'] as String,
             body: e['body'] as String,
             name: e['name'] as String,
             id: e['id'] as int
           );
         }).toList();
      }
    } on SocketException{
      throw Exception('Error while fetching posts data >>>>');
    }on TimeoutException{
      throw Exception('Time out error while fetching posts data >>>>');
    }
    throw Exception('Error while fetching posts data >>>>');
  }

}