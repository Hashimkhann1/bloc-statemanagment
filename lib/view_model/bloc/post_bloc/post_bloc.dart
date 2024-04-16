import 'package:bloc/bloc.dart';
import 'package:blockstatemanagment/model/posts_model.dart';
import 'package:blockstatemanagment/utils/enums.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_event.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_state.dart';
import 'package:blockstatemanagment/view_model/posts_view_model/posts_view_model.dart';

class PostBloc extends Bloc<PostsEevnt, PostsState> {
  List<PostsMdel> tempPostsList = [];
  PostsViewModel postsViewModel = PostsViewModel();

  PostBloc(this.postsViewModel) : super(PostsState()) {
    on<PostFetched>(_postFetched);
    on<SearchItem>(_searchItem);
  }

  void _postFetched(PostFetched event, Emitter<PostsState> emit) async {
    await postsViewModel.fetchPosts().then((value) {
      emit(state.copyWith(
        postsStatus: PostsStatus.success,
        postsList: value,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postsStatus: PostsStatus.failure, messgae: error.toString()));
    });
  }

  void _searchItem(SearchItem event, Emitter<PostsState> emit) {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempPostsList: [], searchMessage: ''));
    } else {
      // tempPostsList = state.postsList.where((element) => element.email.toString() == event.stSearch.toString()).toList();
      tempPostsList = state.postsList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();
      if (tempPostsList.isEmpty) {
        emit(state.copyWith(
            tempPostsList: tempPostsList, searchMessage: "No data foud!"));
      } else {
        emit(state.copyWith(
          tempPostsList: tempPostsList,
          searchMessage: ''
        ));
      }
    }
  }
}
