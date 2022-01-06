import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/posts_data.dart';
import 'package:flutter_cubit_bloc_tutorial/data/post_posts_repository.dart';
import 'package:meta/meta.dart';

part 'posts_data_state.dart';

class PostsDataCubit extends Cubit<PostsDataSatte> {
  final WeatherRepository _bulkdataRepository;

  PostsDataCubit(this._bulkdataRepository) : super(PostsDataInitial());

//Enter a page number, and you'll receive 10 posts
  Future<void> get10Posts(int pageNumber) async {
    try {
      emit(PostsDataLoading());
      final bulkData = await _bulkdataRepository.fetchBulkPost(pageNumber);
      //   FIXME:  Baka dito yun may mali? if ever
      emit(PostsDataLoaded(bulkData));
    } on NetworkException {
      emit(PostDataError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
