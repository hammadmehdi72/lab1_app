# Lab 1: Exploring Flutter's Widget Structure

**Name:** Hammad Mehdi
**Date:** 7 July 2026

## Submission

This repository contains the completed Flutter lab. The work was committed in stages:

- `066b7af` Starter: default counter app
- `7ae5e8c` Part 2: experimented with setState behavior
- `ea0c174` Part 3: extended widget tree with Row, Icon, and styled text
- `4e78303` Part 4: added independent decrement feature
- `164a7aa` Add simple comments for viva explanation
- `c369029` Add explanatory comments to lab widgets

## Part 1: Read Before You Run

### 1. How many `Text` widgets exist in the original file?

There are three `Text` widgets in the original starter file:

1. `Text(widget.title)` displays the app bar title.
2. `const Text('You have pushed the button this many times:')` displays the counter instruction.
3. `Text('$_counter', ...)` displays the current counter value.

The completed version adds a fourth `Text` widget for `Keep tapping!`.

### 2. What changes when `Colors.deepPurple` becomes `Colors.teal`?

The app's generated color theme changes from purple to teal. This can affect the app bar, floating action buttons, highlights, and other widgets that use the generated color scheme.

The counter logic, button actions, text content, layout, and `_counter` value do not change. Only the color theme changes.

### 3. What happens to `_counter` after four taps and a hot restart?

After four taps, `_counter` is `4`. After a hot restart, it returns to `0` because the state object is recreated and the field is initialized again:

```dart
int _counter = 0;
```

The value belongs to the widget's state. A hot restart starts the Dart application again, so the state is reset.

### 4. What does `widget` refer to?

The `widget` property inside `_MyHomePageState` refers to the associated `MyHomePage` `StatefulWidget` object. Therefore, `widget.title` reads the title passed into the widget here:

```dart
home: const MyHomePage(title: 'Flutter Demo Home Page'),
```

The `title` field is declared in `MyHomePage` as `final String title;`.

### Part 1 checkpoint

Hot restart resets `_counter` because `_counter` is state stored in `_MyHomePageState`. Restarting recreates that state and runs its initial value assignment again.

## Part 2: Deliberate Breakage

### 1. Mutable field in `StatelessWidget`

Adding a mutable instance field such as `int count = 0;` to `MyApp` produces an immutability error because `StatelessWidget` is immutable. Its instance fields must be `final`, and a `const MyApp()` also requires immutable data.

Changing data that should update the screen belongs in a `StatefulWidget` and its `State` object.

### 2. Removing `setState()`

When `_incrementCounter()` contains only `_counter++;`, the value changes in memory, and `print(_counter)` shows the new value in the debug console. However, the displayed number does not update because Flutter was not told to rebuild the widget tree.

### 3. Calling `setState()` without changing state

The app still works when the button calls `setState(() { print('hello'); });`. This shows that `setState()` schedules a rebuild after its callback runs; it does not automatically detect whether a field changed. The callback should normally contain the state mutation that justifies the rebuild.

### Part 2 checkpoint

The practical rule is: state changes should happen inside `setState()` so Flutter knows it must rebuild the affected widget subtree. Without `setState()`, a field can change while the screen continues displaying the old value.

## Part 3: Extend the Widget Tree

The widget tree was extended in three steps:

- Added the `Keep tapping!` text below the counter.
- Styled it with an 18-pixel italic gray `TextStyle`.
- Wrapped the counter and a star icon in a centered `Row`, with an 8-pixel `SizedBox` between them.

The resulting layout keeps the original instruction, places the counter beside the star, and displays the styled message below it.

## Part 4: Independent Build: Decrement Button

The app now has a second `FloatingActionButton` that decreases the counter by one. It uses its own method:

```dart
void _decrementCounter() {
	setState(() {
		_counter--;
	});
}
```

The increment button continues to use `_incrementCounter()`. Both buttons are placed in a `Row` so they remain visible and usable at the same time. No validation was added, so the counter is allowed to become negative.

## Final Verification

- `flutter test` passes.
- `lib/main.dart` has no analyzer errors.
- The plus button increments the counter.
- The minus button decrements the counter and allows negative values.
