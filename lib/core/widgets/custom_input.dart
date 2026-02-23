import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';

enum InputType {
  text,
  email,
  password,
  phone,
  number,
  multiline,
  search,
}

class CustomInput extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final String? initialValue;
  final InputType inputType;
  final bool isRequired;
  final bool isEnabled;
  final bool isReadOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final bool obscureText;
  final VoidCallback? onObscureToggle;
  final Color? fillColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const CustomInput({
    super.key,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.initialValue,
    this.inputType = InputType.text,
    this.isRequired = false,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.inputFormatters,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.obscureText = false,
    this.onObscureToggle,
    this.fillColor,
    this.borderRadius,
    this.contentPadding,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isControllerLocal = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    // Initialize focus node
    _focusNode = widget.focusNode ?? FocusNode();

    // Initialize controller
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController(text: widget.initialValue);
      _isControllerLocal = true;
    }
  }

  @override
  void dispose() {
    if (_isControllerLocal) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) _buildLabel(),
        _buildTextField(),
        if (widget.helperText != null && widget.errorText == null) _buildHelperText(),
      ],
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(text: widget.label!),
            if (widget.isRequired)
              const TextSpan(
                text: ' *',
                style: TextStyle(color: AppColors.error),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.isEnabled,
      readOnly: widget.isReadOnly,
      autofocus: widget.autofocus,
      obscureText: _obscureText,
      maxLines: _getMaxLines(),
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      keyboardType: _getKeyboardType(),
      textInputAction: widget.textInputAction ?? _getTextInputAction(),
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatters ?? _getInputFormatters(),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
        filled: true,
        fillColor: widget.fillColor ??
                   (widget.isEnabled ? AppColors.white : AppColors.grey50),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(isFocused: true),
        errorBorder: _buildBorder(isError: true),
        focusedErrorBorder: _buildBorder(isError: true, isFocused: true),
        disabledBorder: _buildBorder(isDisabled: true),
        contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        counterText: widget.maxLength != null ? null : '',
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: widget.isEnabled ? AppColors.textPrimary : AppColors.textTertiary,
      ),
    );
  }

  Widget _buildHelperText() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16),
      child: Text(
        widget.helperText!,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textTertiary,
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.inputType == InputType.password) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.textTertiary,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
          widget.onObscureToggle?.call();
        },
      );
    }

    if (widget.inputType == InputType.search) {
      return IconButton(
        icon: const Icon(
          Icons.search,
          color: AppColors.textTertiary,
        ),
        onPressed: () {
          widget.onSubmitted?.call(_controller.text);
        },
      );
    }

    return widget.suffixIcon;
  }

  OutlineInputBorder _buildBorder({
    bool isFocused = false,
    bool isError = false,
    bool isDisabled = false,
  }) {
    Color borderColor;
    double borderWidth = 1;

    if (isError) {
      borderColor = AppColors.borderError;
      borderWidth = isFocused ? 2 : 1;
    } else if (isFocused) {
      borderColor = AppColors.borderFocus;
      borderWidth = 2;
    } else if (isDisabled) {
      borderColor = AppColors.grey200;
    } else {
      borderColor = AppColors.border;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? AppBorderRadius.medium,
      ),
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.inputType) {
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.phone:
        return TextInputType.phone;
      case InputType.number:
        return TextInputType.number;
      case InputType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  TextInputAction _getTextInputAction() {
    switch (widget.inputType) {
      case InputType.multiline:
        return TextInputAction.newline;
      case InputType.search:
        return TextInputAction.search;
      default:
        return TextInputAction.next;
    }
  }

  int? _getMaxLines() {
    if (widget.maxLines != null) return widget.maxLines;

    switch (widget.inputType) {
      case InputType.password:
        return 1;
      case InputType.multiline:
        return null; // Unlimited
      default:
        return 1;
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.inputFormatters != null) return widget.inputFormatters;

    switch (widget.inputType) {
      case InputType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(15),
        ];
      case InputType.number:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ];
      case InputType.email:
        return [
          FilteringTextInputFormatter.deny(RegExp(r'\s')), // No spaces
        ];
      default:
        return null;
    }
  }
}

// Specialized input variants for common use cases
class EmailInput extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isRequired;

  const EmailInput({
    super.key,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.validator,
    this.onChanged,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      label: label ?? AppStrings.email,
      hintText: hintText ?? 'Enter your email address',
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      isRequired: isRequired,
      inputType: InputType.email,
      prefixIcon: const Icon(Icons.email_outlined),
      textInputAction: TextInputAction.next,
    );
  }
}

class PasswordInput extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isRequired;

  const PasswordInput({
    super.key,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.validator,
    this.onChanged,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      label: label ?? AppStrings.password,
      hintText: hintText ?? 'Enter your password',
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      isRequired: isRequired,
      inputType: InputType.password,
      prefixIcon: const Icon(Icons.lock_outlined),
      textInputAction: TextInputAction.done,
      obscureText: true,
    );
  }
}

class PhoneInput extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isRequired;

  const PhoneInput({
    super.key,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.validator,
    this.onChanged,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      label: label ?? AppStrings.phoneNumber,
      hintText: hintText ?? 'Enter your phone number',
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      isRequired: isRequired,
      inputType: InputType.phone,
      prefixIcon: const Icon(Icons.phone_outlined),
      textInputAction: TextInputAction.next,
    );
  }
}

class SearchInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;

  const SearchInput({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      hintText: hintText ?? AppStrings.search,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      inputType: InputType.search,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: controller?.text.isNotEmpty == true
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                controller?.clear();
                onClear?.call();
              },
            )
          : null,
      textInputAction: TextInputAction.search,
    );
  }
}

class MultilineInput extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isRequired;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  const MultilineInput({
    super.key,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.validator,
    this.onChanged,
    this.isRequired = false,
    this.maxLines,
    this.minLines = 3,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      label: label,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      isRequired: isRequired,
      inputType: InputType.multiline,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textInputAction: TextInputAction.newline,
    );
  }
}