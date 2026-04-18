import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/is_dark_mode.dart';
import 'package:spotify/core/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/bloc/playlist_cubit.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PlaylistCubit()..getPlaylist(),
      child:
          BlocBuilder<
            PlaylistCubit,
            PlaylistState
          >(
            builder: (context, state) {
              if (state is PlaylistLoading) {
                return Align(
                  alignment: Alignment.center,
                  child:
                      CircularProgressIndicator(),
                );
              }
              if (state is PlaylistLoaded) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          Text(
                            "Playlist",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "See more",
                            style: TextStyle(
                              fontVariations: [
                                FontVariation.weight(
                                  400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _songs(state.songs),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.isDarkMode
                        ? AppColors.darkGrey
                        : AppColors.grey,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: context.isDarkMode
                        ? AppColors.darkBackground
                        : Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(songs[index].title),
                    Text(
                      songs[index].artist,
                      style: TextStyle(
                        fontVariations: [
                          FontVariation.weight(
                            400,
                          ),
                        ],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  (songs[index].duration)
                      .toString(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: context.isDarkMode
                        ? AppColors
                              .lightBackground
                        : AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: songs.length,
    );
  }
}
