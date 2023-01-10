import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;

class FMHolderField extends FormField<String> {
  /// ## Holder Field
  ///
  /// ### **Type:** `FMHolderField`.
  /// This field return a [TextFormField] type version for flutterme call
  /// [FMHolderField]. It behaves and same way and contains same properties.
  /// use it same way you would use the [TextFormField].
  FMHolderField({
    super.key,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    super.onSaved,
    super.validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    super.restorationId,
    bool enableIMEPersonalizedLearning = true,
    MouseCursor? mouseCursor,
  })  : assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        super(
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<String> field) {
            final _FMHolderFieldState state = field as _FMHolderFieldState;
            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: TextField(
                restorationId: restorationId,
                controller: state._effectiveController,
                focusNode: focusNode,
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                toolbarOptions: toolbarOptions,
                readOnly: readOnly,
                showCursor: showCursor,
                obscuringCharacter: obscuringCharacter,
                obscureText: obscureText,
                autocorrect: autocorrect,
                smartDashesType: smartDashesType ??
                    (obscureText
                        ? SmartDashesType.disabled
                        : SmartDashesType.enabled),
                smartQuotesType: smartQuotesType ??
                    (obscureText
                        ? SmartQuotesType.disabled
                        : SmartQuotesType.enabled),
                enableSuggestions: enableSuggestions,
                maxLengthEnforcement: maxLengthEnforcement,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChangedHandler,
                onTap: onTap,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled ?? decoration?.enabled ?? true,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                scrollPadding: scrollPadding,
                scrollPhysics: scrollPhysics,
                keyboardAppearance: keyboardAppearance,
                enableInteractiveSelection:
                    enableInteractiveSelection ?? (!obscureText || !readOnly),
                selectionControls: selectionControls,
                buildCounter: buildCounter,
                autofillHints: autofillHints,
                scrollController: scrollController,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                mouseCursor: mouseCursor,
              ),
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _FMHolderFieldState();
}

class _FMHolderFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _fMHolderField.controller ?? _controller!.value;

  FMHolderField get _fMHolderField => super.widget as FMHolderField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_fMHolderField.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: widget.initialValue!)
          : null);
    } else {
      _fMHolderField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(FMHolderField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_fMHolderField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _fMHolderField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _fMHolderField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_fMHolderField.controller != null) {
        setValue(_fMHolderField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _fMHolderField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
