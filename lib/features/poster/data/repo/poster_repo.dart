import 'dart:developer';

import 'package:supabase_test/features/poster/data/data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_test/features/poster/data/models/poster_model.dart';

class PosterRepo {
  final PosterDataSource posterDataSource;

  PosterRepo(this.posterDataSource);

  Future<void> addPoster(PosterModel posterModel) async {
    log('start home repo (add poster)');
    try {
      await posterDataSource.addPoster(posterModel);
    } catch (e) {
      log(e.toString());
    }
    log('end home repo (add poster)');
  }

  Future<List<PosterModel>> getPosters() async {
    log('start home repo (get posters)');
   final posters = await posterDataSource.getPosters();
    log('end home repo (get posters)');
   return posters;
  }
}
