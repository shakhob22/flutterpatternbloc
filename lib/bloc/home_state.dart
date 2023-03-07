

import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

abstract class ListPostState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  List<Post>? posts;
  bool? isDelete;

  ListPostLoaded({this.posts, this.isDelete});
}

class ListPostError extends ListPostState {
  String? error;

  ListPostError({this.error});
}
