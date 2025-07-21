import 'package:adaptive_golden_test/adaptive_golden_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/core/inmo.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breeds/breeds_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/ui/breeds/breeds_page.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const MethodChannel appLinksChannel = MethodChannel(
    'com.llfbandit.app_links/events',
  );

  setUp(() async {
    LeakTesting.settings = LeakTesting.settings.withIgnoredAll();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(appLinksChannel, (
          MethodCall methodCall,
        ) async {
          // You can customize the response if needed
          return null;
        });

    SharedPreferences.setMockInitialValues({});
    await setupDiHelper(RoutePath.breeds);
  });

  testAdaptiveWidgets('BreedsPage Loaded State with breeds', (
    tester,
    variant,
  ) async {
    // Mock the BreedsCubit to emit loaded state with sample breeds

    final sampleBreeds = [
      Breed(id: 1, name: 'Golden Retriever'),
      Breed(id: 2, name: 'Labrador Retriever'),
      Breed(id: 3, name: 'German Shepherd'),
      Breed(id: 4, name: 'Bulldog'),
      Breed(id: 5, name: 'Beagle'),
    ];
    provideDummy<Result<List<Breed>>>(Right(sampleBreeds));

    await tester.pumpWidget(
      AdaptiveWrapper(
        device: variant,
        orientation: Orientation.portrait,
        child: const Inmo(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.expectGolden<BreedsPage>(
      suffix: 'loaded_state_with_breeds',
      version: 1,
      variant,
    );
  });

  testAdaptiveWidgets('BreedsPage Loaded State with empty list', (
    tester,
    variant,
  ) async {
    // Mock the BreedsCubit to emit loaded state with empty breeds list
    provideDummy<Result<List<Breed>>>(const Right([]));

    await tester.pumpWidget(
      AdaptiveWrapper(
        device: variant,
        orientation: Orientation.portrait,
        child: const Inmo(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.expectGolden<BreedsPage>(
      suffix: 'loaded_state_empty_list',
      version: 1,
      variant,
    );
  });

  testAdaptiveWidgets('BreedsPage Error State', (tester, variant) async {
    // Mock the BreedsCubit to emit error state
    final error = const ErrorDetail.unknown(
      'errorBreedsLoadFailed',
      'Failed to load breeds',
    );
    provideDummy<Result<List<Breed>>>(Left([error]));

    await tester.pumpWidget(
      AdaptiveWrapper(
        device: variant,
        orientation: Orientation.portrait,
        child: const Inmo(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.expectGolden<BreedsPage>(
      suffix: 'error_state',
      version: 1,
      variant,
    );
  });

  testAdaptiveWidgets('BreedsPage with many breeds (scrolling)', (
    tester,
    variant,
  ) async {
    // Mock the BreedsCubit to emit loaded state with many breeds
    final manyBreeds = List.generate(
      20,
      (index) => Breed(id: index + 1, name: 'Breed ${index + 1}'),
    );
    provideDummy<Result<List<Breed>>>(Right(manyBreeds));

    await tester.pumpWidget(
      AdaptiveWrapper(
        device: variant,
        orientation: Orientation.portrait,
        child: const Inmo(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.expectGolden<BreedsPage>(
      suffix: 'many_breeds_scrolling',
      version: 1,
      variant,
    );
  });
}

class MockBreedsCubit extends Mock implements BreedsCubit {}
