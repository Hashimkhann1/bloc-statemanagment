


import 'package:blockstatemanagment/model/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus{loading , success , faliure}

class FavouriteState extends Equatable {

  final List<FavouriteItemsModel> favouriteItemList;
  final List<FavouriteItemsModel> tempFavouriteItemList;
  final ListStatus listStatus;

  FavouriteState({
    this.favouriteItemList = const [],
    this.tempFavouriteItemList = const [],
    this.listStatus = ListStatus.loading
  });

  FavouriteState copyWith({List<FavouriteItemsModel>? favouriteItemList , List<FavouriteItemsModel>? tempFavouriteItemList , ListStatus? listStatus}){
    return FavouriteState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList,
      listStatus: listStatus ?? this.listStatus
    );
}




  @override
  // TODO: implement props
  List<Object?> get props => [favouriteItemList , listStatus , tempFavouriteItemList];

}