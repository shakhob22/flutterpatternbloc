
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpatternbloc/bloc/home_state.dart';
import 'package:flutterpatternbloc/service/http_service.dart';

import '../model/post_model.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, {});
    print(response);
    if (response != null) {
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "No data"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + post.id.toString(), {});
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }
}