import 'package:minelibs2/domain/entities/onboarding_step.dart';

abstract class OnboardingRepository {
  List<OnboardingStep> getOnboardingSteps();
  Future<void> setOnboardingComplete();
  Future<bool> isOnboardingComplete();
}