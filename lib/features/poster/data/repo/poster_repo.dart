import 'dart:developer';

import 'package:supabase_test/features/poster/data/data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_test/features/poster/data/models/poster_model.dart';
class PosterRepo{
  final PosterDataSource homeDataSource;
  PosterRepo(this.homeDataSource);
  Future<void>addPoster(PosterModel posterModel)async{
    log('start home repo (add poster)');
    try{
      await homeDataSource.addPoster(posterModel);
    }catch(e){
      log(e.toString());
    }
    log('end home repo (add poster)');
  }
}