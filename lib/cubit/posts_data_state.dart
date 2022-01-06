part of 'posts_data_cubit.dart';

@immutable
abstract class PostsDataSatte {
  const PostsDataSatte();
}

class PostsDataInitial extends PostsDataSatte {
  const PostsDataInitial();
}

class PostsDataLoading extends PostsDataSatte {
  const PostsDataLoading();
}

class PostsDataLoaded extends PostsDataSatte {
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

class PostDataError extends PostsDataSatte {
  final String message;
  const PostDataError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostDataError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

