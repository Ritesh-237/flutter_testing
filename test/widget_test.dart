// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dummy/todo_list.dart';
import 'package:dummy/views/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/* 
* The WidgetTester 
It allows building and interacting with widgets in a test environment.
* testWidgets() 
This function automatically creates a new WidgetTester for each test case.
* Finder
Finder classes allow searching for widgets in the test environment.
*/

void main() {
  testWidgets('My Widget Text Testing', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MyWidget(
      title: 'Title',
      message: 'Hello World',
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    // Schedules a frame and triggers a rebuild of the widget
    // await tester.pump(const Duration(seconds: 1));

    // * Note: To kick off the animation, you need to call pump() once (with no duration specified) to start the ticker. Without it, the animation does not start.
    //Repeatedly calls pump() with the given duration until there are no longer any frames scheduled. This, essentially, waits for all animations to complete.
    // tester.pumpAndSettle();

    // for the finding the text widget by the text
    final titleFinder = find.text('Title');
    // it will match if it got a single widget
    expect(titleFinder, findsOneWidget);
    /*


     * Matcher classes with an example
     1) findsOneWidget
     2) findsNothing - Verifies that no widgets are found.
     3) findsWidgets - Verifies that one or more widgets are found.
     4) findsNWidgets(2) - 
     5) matchesGoldenFile - Verifies that a widget’s rendering matches a particular bitmap image (“golden file” testing).
    */

    //* Find a widget by a Key
    const key = Key('key');
    expect(find.byKey(key), findsOneWidget);

    //* Find a specific widget instance
    testWidgets('finds a specific instance', (tester) async {
      const childWidget = Padding(padding: EdgeInsets.zero);
      // Provide the childWidget to the Container.
      await tester.pumpWidget(Container(child: childWidget));
      // Search for the childWidget in the tree and verify it exists.
      expect(find.byWidget(childWidget), findsOneWidget);
    });

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );
  });

  testWidgets('Simulate User Interaction', (tester) async {
    await tester.pumpWidget(const TodoList());

    // * Enter text in the text field
    await tester.enterText(find.byType(TextField), 'Hi');

    expect(find.text('Hi'), findsOneWidget);

    // * Ensure tapping a button adds the todo

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // * Ensure swipe-to-dismiss removes the todo

    await tester.drag(find.byType(Dismissible), const Offset(500, 0));
    await tester.pumpAndSettle();
  });

  /* SharedPreferences
    final Map<String, Object> values = <String, Object>{'counter': 1};
    SharedPreferences.setMockInitialValues(values);

    By calling ensureInitialized(), you ensure that all the services required by your application are properly 
    initialized before any further code execution takes place.
  */
}
