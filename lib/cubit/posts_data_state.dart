part of 'posts_data_cubit.dart';

@immutable
abstract class PostsDataState {
  const PostsDataState();
}

class PostsDataInitial extends PostsDataState {
  const PostsDataInitial();
}

class PostsDataLoading extends PostsDataState {
  const PostsDataLoading();
}

class PostsDataLoaded extends PostsDataState {
  final PostsData postsData;
  const PostsDataLoaded(this.postsData);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostsDataLoaded && o.postsData == postsData;
  }

  @override
  int get hashCode => postsData.hashCode;
}

class PostsDataError extends PostsDataState {
  final String message;
  const PostsDataError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostsDataError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

