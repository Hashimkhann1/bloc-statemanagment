


import 'package:blockstatemanagment/model/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable {

  FavouriteEvent();

  @override
  List<Object> get props => [];

}


class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {

  final FavouriteItemsModel item;
  FavouriteItem({required this.item});
}

class FavouriteDeleteItem extends FavouriteEvent {

  final FavouriteItemsModel favouriteItemsModel;
  FavouriteDeleteItem({required this.favouriteItemsModel});
}

class SelectedItem extends FavouriteEvent {

  final FavouriteItemsModel item;
  SelectedItem({required this.item});

}

class UnSelectedItem extends FavouriteEvent {

  final FavouriteItemsModel item;
  UnSelectedItem({required this.item});

}

class DeleteItem extends FavouriteEvent {}
