import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/song/get_playlist.dart';
import 'package:spotify/service_locator.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    var returnedSongs =
        await sl<GetPlaylistUseCase>().call();

    returnedSongs.fold(
      (l) => emit(PlaylistLoadFailure()),
      (data) => emit(PlaylistLoaded(songs: data)),
    );
  }
}
