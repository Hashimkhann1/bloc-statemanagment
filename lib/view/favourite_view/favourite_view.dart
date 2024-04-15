import 'package:blockstatemanagment/model/favourite_items_model.dart';
import 'package:blockstatemanagment/view_model/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/favourite_bloc/favourite_event.dart';
import 'package:blockstatemanagment/view_model/bloc/favourite_bloc/favourite_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourite',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                return Visibility(
                  visible: state.tempFavouriteItemList.isNotEmpty ? true : false,
                  child: IconButton(
                    onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteItem());
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                );
  },
)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.loading:
                  return Center(child: CircularProgressIndicator());
                case ListStatus.faliure:
                  return Text('Something went wrong');
                case ListStatus.success:
                  return ListView.builder(
                      itemCount: state.favouriteItemList.length,
                      itemBuilder: (context, index) {
                        final item = state.favouriteItemList[index];

                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: state.tempFavouriteItemList.contains(state.favouriteItemList[index]) ? true : false,
                              onChanged: (val) {
                                final FavouriteItemsModel selectedItem = state.favouriteItemList[index];
                                if(val!){
                                  context.read<FavouriteBloc>().add(SelectedItem(item: selectedItem));
                                }else{
                                  context.read<FavouriteBloc>().add(UnSelectedItem(item: selectedItem));
                                }
                              },
                            ),
                            title: Text(item.value),
                            trailing: IconButton(
                              onPressed: () {
                                FavouriteItemsModel favouriteItemsModel =
                                    FavouriteItemsModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavourite: item.isFavourite ? false : true,
                                );

                                context.read<FavouriteBloc>().add(
                                    FavouriteItem(item: favouriteItemsModel));
                              },
                              icon: Icon(item.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_outline),
                            ),
                          ),
                        );
                      });
              }
            },
          ),
        ));
  }
}
