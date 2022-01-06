part of 'post_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Post weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

class PostsDataError extends WeatherState {
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
