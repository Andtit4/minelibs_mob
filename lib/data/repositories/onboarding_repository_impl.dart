import 'package:minelibs2/domain/entities/onboarding_step.dart';
import 'package:minelibs2/domain/repositories/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences _prefs;
  static const String ONBOARDING_KEY = 'onboarding_complete';

  OnboardingRepositoryImpl(this._prefs);

  @override
  List<OnboardingStep> getOnboardingSteps() {
    return [
      OnboardingStep(
        title: 'Support accross',
        subtitle: 'Ipsum dolor emet si vis',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      OnboardingStep(
        title: 'Support accross',
        subtitle: 'Ipsum dolor emet si vis',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      OnboardingStep(
        title: 'Support accross',
        subtitle: 'Ipsum dolor emet si vis',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
    ];
  }

  @override
  Future<void> setOnboardingComplete() async {
    await _prefs.setBool(ONBOARDING_KEY, true);
  }

  @override
  Future<bool> isOnboardingComplete() async {
    return _prefs.getBool(ONBOARDING_KEY) ?? false;
  }
}