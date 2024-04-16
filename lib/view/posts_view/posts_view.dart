import 'package:blockstatemanagment/utils/enums.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_event.dart';
import 'package:blockstatemanagment/view_model/bloc/post_bloc/post_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostsState>(
        builder: (context, state) {
          switch (state.postsStatus) {
            case PostsStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostsStatus.failure:
              return Text('Someth=hing went wrong');
            case PostsStatus.success:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search ith email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        )
                      ),
                      onChanged: (filterKey){
                        context.read<PostBloc>().add(SearchItem(filterKey));
                        print(filterKey);
                      },
                    ),
                    Expanded(
                      child: state.searchMessage.isNotEmpty ? Center(child: Text(state.searchMessage,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)) : ListView.builder(
                        itemCount: state.tempPostsList.isEmpty ? state.postsList.length : state.tempPostsList.length,
                          itemBuilder: (context , index) {
                            if(state.tempPostsList.isNotEmpty){
                              final item = state.tempPostsList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    item.email.toString(),
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    item.body.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Text(item.id.toString()),
                                ),
                              );
                            }else{
                              final item = state.postsList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    item.email.toString(),
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    item.body.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Text(item.id.toString()),
                                ),
                              );
                            }
                      }),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
