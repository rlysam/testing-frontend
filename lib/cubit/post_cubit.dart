import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/posts.dart';
import 'package:flutter_cubit_bloc_tutorial/data/post_posts_repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(int postId) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(postId);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(PostsDataError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
