

import 'package:bloc/bloc.dart';
import 'package:blockstatemanagment/utils/enums.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_event.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_state.dart';
import 'package:blockstatemanagment/view_model/posts_view_model/posts_view_model.dart';

class PostBloc extends Bloc<PostsEevnt , PostsState> {

   PostsViewModel postsViewModel = PostsViewModel();

  PostBloc(this.postsViewModel) : super(PostsState()){
    on<PostFetched>(_postFetched);
  }

  void _postFetched(PostFetched event , Emitter<PostsState> emit) {=
    postsViewModel.fetchPosts().then((value){

  }).onError((error, stackTrace) {
    emit(state.copyWith(postsStatus: PostsStatus.failure , messgae: error.toString()));
  });
  }

}