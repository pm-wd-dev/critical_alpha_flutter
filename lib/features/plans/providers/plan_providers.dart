import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/plan_model.dart';

// Provider to hold the current plan being edited/assessed
final currentPlanProvider = StateProvider<PlanModel?>((ref) => null);