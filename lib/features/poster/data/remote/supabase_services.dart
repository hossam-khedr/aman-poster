import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/features/poster/data/data_source.dart';
import 'package:supabase_test/features/poster/data/models/poster_model.dart';

class PosterSupaBaseServices implements PosterDataSource{
  final dataBase = Supabase.instance.client;
  @override
  Future addPoster(PosterModel posterModel)async {
log('start add poster SupabaseServices');
await dataBase.from('posters').insert(posterModel.toJson());
log('end add poster SupabaseServices');
  }

  @override
  Future<List<PosterModel>> getPosters()async {
    log('start get posters SupabaseServices');
    List<PosterModel> posters = [];
    var response = await dataBase.from('posters').select('*') ;
    print(response);
     posters = response.map((poster)=>PosterModel.fromJson(poster)).toList();
    log('end get posters SupabaseServices');
     return posters;
  }

}