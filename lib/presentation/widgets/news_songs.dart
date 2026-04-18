import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/is_dark_mode.dart';
import 'package:spotify/core/app_colors.dart';
import 'package:spotify/core/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/bloc/news_songs_state.dart';
import 'package:spotify/presentation/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NewsSongsCubit()..getNewsSongs(),
      child:
          BlocBuilder<
            NewsSongsCubit,
            NewsSongsState
          >(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return Align(
                  alignment: Alignment.center,
                  child:
                      CircularProgressIndicator(),
                );
              }
              if (state is NewsSongsLoaded) {
                return _songs(state.songs);
              }
              return Container();
            },
          ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SongPlayerPage(),
                ),
              );
            },
            child: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                              16,
                            ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "${AppURLs.firestorage}cover${index + 1}.jpg?${AppURLs.media}",
                          ),
                        ),
                      ),
                      child: Align(
                        alignment:
                            Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          transform:
                              Matrix4.translationValues(
                                10,
                                10,
                                0,
                              ),
                          decoration: BoxDecoration(
                            shape:
                                BoxShape.circle,
                            color:
                                context.isDarkMode
                                ? AppColors
                                      .darkGrey
                                : Color(
                                    0xffE6E6E6,
                                  ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color:
                                context.isDarkMode
                                ? AppColors
                                      .lightBackground
                                : AppColors
                                      .darkGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    songs[index].title,
                    style: TextStyle(
                      fontVariations: [
                        FontVariation.weight(800),
                      ],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    songs[index].artist,
                    style: TextStyle(
                      fontVariations: [
                        FontVariation.weight(400),
                      ],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 1);
      },
      itemCount: songs.length,
    );
  }
}
