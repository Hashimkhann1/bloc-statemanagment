
import 'package:bloc/bloc.dart';
import 'package:blockstatemanagment/model/favourite_items_model.dart';
import 'package:blockstatemanagment/view_model/bloc/favourite_bloc/favourite_event.dart';
import 'package:blockstatemanagment/view_model/bloc/favourite_bloc/favourite_state.dart';
import 'package:blockstatemanagment/view_model/create_fav_list/create_fav_list.dart';

class FavouriteBloc extends Bloc<FavouriteEvent , FavouriteState> {

  List<FavouriteItemsModel> favouriteList = [];
  List<FavouriteItemsModel> tempFavouriteList = [];
  CreateFavList createFavList;

  FavouriteBloc(this.createFavList) : super(FavouriteState()) {
    on<FetchFavouriteList>(_fetchFavouriteList);
    on<FavouriteItem>(_favouriteItem);
    on<FavouriteDeleteItem>(_favouriteDeleteItem);
    on<SelectedItem>(_selectedItem);
    on<UnSelectedItem>(_unSelectedItem);
    on<DeleteItem>(_deleteItem);

  }


  void _fetchFavouriteList(FetchFavouriteList event , Emitter<FavouriteState> emit) async {
    favouriteList = await createFavList.fetchIteme();
    emit(state.copyWith(favouriteItemList: List.from(favouriteList), listStatus: ListStatus.success));
  }

  void _favouriteItem(FavouriteItem event , Emitter<FavouriteState> emit) async {
    final index = favouriteList.indexWhere((element) => element.id == event.item.id);

    if(event.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }else{
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }
    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList) , tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _favouriteDeleteItem(FavouriteDeleteItem event , Emitter<FavouriteState> emit) async {
    print('called>>>>>');
    favouriteList.remove(event.favouriteItemsModel);
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }

  void _selectedItem(SelectedItem event , Emitter<FavouriteState> emit) async {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _unSelectedItem(UnSelectedItem event , Emitter<FavouriteState> emit) async {
    tempFavouriteList.remove(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event , Emitter<FavouriteState> emit) async {
    for(int i = 0; i < tempFavouriteList.length; i++){
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
        tempFavouriteItemList: List.from(tempFavouriteList)));
  }




}