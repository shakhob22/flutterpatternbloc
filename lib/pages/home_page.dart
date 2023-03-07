
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterpatternbloc/bloc/home_cubit.dart';

import '../bloc/home_state.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';
import '../views/home_view.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<ListPostCubit>(context).apiPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("setState"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (context, state) {
          if (state is ListPostError) {
            return Center(
              child: Text(state.error!),
            );
          }
          if (state is ListPostLoaded) {
            var items = state.posts!;
            return viewOfPostList(items);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget viewOfPostList(List<Post> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemOfPost(items[index]);
      },
    );
  }

}
