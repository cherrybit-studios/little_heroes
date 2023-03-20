import 'package:checks/checks.dart';
import 'package:checks/context.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension CustomFinderChecks on Subject<Finder> {
  Subject<Iterable<Element>> get matches {
    return context.nest('matches', (subject) {
      final matches = subject.evaluate();

      checkThat(matches).isNotNull();

      return Extracted.value(matches);
    });
  }
}
