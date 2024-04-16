


import 'package:blockstatemanagment/model/posts_model.dart';
import 'package:blockstatemanagment/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostsState extends Equatable {

  final PostsStatus postsStatus;
  final List<PostsMdel> postsList;
  final List<PostsMdel> tempPostsList;
  final String message;
  final String searchMessage;

  PostsState({
    this.postsStatus = PostsStatus.loading,
    this.postsList = const <PostsMdel>[],
    this.message = '',
    this.tempPostsList = const <PostsMdel>[],
    this.searchMessage = '',
  });

  PostsState copyWith({PostsStatus? postsStatus , List<PostsMdel>? postsList , List<PostsMdel>? tempPostsList , String? messgae , String? searchMessage}) {
    return PostsState(
    postsList: postsList ?? this.postsList,
    postsStatus: postsStatus ?? this.postsStatus,
    message: message ?? this.message,
      tempPostsList: tempPostsList ?? this.tempPostsList,
      searchMessage: searchMessage ?? this.searchMessage
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [postsStatus , postsList , message , tempPostsList , searchMessage];

}