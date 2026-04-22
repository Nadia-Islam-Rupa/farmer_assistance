import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final SupabaseClient _supabase;

  HistoryCubit(this._supabase) : super(HistoryLoading());

  Future<void> fetchAll() async {
    emit(HistoryLoading());
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        emit(HistoryError('User not authenticated.'));
        return;
      }

      final results = await Future.wait([
        _supabase
            .from('fertilizer_tips')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .limit(50),
        _supabase
            .from('smart_irrigation')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .limit(50),
        _supabase
            .from('yield_estimations')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .limit(50),
        _supabase
            .from('crop_recommendations')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .limit(50),
        _supabase
            .from('price_predictions')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .limit(50),
        _supabase
            .from('crop_disease_predictions')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .limit(50),
      ]);

      emit(HistoryLoaded(
        fertilizerTips: List<Map<String, dynamic>>.from(results[0]),
        smartIrrigation: List<Map<String, dynamic>>.from(results[1]),
        yieldEstimations: List<Map<String, dynamic>>.from(results[2]),
        cropRecommendations: List<Map<String, dynamic>>.from(results[3]),
        pricePredictions: List<Map<String, dynamic>>.from(results[4]),
        cropDiseaseResults: List<Map<String, dynamic>>.from(results[5]),
      ));
    } catch (e) {
      emit(HistoryError('Failed to load history: ${e.toString()}'));
    }
  }
}
