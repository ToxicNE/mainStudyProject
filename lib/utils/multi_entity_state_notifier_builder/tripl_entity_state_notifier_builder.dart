import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Tripl Entity State Notifier Builder is for situation when u need to listen for 3 entities
///
/// if one of 3 entities changes, for [loading] of [error] state, whole widget will change
///
/// if one of 3 entities has [loading] of [error] state, whole widget will be [loading] or [error]
///
/// if one of entities accept new [content] whole widget will rebuild
class TripleEntityStateNotifierBuilder<F, S, T> extends StatefulWidget {
  const TripleEntityStateNotifierBuilder({
    super.key,
    required this.firstListenable,
    required this.secondListenable,
    required this.thirdListenable,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final ValueListenable<EntityState<F>> firstListenable;

  final ValueListenable<EntityState<S>> secondListenable;

  final ValueListenable<EntityState<T>> thirdListenable;

  final TriplDataWidgetBuilder<F, S, T> builder;

  final TriplLoadingBuilder<F, S, T>? loadingBuilder;

  final TriplErrorWidgetBuilder<F, S, T>? errorBuilder;

  @override
  State<TripleEntityStateNotifierBuilder<F, S, T>> createState() => _TripleEntityStateNotifierBuilderState<F, S, T>();
}

class _TripleEntityStateNotifierBuilderState<F, S, T> extends State<TripleEntityStateNotifierBuilder<F, S, T>> {
  late EntityState<F> _firstValue;
  late EntityState<S> _secondValue;
  late EntityState<T> _thirdValue;

  void _firstValueListenableChange() {
    setState(() {
      _firstValue = widget.firstListenable.value;
    });
  }

  void _secondValueListenableChange() {
    setState(() {
      _secondValue = widget.secondListenable.value;
    });
  }

  void _thirdValueListenableChange() {
    setState(() {
      _thirdValue = widget.thirdListenable.value;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstValue = widget.firstListenable.value;
    widget.firstListenable.addListener(_firstValueListenableChange);
    _secondValue = widget.secondListenable.value;
    widget.secondListenable.addListener(_secondValueListenableChange);
    _thirdValue = widget.thirdListenable.value;
    widget.thirdListenable.addListener(_thirdValueListenableChange);
  }

  @override
  void dispose() {
    widget.firstListenable.removeListener(_firstValueListenableChange);
    widget.secondListenable.removeListener(_secondValueListenableChange);
    widget.thirdListenable.removeListener(_thirdValueListenableChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TripleEntityStateNotifierBuilder<F, S, T> oldWidget) {
    if (oldWidget.firstListenable != widget.firstListenable) {
      oldWidget.firstListenable.removeListener(_firstValueListenableChange);
      _firstValue = widget.firstListenable.value;
    }
    if (oldWidget.secondListenable != widget.secondListenable) {
      oldWidget.secondListenable.removeListener(_secondValueListenableChange);
      _secondValue = widget.secondListenable.value;
    }
    if (oldWidget.thirdListenable != widget.thirdListenable) {
      oldWidget.thirdListenable.removeListener(_thirdValueListenableChange);
      _thirdValue = widget.thirdListenable.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if ((_firstValue.isErrorState || _secondValue.isErrorState || _thirdValue.isErrorState) &&
        widget.errorBuilder != null) {
      return widget.errorBuilder!(
        context,
        _firstValue.data,
        _secondValue.data,
        _thirdValue.data,
        _firstValue.errorOrNull,
        _secondValue.errorOrNull,
        _thirdValue.errorOrNull,
      );
    }
    if ((_firstValue.isLoadingState || _secondValue.isLoadingState || _thirdValue.isLoadingState) &&
        widget.loadingBuilder != null) {
      return widget.loadingBuilder!(
        context,
        _firstValue.data,
        _secondValue.data,
        _thirdValue.data,
      );
    }
    return widget.builder(
      context,
      _firstValue.data,
      _secondValue.data,
      _thirdValue.data,
    );
  }
}

typedef TriplDataWidgetBuilder<F, S, T> = Widget Function(
  BuildContext context,
  F? firstData,
  S? secondData,
  T? thirdData,
);

typedef TriplLoadingBuilder<F, S, T> = Widget Function(
  BuildContext context,
  F? firstData,
  S? secondData,
  T? thirdData,
);

typedef TriplErrorWidgetBuilder<F, S, T> = Widget Function(
  BuildContext context,
  F? firstData,
  S? secondData,
  T? thirdData,
  Exception? firstE,
  Exception? secondE,
  Exception? thirdE,
);
