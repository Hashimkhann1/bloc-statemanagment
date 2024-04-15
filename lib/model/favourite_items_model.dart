


import 'package:equatable/equatable.dart';

class FavouriteItemsModel extends Equatable {

  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavouriteItemsModel({
    required this.id,
    required this.value,
    this.isDeleting =false,
    this.isFavourite = false
  });

  FavouriteItemsModel copyWith({String? id , String? value, bool? isDeleting , bool? isFavourite}) {
    return FavouriteItemsModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [id , value , isFavourite , isDeleting];

}