import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Double Entity State Notifier Builder for situations when need to listen for 2 entities
///
/// if one of two entities changes, for [loading] of [error] state, whole widget will change
///
/// if one on entities has [loading] of [error] state, whole widget will be [loading] or [error]
class DoubleEntityStateNotifierBuilder<F, S> extends StatefulWidget {
  /// First listenable
  final ValueListenable<EntityState<F>> firstListenable;

  /// Second listenable
  final ValueListenable<EntityState<S>> secondListenable;

  /// Builder that used for the loading state.
  ///
  /// See also:
  /// * [EntityState]
  /// * [LoadingEntityState]
  final DoubleLoadingBuilder<F, S>? multiLoadingBuilder;

  /// Builder that used for the error state.
  ///
  /// See also:
  /// * [EntityState]
  /// * [LoadingEntityState]
  final DoubleErrorWidgetBuilder<F, S>? errorBuilder;

  final DoubleDataWidgetBuilder<F, S> builder;

  const DoubleEntityStateNotifierBuilder({
    super.key,
    required this.firstListenable,
    required this.secondListenable,
    required this.builder,
    this.multiLoadingBuilder,
    this.errorBuilder,
  });

  @override
  State<DoubleEntityStateNotifierBuilder<F, S>> createState() => DoubleEntityStateNotifierBuilderState<F, S>();
}

class DoubleEntityStateNotifierBuilderState<F, S> extends State<DoubleEntityStateNotifierBuilder<F, S>> {
  late EntityState<F> _firstValue;
  late EntityState<S> _secondValue;

  @override
  void initState() {
    super.initState();

    _firstValue = widget.firstListenable.value;
    widget.firstListenable.addListener(_firstValueListenableChange);

    _secondValue = widget.secondListenable.value;
    widget.secondListenable.addListener(_secondValueListenableChange);
  }

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

  @override
  void didUpdateWidget(covariant DoubleEntityStateNotifierBuilder<F, S> oldWidget) {
    if (oldWidget.firstListenable != widget.firstListenable) {
      oldWidget.firstListenable.removeListener(_firstValueListenableChange);
      _firstValue = widget.firstListenable.value;
    }
    if (oldWidget.secondListenable != widget.secondListenable) {
      oldWidget.secondListenable.removeListener(_secondValueListenableChange);
      _secondValue = widget.secondListenable.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.firstListenable.removeListener(_firstValueListenableChange);
    widget.secondListenable.removeListener(_secondValueListenableChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if ((_firstValue.isErrorState || _secondValue.isErrorState) && widget.errorBuilder != null) {
      return widget.errorBuilder!(
        context,
        _firstValue.data,
        _secondValue.data,
        _firstValue.errorOrNull,
        _secondValue.errorOrNull,
      );
    }
    if ((_firstValue.isLoadingState || _secondValue.isLoadingState) && widget.multiLoadingBuilder != null) {
      return widget.multiLoadingBuilder!(
        context,
        _firstValue.data,
        _secondValue.data,
      );
    }
    return widget.builder(context, _firstValue.data, _secondValue.data);
  }
}

typedef DoubleDataWidgetBuilder<F, S> = Widget Function(
  BuildContext context,
  F? firstData,
  S? secondData,
);

typedef DoubleLoadingBuilder<F, S> = Widget Function(
  BuildContext context,
  F? firstData,
  S? secondData,
);

typedef DoubleErrorWidgetBuilder<F, S> = Widget Function(
  BuildContext context,
  F? firstData,
  S? secondData,
  Exception? firstE,
  Exception? secondE,
);
