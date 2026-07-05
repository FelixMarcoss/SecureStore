import 'package:flutter_test/flutter_test.dart';
import 'package:secure_store/main.dart';

void main() {
  testWidgets('App main screen builds and displays header', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SecureStoreApp());

    // Verify that the title 'Entry Guard' is found on screen.
    expect(find.text('Entry Guard'), findsOneWidget);
  });
}
