// ADD THIS LINE to fix 'blocTest' is not defined
import 'package:bloc_booking_app/bloc/bloc/booking_bloc.dart';
import 'package:bloc_booking_app/domain/models/package.dart';
import 'package:bloc_booking_app/domain/repos/tourism_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'booking_bloc_test.mocks.dart';

// Annotation that tells build_runner what to mock
@GenerateMocks([TourismRepository])
void main() {
  // Declare variables to hold the mock and the BLoC instance
  late MockTourismRepository mockTourismRepository;
  late BookingBloc bookingBloc;

  // Create a sample package to use across tests
  const mockPackage = Package(
      id: 'p1',
      name: 'Test Package',
      description: 'A description for the test package.',
      basePrice: 100.0,
      imageUrl: 'test_url');

  // This function runs before each test
  setUp(() {
    mockTourismRepository = MockTourismRepository();
    bookingBloc = BookingBloc(mockTourismRepository);
  });

  // This function runs after each test to clean up
  tearDown(() {
    bookingBloc.close();
  });

  // Test case 1: Check the initial state
  test('the initial state of the BLoC is BookingInitial', () {
    expect(bookingBloc.state, isA<BookingInitial>());
  });

  // Test case 2: Test successful data fetching
  blocTest<BookingBloc, BookingState>(
    'emits [BookingLoading, BookingLoaded] when fetching packages succeeds',
    build: () {
      // Control what the mock repository returns
      when(mockTourismRepository.getPackages())
          .thenAnswer((_) async => [mockPackage]);
      return bookingBloc;
    },
    act: (bloc) => bloc.add(FetchPackages()),
    expect: () => [
      isA<BookingLoading>(),
      isA<BookingLoaded>(),
    ],
  );

  // Test case 3: Test failed data fetching
  blocTest<BookingBloc, BookingState>(
    'emits [BookingLoading, BookingFailure] when fetching packages fails',
    build: () {
      // Control the mock to throw an error
      when(mockTourismRepository.getPackages())
          .thenThrow(Exception('Failed to fetch'));
      return bookingBloc;
    },
    act: (bloc) => bloc.add(FetchPackages()),
    expect: () => [
      isA<BookingLoading>(),
      isA<BookingFailure>(),
    ],
  );

  // Test case 4: Test successful booking confirmation
  blocTest<BookingBloc, BookingState>(
    'emits [BookingLoading, BookingSuccess] when booking confirmation is successful',
    seed: () => const BookingLoaded(
        packages: [], selectedPackage: mockPackage, numberOfTravelers: 2),
    build: () {
      when(mockTourismRepository.submitBooking(any, any))
          .thenAnswer((_) async => true);
      return bookingBloc;
    },
    act: (bloc) => bloc.add(ConfirmBooking()),
    expect: () => [
      isA<BookingLoading>(),
      isA<BookingSuccess>(),
    ],
  );
}
