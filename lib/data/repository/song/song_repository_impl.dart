import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl
    implements SongRepository {
  @override
  Future<Either<dynamic, dynamic>>
  getNewsSongs() async {
    return await sl<SongFirebaseService>()
        .getNewsSongs();
  }

  @override
  Future<Either<dynamic, dynamic>>
  getPlaylist() async {
    return await sl<SongFirebaseService>()
        .getPlaylist();
  }
}
