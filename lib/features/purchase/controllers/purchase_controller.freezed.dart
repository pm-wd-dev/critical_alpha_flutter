// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<SubscriptionPlanModel> get availablePlans =>
      throw _privateConstructorUsedError;
  UserSubscriptionModel? get currentSubscription =>
      throw _privateConstructorUsedError;
  List<ProductDetails> get storeProducts => throw _privateConstructorUsedError;
  PurchaseFlow get currentFlow => throw _privateConstructorUsedError;
  String? get selectedPlanId => throw _privateConstructorUsedError;
  bool get isPurchasing => throw _privateConstructorUsedError;
  bool get isRestoring => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get purchaseError =>
      throw _privateConstructorUsedError; // Feature flags
  bool get canMakePurchases => throw _privateConstructorUsedError;
  bool get hasActiveSubscription => throw _privateConstructorUsedError;
  bool get hasValidPaymentMethod =>
      throw _privateConstructorUsedError; // Purchase success state
  PurchaseResult? get lastPurchaseResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseStateCopyWith<PurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res, PurchaseState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<SubscriptionPlanModel> availablePlans,
      UserSubscriptionModel? currentSubscription,
      List<ProductDetails> storeProducts,
      PurchaseFlow currentFlow,
      String? selectedPlanId,
      bool isPurchasing,
      bool isRestoring,
      String? error,
      String? purchaseError,
      bool canMakePurchases,
      bool hasActiveSubscription,
      bool hasValidPaymentMethod,
      PurchaseResult? lastPurchaseResult});

  $UserSubscriptionModelCopyWith<$Res>? get currentSubscription;
  $PurchaseResultCopyWith<$Res>? get lastPurchaseResult;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res, $Val extends PurchaseState>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? availablePlans = null,
    Object? currentSubscription = freezed,
    Object? storeProducts = null,
    Object? currentFlow = null,
    Object? selectedPlanId = freezed,
    Object? isPurchasing = null,
    Object? isRestoring = null,
    Object? error = freezed,
    Object? purchaseError = freezed,
    Object? canMakePurchases = null,
    Object? hasActiveSubscription = null,
    Object? hasValidPaymentMethod = null,
    Object? lastPurchaseResult = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      availablePlans: null == availablePlans
          ? _value.availablePlans
          : availablePlans // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlanModel>,
      currentSubscription: freezed == currentSubscription
          ? _value.currentSubscription
          : currentSubscription // ignore: cast_nullable_to_non_nullable
              as UserSubscriptionModel?,
      storeProducts: null == storeProducts
          ? _value.storeProducts
          : storeProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      currentFlow: null == currentFlow
          ? _value.currentFlow
          : currentFlow // ignore: cast_nullable_to_non_nullable
              as PurchaseFlow,
      selectedPlanId: freezed == selectedPlanId
          ? _value.selectedPlanId
          : selectedPlanId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isRestoring: null == isRestoring
          ? _value.isRestoring
          : isRestoring // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseError: freezed == purchaseError
          ? _value.purchaseError
          : purchaseError // ignore: cast_nullable_to_non_nullable
              as String?,
      canMakePurchases: null == canMakePurchases
          ? _value.canMakePurchases
          : canMakePurchases // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveSubscription: null == hasActiveSubscription
          ? _value.hasActiveSubscription
          : hasActiveSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidPaymentMethod: null == hasValidPaymentMethod
          ? _value.hasValidPaymentMethod
          : hasValidPaymentMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPurchaseResult: freezed == lastPurchaseResult
          ? _value.lastPurchaseResult
          : lastPurchaseResult // ignore: cast_nullable_to_non_nullable
              as PurchaseResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSubscriptionModelCopyWith<$Res>? get currentSubscription {
    if (_value.currentSubscription == null) {
      return null;
    }

    return $UserSubscriptionModelCopyWith<$Res>(_value.currentSubscription!,
        (value) {
      return _then(_value.copyWith(currentSubscription: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseResultCopyWith<$Res>? get lastPurchaseResult {
    if (_value.lastPurchaseResult == null) {
      return null;
    }

    return $PurchaseResultCopyWith<$Res>(_value.lastPurchaseResult!, (value) {
      return _then(_value.copyWith(lastPurchaseResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseStateImplCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory _$$PurchaseStateImplCopyWith(
          _$PurchaseStateImpl value, $Res Function(_$PurchaseStateImpl) then) =
      __$$PurchaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<SubscriptionPlanModel> availablePlans,
      UserSubscriptionModel? currentSubscription,
      List<ProductDetails> storeProducts,
      PurchaseFlow currentFlow,
      String? selectedPlanId,
      bool isPurchasing,
      bool isRestoring,
      String? error,
      String? purchaseError,
      bool canMakePurchases,
      bool hasActiveSubscription,
      bool hasValidPaymentMethod,
      PurchaseResult? lastPurchaseResult});

  @override
  $UserSubscriptionModelCopyWith<$Res>? get currentSubscription;
  @override
  $PurchaseResultCopyWith<$Res>? get lastPurchaseResult;
}

/// @nodoc
class __$$PurchaseStateImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateImpl>
    implements _$$PurchaseStateImplCopyWith<$Res> {
  __$$PurchaseStateImplCopyWithImpl(
      _$PurchaseStateImpl _value, $Res Function(_$PurchaseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? availablePlans = null,
    Object? currentSubscription = freezed,
    Object? storeProducts = null,
    Object? currentFlow = null,
    Object? selectedPlanId = freezed,
    Object? isPurchasing = null,
    Object? isRestoring = null,
    Object? error = freezed,
    Object? purchaseError = freezed,
    Object? canMakePurchases = null,
    Object? hasActiveSubscription = null,
    Object? hasValidPaymentMethod = null,
    Object? lastPurchaseResult = freezed,
  }) {
    return _then(_$PurchaseStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      availablePlans: null == availablePlans
          ? _value._availablePlans
          : availablePlans // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlanModel>,
      currentSubscription: freezed == currentSubscription
          ? _value.currentSubscription
          : currentSubscription // ignore: cast_nullable_to_non_nullable
              as UserSubscriptionModel?,
      storeProducts: null == storeProducts
          ? _value._storeProducts
          : storeProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      currentFlow: null == currentFlow
          ? _value.currentFlow
          : currentFlow // ignore: cast_nullable_to_non_nullable
              as PurchaseFlow,
      selectedPlanId: freezed == selectedPlanId
          ? _value.selectedPlanId
          : selectedPlanId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isRestoring: null == isRestoring
          ? _value.isRestoring
          : isRestoring // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseError: freezed == purchaseError
          ? _value.purchaseError
          : purchaseError // ignore: cast_nullable_to_non_nullable
              as String?,
      canMakePurchases: null == canMakePurchases
          ? _value.canMakePurchases
          : canMakePurchases // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveSubscription: null == hasActiveSubscription
          ? _value.hasActiveSubscription
          : hasActiveSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidPaymentMethod: null == hasValidPaymentMethod
          ? _value.hasValidPaymentMethod
          : hasValidPaymentMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPurchaseResult: freezed == lastPurchaseResult
          ? _value.lastPurchaseResult
          : lastPurchaseResult // ignore: cast_nullable_to_non_nullable
              as PurchaseResult?,
    ));
  }
}

/// @nodoc

class _$PurchaseStateImpl extends _PurchaseState {
  const _$PurchaseStateImpl(
      {this.isLoading = true,
      final List<SubscriptionPlanModel> availablePlans = const [],
      this.currentSubscription,
      final List<ProductDetails> storeProducts = const [],
      this.currentFlow = PurchaseFlow.none,
      this.selectedPlanId,
      this.isPurchasing = false,
      this.isRestoring = false,
      this.error,
      this.purchaseError,
      this.canMakePurchases = false,
      this.hasActiveSubscription = false,
      this.hasValidPaymentMethod = false,
      this.lastPurchaseResult})
      : _availablePlans = availablePlans,
        _storeProducts = storeProducts,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<SubscriptionPlanModel> _availablePlans;
  @override
  @JsonKey()
  List<SubscriptionPlanModel> get availablePlans {
    if (_availablePlans is EqualUnmodifiableListView) return _availablePlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePlans);
  }

  @override
  final UserSubscriptionModel? currentSubscription;
  final List<ProductDetails> _storeProducts;
  @override
  @JsonKey()
  List<ProductDetails> get storeProducts {
    if (_storeProducts is EqualUnmodifiableListView) return _storeProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeProducts);
  }

  @override
  @JsonKey()
  final PurchaseFlow currentFlow;
  @override
  final String? selectedPlanId;
  @override
  @JsonKey()
  final bool isPurchasing;
  @override
  @JsonKey()
  final bool isRestoring;
  @override
  final String? error;
  @override
  final String? purchaseError;
// Feature flags
  @override
  @JsonKey()
  final bool canMakePurchases;
  @override
  @JsonKey()
  final bool hasActiveSubscription;
  @override
  @JsonKey()
  final bool hasValidPaymentMethod;
// Purchase success state
  @override
  final PurchaseResult? lastPurchaseResult;

  @override
  String toString() {
    return 'PurchaseState(isLoading: $isLoading, availablePlans: $availablePlans, currentSubscription: $currentSubscription, storeProducts: $storeProducts, currentFlow: $currentFlow, selectedPlanId: $selectedPlanId, isPurchasing: $isPurchasing, isRestoring: $isRestoring, error: $error, purchaseError: $purchaseError, canMakePurchases: $canMakePurchases, hasActiveSubscription: $hasActiveSubscription, hasValidPaymentMethod: $hasValidPaymentMethod, lastPurchaseResult: $lastPurchaseResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._availablePlans, _availablePlans) &&
            (identical(other.currentSubscription, currentSubscription) ||
                other.currentSubscription == currentSubscription) &&
            const DeepCollectionEquality()
                .equals(other._storeProducts, _storeProducts) &&
            (identical(other.currentFlow, currentFlow) ||
                other.currentFlow == currentFlow) &&
            (identical(other.selectedPlanId, selectedPlanId) ||
                other.selectedPlanId == selectedPlanId) &&
            (identical(other.isPurchasing, isPurchasing) ||
                other.isPurchasing == isPurchasing) &&
            (identical(other.isRestoring, isRestoring) ||
                other.isRestoring == isRestoring) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.purchaseError, purchaseError) ||
                other.purchaseError == purchaseError) &&
            (identical(other.canMakePurchases, canMakePurchases) ||
                other.canMakePurchases == canMakePurchases) &&
            (identical(other.hasActiveSubscription, hasActiveSubscription) ||
                other.hasActiveSubscription == hasActiveSubscription) &&
            (identical(other.hasValidPaymentMethod, hasValidPaymentMethod) ||
                other.hasValidPaymentMethod == hasValidPaymentMethod) &&
            (identical(other.lastPurchaseResult, lastPurchaseResult) ||
                other.lastPurchaseResult == lastPurchaseResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_availablePlans),
      currentSubscription,
      const DeepCollectionEquality().hash(_storeProducts),
      currentFlow,
      selectedPlanId,
      isPurchasing,
      isRestoring,
      error,
      purchaseError,
      canMakePurchases,
      hasActiveSubscription,
      hasValidPaymentMethod,
      lastPurchaseResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStateImplCopyWith<_$PurchaseStateImpl> get copyWith =>
      __$$PurchaseStateImplCopyWithImpl<_$PurchaseStateImpl>(this, _$identity);
}

abstract class _PurchaseState extends PurchaseState {
  const factory _PurchaseState(
      {final bool isLoading,
      final List<SubscriptionPlanModel> availablePlans,
      final UserSubscriptionModel? currentSubscription,
      final List<ProductDetails> storeProducts,
      final PurchaseFlow currentFlow,
      final String? selectedPlanId,
      final bool isPurchasing,
      final bool isRestoring,
      final String? error,
      final String? purchaseError,
      final bool canMakePurchases,
      final bool hasActiveSubscription,
      final bool hasValidPaymentMethod,
      final PurchaseResult? lastPurchaseResult}) = _$PurchaseStateImpl;
  const _PurchaseState._() : super._();

  @override
  bool get isLoading;
  @override
  List<SubscriptionPlanModel> get availablePlans;
  @override
  UserSubscriptionModel? get currentSubscription;
  @override
  List<ProductDetails> get storeProducts;
  @override
  PurchaseFlow get currentFlow;
  @override
  String? get selectedPlanId;
  @override
  bool get isPurchasing;
  @override
  bool get isRestoring;
  @override
  String? get error;
  @override
  String? get purchaseError;
  @override // Feature flags
  bool get canMakePurchases;
  @override
  bool get hasActiveSubscription;
  @override
  bool get hasValidPaymentMethod;
  @override // Purchase success state
  PurchaseResult? get lastPurchaseResult;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseStateImplCopyWith<_$PurchaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseResult {
  bool get success => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserSubscriptionModel? get subscription => throw _privateConstructorUsedError;
  DateTime? get purchaseDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseResultCopyWith<PurchaseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseResultCopyWith<$Res> {
  factory $PurchaseResultCopyWith(
          PurchaseResult value, $Res Function(PurchaseResult) then) =
      _$PurchaseResultCopyWithImpl<$Res, PurchaseResult>;
  @useResult
  $Res call(
      {bool success,
      String planId,
      String? transactionId,
      String? message,
      UserSubscriptionModel? subscription,
      DateTime? purchaseDate});

  $UserSubscriptionModelCopyWith<$Res>? get subscription;
}

/// @nodoc
class _$PurchaseResultCopyWithImpl<$Res, $Val extends PurchaseResult>
    implements $PurchaseResultCopyWith<$Res> {
  _$PurchaseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? planId = null,
    Object? transactionId = freezed,
    Object? message = freezed,
    Object? subscription = freezed,
    Object? purchaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as UserSubscriptionModel?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSubscriptionModelCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $UserSubscriptionModelCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseResultImplCopyWith<$Res>
    implements $PurchaseResultCopyWith<$Res> {
  factory _$$PurchaseResultImplCopyWith(_$PurchaseResultImpl value,
          $Res Function(_$PurchaseResultImpl) then) =
      __$$PurchaseResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String planId,
      String? transactionId,
      String? message,
      UserSubscriptionModel? subscription,
      DateTime? purchaseDate});

  @override
  $UserSubscriptionModelCopyWith<$Res>? get subscription;
}

/// @nodoc
class __$$PurchaseResultImplCopyWithImpl<$Res>
    extends _$PurchaseResultCopyWithImpl<$Res, _$PurchaseResultImpl>
    implements _$$PurchaseResultImplCopyWith<$Res> {
  __$$PurchaseResultImplCopyWithImpl(
      _$PurchaseResultImpl _value, $Res Function(_$PurchaseResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? planId = null,
    Object? transactionId = freezed,
    Object? message = freezed,
    Object? subscription = freezed,
    Object? purchaseDate = freezed,
  }) {
    return _then(_$PurchaseResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as UserSubscriptionModel?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PurchaseResultImpl implements _PurchaseResult {
  const _$PurchaseResultImpl(
      {required this.success,
      required this.planId,
      this.transactionId,
      this.message,
      this.subscription,
      this.purchaseDate});

  @override
  final bool success;
  @override
  final String planId;
  @override
  final String? transactionId;
  @override
  final String? message;
  @override
  final UserSubscriptionModel? subscription;
  @override
  final DateTime? purchaseDate;

  @override
  String toString() {
    return 'PurchaseResult(success: $success, planId: $planId, transactionId: $transactionId, message: $message, subscription: $subscription, purchaseDate: $purchaseDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, planId, transactionId,
      message, subscription, purchaseDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseResultImplCopyWith<_$PurchaseResultImpl> get copyWith =>
      __$$PurchaseResultImplCopyWithImpl<_$PurchaseResultImpl>(
          this, _$identity);
}

abstract class _PurchaseResult implements PurchaseResult {
  const factory _PurchaseResult(
      {required final bool success,
      required final String planId,
      final String? transactionId,
      final String? message,
      final UserSubscriptionModel? subscription,
      final DateTime? purchaseDate}) = _$PurchaseResultImpl;

  @override
  bool get success;
  @override
  String get planId;
  @override
  String? get transactionId;
  @override
  String? get message;
  @override
  UserSubscriptionModel? get subscription;
  @override
  DateTime? get purchaseDate;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseResultImplCopyWith<_$PurchaseResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
