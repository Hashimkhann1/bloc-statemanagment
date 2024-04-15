


import 'package:blockstatemanagment/model/favourite_items_model.dart';

class CreateFavList {

  Future<List<FavouriteItemsModel>> fetchIteme() async {

    await Future.delayed(Duration(seconds: 2));
    return List.of(_generateList(10));

  }

  List<FavouriteItemsModel> _generateList(int length) {
    return List.generate(length, (index) => FavouriteItemsModel(id: index.toString(), value: 'Item $index'));
  }

}