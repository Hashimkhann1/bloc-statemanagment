



import 'package:equatable/equatable.dart';

abstract class PostsEevnt extends Equatable{

  @override
  List get props => [];
}

class PostFetched extends PostsEevnt{}

class SearchItem extends PostsEevnt{
  final String stSearch;
  SearchItem(this.stSearch);
}