// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionPlanModel _$SubscriptionPlanModelFromJson(
    Map<String, dynamic> json) {
  return _SubscriptionPlanModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionPlanModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  SubscriptionType get type => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  BillingPeriod get billingPeriod => throw _privateConstructorUsedError;
  List<FeatureModel> get features => throw _privateConstructorUsedError;
  List<String>? get limitations => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  bool get isRecommended => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get promoText => throw _privateConstructorUsedError;
  double? get originalPrice => throw _privateConstructorUsedError;
  int? get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'trial_days')
  int? get trialDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_product_id')
  String? get platformProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'google_product_id')
  String? get googleProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'apple_product_id')
  String? get appleProductId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionPlanModelCopyWith<SubscriptionPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPlanModelCopyWith<$Res> {
  factory $SubscriptionPlanModelCopyWith(SubscriptionPlanModel value,
          $Res Function(SubscriptionPlanModel) then) =
      _$SubscriptionPlanModelCopyWithImpl<$Res, SubscriptionPlanModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      SubscriptionType type,
      double price,
      String currency,
      BillingPeriod billingPeriod,
      List<FeatureModel> features,
      List<String>? limitations,
      bool isPopular,
      bool isRecommended,
      bool isActive,
      String? promoText,
      double? originalPrice,
      int? discountPercentage,
      @JsonKey(name: 'trial_days') int? trialDays,
      @JsonKey(name: 'platform_product_id') String? platformProductId,
      @JsonKey(name: 'google_product_id') String? googleProductId,
      @JsonKey(name: 'apple_product_id') String? appleProductId,
      DateTime? createdAt,
      DateTime? updatedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SubscriptionPlanModelCopyWithImpl<$Res,
        $Val extends SubscriptionPlanModel>
    implements $SubscriptionPlanModelCopyWith<$Res> {
  _$SubscriptionPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? price = null,
    Object? currency = null,
    Object? billingPeriod = null,
    Object? features = null,
    Object? limitations = freezed,
    Object? isPopular = null,
    Object? isRecommended = null,
    Object? isActive = null,
    Object? promoText = freezed,
    Object? originalPrice = freezed,
    Object? discountPercentage = freezed,
    Object? trialDays = freezed,
    Object? platformProductId = freezed,
    Object? googleProductId = freezed,
    Object? appleProductId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SubscriptionType,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      billingPeriod: null == billingPeriod
          ? _value.billingPeriod
          : billingPeriod // ignore: cast_nullable_to_non_nullable
              as BillingPeriod,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      limitations: freezed == limitations
          ? _value.limitations
          : limitations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      promoText: freezed == promoText
          ? _value.promoText
          : promoText // ignore: cast_nullable_to_non_nullable
              as String?,
      originalPrice: freezed == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      trialDays: freezed == trialDays
          ? _value.trialDays
          : trialDays // ignore: cast_nullable_to_non_nullable
              as int?,
      platformProductId: freezed == platformProductId
          ? _value.platformProductId
          : platformProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      googleProductId: freezed == googleProductId
          ? _value.googleProductId
          : googleProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      appleProductId: freezed == appleProductId
          ? _value.appleProductId
          : appleProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionPlanModelImplCopyWith<$Res>
    implements $SubscriptionPlanModelCopyWith<$Res> {
  factory _$$SubscriptionPlanModelImplCopyWith(
          _$SubscriptionPlanModelImpl value,
          $Res Function(_$SubscriptionPlanModelImpl) then) =
      __$$SubscriptionPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      SubscriptionType type,
      double price,
      String currency,
      BillingPeriod billingPeriod,
      List<FeatureModel> features,
      List<String>? limitations,
      bool isPopular,
      bool isRecommended,
      bool isActive,
      String? promoText,
      double? originalPrice,
      int? discountPercentage,
      @JsonKey(name: 'trial_days') int? trialDays,
      @JsonKey(name: 'platform_product_id') String? platformProductId,
      @JsonKey(name: 'google_product_id') String? googleProductId,
      @JsonKey(name: 'apple_product_id') String? appleProductId,
      DateTime? createdAt,
      DateTime? updatedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SubscriptionPlanModelImplCopyWithImpl<$Res>
    extends _$SubscriptionPlanModelCopyWithImpl<$Res,
        _$SubscriptionPlanModelImpl>
    implements _$$SubscriptionPlanModelImplCopyWith<$Res> {
  __$$SubscriptionPlanModelImplCopyWithImpl(_$SubscriptionPlanModelImpl _value,
      $Res Function(_$SubscriptionPlanModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? price = null,
    Object? currency = null,
    Object? billingPeriod = null,
    Object? features = null,
    Object? limitations = freezed,
    Object? isPopular = null,
    Object? isRecommended = null,
    Object? isActive = null,
    Object? promoText = freezed,
    Object? originalPrice = freezed,
    Object? discountPercentage = freezed,
    Object? trialDays = freezed,
    Object? platformProductId = freezed,
    Object? googleProductId = freezed,
    Object? appleProductId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$SubscriptionPlanModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SubscriptionType,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      billingPeriod: null == billingPeriod
          ? _value.billingPeriod
          : billingPeriod // ignore: cast_nullable_to_non_nullable
              as BillingPeriod,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      limitations: freezed == limitations
          ? _value._limitations
          : limitations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      promoText: freezed == promoText
          ? _value.promoText
          : promoText // ignore: cast_nullable_to_non_nullable
              as String?,
      originalPrice: freezed == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      trialDays: freezed == trialDays
          ? _value.trialDays
          : trialDays // ignore: cast_nullable_to_non_nullable
              as int?,
      platformProductId: freezed == platformProductId
          ? _value.platformProductId
          : platformProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      googleProductId: freezed == googleProductId
          ? _value.googleProductId
          : googleProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      appleProductId: freezed == appleProductId
          ? _value.appleProductId
          : appleProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionPlanModelImpl extends _SubscriptionPlanModel {
  const _$SubscriptionPlanModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      this.type = SubscriptionType.premium,
      required this.price,
      required this.currency,
      required this.billingPeriod,
      final List<FeatureModel> features = const [],
      final List<String>? limitations,
      this.isPopular = false,
      this.isRecommended = false,
      this.isActive = true,
      this.promoText,
      this.originalPrice,
      this.discountPercentage,
      @JsonKey(name: 'trial_days') this.trialDays,
      @JsonKey(name: 'platform_product_id') this.platformProductId,
      @JsonKey(name: 'google_product_id') this.googleProductId,
      @JsonKey(name: 'apple_product_id') this.appleProductId,
      this.createdAt,
      this.updatedAt,
      final Map<String, dynamic>? metadata})
      : _features = features,
        _limitations = limitations,
        _metadata = metadata,
        super._();

  factory _$SubscriptionPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionPlanModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey()
  final SubscriptionType type;
  @override
  final double price;
  @override
  final String currency;
  @override
  final BillingPeriod billingPeriod;
  final List<FeatureModel> _features;
  @override
  @JsonKey()
  List<FeatureModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<String>? _limitations;
  @override
  List<String>? get limitations {
    final value = _limitations;
    if (value == null) return null;
    if (_limitations is EqualUnmodifiableListView) return _limitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isPopular;
  @override
  @JsonKey()
  final bool isRecommended;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? promoText;
  @override
  final double? originalPrice;
  @override
  final int? discountPercentage;
  @override
  @JsonKey(name: 'trial_days')
  final int? trialDays;
  @override
  @JsonKey(name: 'platform_product_id')
  final String? platformProductId;
  @override
  @JsonKey(name: 'google_product_id')
  final String? googleProductId;
  @override
  @JsonKey(name: 'apple_product_id')
  final String? appleProductId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SubscriptionPlanModel(id: $id, name: $name, description: $description, type: $type, price: $price, currency: $currency, billingPeriod: $billingPeriod, features: $features, limitations: $limitations, isPopular: $isPopular, isRecommended: $isRecommended, isActive: $isActive, promoText: $promoText, originalPrice: $originalPrice, discountPercentage: $discountPercentage, trialDays: $trialDays, platformProductId: $platformProductId, googleProductId: $googleProductId, appleProductId: $appleProductId, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.billingPeriod, billingPeriod) ||
                other.billingPeriod == billingPeriod) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality()
                .equals(other._limitations, _limitations) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.promoText, promoText) ||
                other.promoText == promoText) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.trialDays, trialDays) ||
                other.trialDays == trialDays) &&
            (identical(other.platformProductId, platformProductId) ||
                other.platformProductId == platformProductId) &&
            (identical(other.googleProductId, googleProductId) ||
                other.googleProductId == googleProductId) &&
            (identical(other.appleProductId, appleProductId) ||
                other.appleProductId == appleProductId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        type,
        price,
        currency,
        billingPeriod,
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(_limitations),
        isPopular,
        isRecommended,
        isActive,
        promoText,
        originalPrice,
        discountPercentage,
        trialDays,
        platformProductId,
        googleProductId,
        appleProductId,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPlanModelImplCopyWith<_$SubscriptionPlanModelImpl>
      get copyWith => __$$SubscriptionPlanModelImplCopyWithImpl<
          _$SubscriptionPlanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionPlanModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionPlanModel extends SubscriptionPlanModel {
  const factory _SubscriptionPlanModel(
      {required final String id,
      required final String name,
      required final String description,
      final SubscriptionType type,
      required final double price,
      required final String currency,
      required final BillingPeriod billingPeriod,
      final List<FeatureModel> features,
      final List<String>? limitations,
      final bool isPopular,
      final bool isRecommended,
      final bool isActive,
      final String? promoText,
      final double? originalPrice,
      final int? discountPercentage,
      @JsonKey(name: 'trial_days') final int? trialDays,
      @JsonKey(name: 'platform_product_id') final String? platformProductId,
      @JsonKey(name: 'google_product_id') final String? googleProductId,
      @JsonKey(name: 'apple_product_id') final String? appleProductId,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Map<String, dynamic>? metadata}) = _$SubscriptionPlanModelImpl;
  const _SubscriptionPlanModel._() : super._();

  factory _SubscriptionPlanModel.fromJson(Map<String, dynamic> json) =
      _$SubscriptionPlanModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  SubscriptionType get type;
  @override
  double get price;
  @override
  String get currency;
  @override
  BillingPeriod get billingPeriod;
  @override
  List<FeatureModel> get features;
  @override
  List<String>? get limitations;
  @override
  bool get isPopular;
  @override
  bool get isRecommended;
  @override
  bool get isActive;
  @override
  String? get promoText;
  @override
  double? get originalPrice;
  @override
  int? get discountPercentage;
  @override
  @JsonKey(name: 'trial_days')
  int? get trialDays;
  @override
  @JsonKey(name: 'platform_product_id')
  String? get platformProductId;
  @override
  @JsonKey(name: 'google_product_id')
  String? get googleProductId;
  @override
  @JsonKey(name: 'apple_product_id')
  String? get appleProductId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionPlanModelImplCopyWith<_$SubscriptionPlanModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserSubscriptionModel _$UserSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return _UserSubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$UserSubscriptionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  SubscriptionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancelled_at')
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'trial_ends_at')
  DateTime? get trialEndsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_billing_date')
  DateTime? get nextBillingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_payment_date')
  DateTime? get lastPaymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_renew')
  bool get autoRenew => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform')
  String? get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_subscription_id')
  String? get platformSubscriptionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  PaymentMethodModel? get paymentMethod => throw _privateConstructorUsedError;
  SubscriptionPlanModel? get plan => throw _privateConstructorUsedError;
  List<PaymentModel>? get payments => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isTrial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSubscriptionModelCopyWith<UserSubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSubscriptionModelCopyWith<$Res> {
  factory $UserSubscriptionModelCopyWith(UserSubscriptionModel value,
          $Res Function(UserSubscriptionModel) then) =
      _$UserSubscriptionModelCopyWithImpl<$Res, UserSubscriptionModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String planId,
      SubscriptionStatus status,
      @JsonKey(name: 'started_at') DateTime? startDate,
      @JsonKey(name: 'expires_at') DateTime? endDate,
      @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
      @JsonKey(name: 'trial_ends_at') DateTime? trialEndsAt,
      @JsonKey(name: 'next_billing_date') DateTime? nextBillingDate,
      @JsonKey(name: 'last_payment_date') DateTime? lastPaymentDate,
      @JsonKey(name: 'auto_renew') bool autoRenew,
      @JsonKey(name: 'platform') String? platform,
      @JsonKey(name: 'platform_subscription_id') String? platformSubscriptionId,
      @JsonKey(name: 'payment_method') PaymentMethodModel? paymentMethod,
      SubscriptionPlanModel? plan,
      List<PaymentModel>? payments,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      Map<String, dynamic>? metadata,
      bool isActive,
      bool isTrial});

  $PaymentMethodModelCopyWith<$Res>? get paymentMethod;
  $SubscriptionPlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class _$UserSubscriptionModelCopyWithImpl<$Res,
        $Val extends UserSubscriptionModel>
    implements $UserSubscriptionModelCopyWith<$Res> {
  _$UserSubscriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? planId = null,
    Object? status = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? cancelledAt = freezed,
    Object? trialEndsAt = freezed,
    Object? nextBillingDate = freezed,
    Object? lastPaymentDate = freezed,
    Object? autoRenew = null,
    Object? platform = freezed,
    Object? platformSubscriptionId = freezed,
    Object? paymentMethod = freezed,
    Object? plan = freezed,
    Object? payments = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = freezed,
    Object? isActive = null,
    Object? isTrial = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      trialEndsAt: freezed == trialEndsAt
          ? _value.trialEndsAt
          : trialEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextBillingDate: freezed == nextBillingDate
          ? _value.nextBillingDate
          : nextBillingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentDate: freezed == lastPaymentDate
          ? _value.lastPaymentDate
          : lastPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      autoRenew: null == autoRenew
          ? _value.autoRenew
          : autoRenew // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      platformSubscriptionId: freezed == platformSubscriptionId
          ? _value.platformSubscriptionId
          : platformSubscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodModel?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlanModel?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrial: null == isTrial
          ? _value.isTrial
          : isTrial // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodModelCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionPlanModelCopyWith<$Res>? get plan {
    if (_value.plan == null) {
      return null;
    }

    return $SubscriptionPlanModelCopyWith<$Res>(_value.plan!, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSubscriptionModelImplCopyWith<$Res>
    implements $UserSubscriptionModelCopyWith<$Res> {
  factory _$$UserSubscriptionModelImplCopyWith(
          _$UserSubscriptionModelImpl value,
          $Res Function(_$UserSubscriptionModelImpl) then) =
      __$$UserSubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String planId,
      SubscriptionStatus status,
      @JsonKey(name: 'started_at') DateTime? startDate,
      @JsonKey(name: 'expires_at') DateTime? endDate,
      @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
      @JsonKey(name: 'trial_ends_at') DateTime? trialEndsAt,
      @JsonKey(name: 'next_billing_date') DateTime? nextBillingDate,
      @JsonKey(name: 'last_payment_date') DateTime? lastPaymentDate,
      @JsonKey(name: 'auto_renew') bool autoRenew,
      @JsonKey(name: 'platform') String? platform,
      @JsonKey(name: 'platform_subscription_id') String? platformSubscriptionId,
      @JsonKey(name: 'payment_method') PaymentMethodModel? paymentMethod,
      SubscriptionPlanModel? plan,
      List<PaymentModel>? payments,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      Map<String, dynamic>? metadata,
      bool isActive,
      bool isTrial});

  @override
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod;
  @override
  $SubscriptionPlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class __$$UserSubscriptionModelImplCopyWithImpl<$Res>
    extends _$UserSubscriptionModelCopyWithImpl<$Res,
        _$UserSubscriptionModelImpl>
    implements _$$UserSubscriptionModelImplCopyWith<$Res> {
  __$$UserSubscriptionModelImplCopyWithImpl(_$UserSubscriptionModelImpl _value,
      $Res Function(_$UserSubscriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? planId = null,
    Object? status = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? cancelledAt = freezed,
    Object? trialEndsAt = freezed,
    Object? nextBillingDate = freezed,
    Object? lastPaymentDate = freezed,
    Object? autoRenew = null,
    Object? platform = freezed,
    Object? platformSubscriptionId = freezed,
    Object? paymentMethod = freezed,
    Object? plan = freezed,
    Object? payments = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? metadata = freezed,
    Object? isActive = null,
    Object? isTrial = null,
  }) {
    return _then(_$UserSubscriptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      trialEndsAt: freezed == trialEndsAt
          ? _value.trialEndsAt
          : trialEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextBillingDate: freezed == nextBillingDate
          ? _value.nextBillingDate
          : nextBillingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentDate: freezed == lastPaymentDate
          ? _value.lastPaymentDate
          : lastPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      autoRenew: null == autoRenew
          ? _value.autoRenew
          : autoRenew // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      platformSubscriptionId: freezed == platformSubscriptionId
          ? _value.platformSubscriptionId
          : platformSubscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodModel?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlanModel?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrial: null == isTrial
          ? _value.isTrial
          : isTrial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSubscriptionModelImpl extends _UserSubscriptionModel {
  const _$UserSubscriptionModelImpl(
      {required this.id,
      required this.userId,
      required this.planId,
      required this.status,
      @JsonKey(name: 'started_at') this.startDate,
      @JsonKey(name: 'expires_at') this.endDate,
      @JsonKey(name: 'cancelled_at') this.cancelledAt,
      @JsonKey(name: 'trial_ends_at') this.trialEndsAt,
      @JsonKey(name: 'next_billing_date') this.nextBillingDate,
      @JsonKey(name: 'last_payment_date') this.lastPaymentDate,
      @JsonKey(name: 'auto_renew') this.autoRenew = true,
      @JsonKey(name: 'platform') this.platform,
      @JsonKey(name: 'platform_subscription_id') this.platformSubscriptionId,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      this.plan,
      final List<PaymentModel>? payments,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final Map<String, dynamic>? metadata,
      this.isActive = false,
      this.isTrial = false})
      : _payments = payments,
        _metadata = metadata,
        super._();

  factory _$UserSubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSubscriptionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String planId;
  @override
  final SubscriptionStatus status;
  @override
  @JsonKey(name: 'started_at')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'cancelled_at')
  final DateTime? cancelledAt;
  @override
  @JsonKey(name: 'trial_ends_at')
  final DateTime? trialEndsAt;
  @override
  @JsonKey(name: 'next_billing_date')
  final DateTime? nextBillingDate;
  @override
  @JsonKey(name: 'last_payment_date')
  final DateTime? lastPaymentDate;
  @override
  @JsonKey(name: 'auto_renew')
  final bool autoRenew;
  @override
  @JsonKey(name: 'platform')
  final String? platform;
  @override
  @JsonKey(name: 'platform_subscription_id')
  final String? platformSubscriptionId;
  @override
  @JsonKey(name: 'payment_method')
  final PaymentMethodModel? paymentMethod;
  @override
  final SubscriptionPlanModel? plan;
  final List<PaymentModel>? _payments;
  @override
  List<PaymentModel>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isTrial;

  @override
  String toString() {
    return 'UserSubscriptionModel(id: $id, userId: $userId, planId: $planId, status: $status, startDate: $startDate, endDate: $endDate, cancelledAt: $cancelledAt, trialEndsAt: $trialEndsAt, nextBillingDate: $nextBillingDate, lastPaymentDate: $lastPaymentDate, autoRenew: $autoRenew, platform: $platform, platformSubscriptionId: $platformSubscriptionId, paymentMethod: $paymentMethod, plan: $plan, payments: $payments, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata, isActive: $isActive, isTrial: $isTrial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSubscriptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.trialEndsAt, trialEndsAt) ||
                other.trialEndsAt == trialEndsAt) &&
            (identical(other.nextBillingDate, nextBillingDate) ||
                other.nextBillingDate == nextBillingDate) &&
            (identical(other.lastPaymentDate, lastPaymentDate) ||
                other.lastPaymentDate == lastPaymentDate) &&
            (identical(other.autoRenew, autoRenew) ||
                other.autoRenew == autoRenew) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.platformSubscriptionId, platformSubscriptionId) ||
                other.platformSubscriptionId == platformSubscriptionId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isTrial, isTrial) || other.isTrial == isTrial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        planId,
        status,
        startDate,
        endDate,
        cancelledAt,
        trialEndsAt,
        nextBillingDate,
        lastPaymentDate,
        autoRenew,
        platform,
        platformSubscriptionId,
        paymentMethod,
        plan,
        const DeepCollectionEquality().hash(_payments),
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_metadata),
        isActive,
        isTrial
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSubscriptionModelImplCopyWith<_$UserSubscriptionModelImpl>
      get copyWith => __$$UserSubscriptionModelImplCopyWithImpl<
          _$UserSubscriptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _UserSubscriptionModel extends UserSubscriptionModel {
  const factory _UserSubscriptionModel(
      {required final String id,
      required final String userId,
      required final String planId,
      required final SubscriptionStatus status,
      @JsonKey(name: 'started_at') final DateTime? startDate,
      @JsonKey(name: 'expires_at') final DateTime? endDate,
      @JsonKey(name: 'cancelled_at') final DateTime? cancelledAt,
      @JsonKey(name: 'trial_ends_at') final DateTime? trialEndsAt,
      @JsonKey(name: 'next_billing_date') final DateTime? nextBillingDate,
      @JsonKey(name: 'last_payment_date') final DateTime? lastPaymentDate,
      @JsonKey(name: 'auto_renew') final bool autoRenew,
      @JsonKey(name: 'platform') final String? platform,
      @JsonKey(name: 'platform_subscription_id')
      final String? platformSubscriptionId,
      @JsonKey(name: 'payment_method') final PaymentMethodModel? paymentMethod,
      final SubscriptionPlanModel? plan,
      final List<PaymentModel>? payments,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final Map<String, dynamic>? metadata,
      final bool isActive,
      final bool isTrial}) = _$UserSubscriptionModelImpl;
  const _UserSubscriptionModel._() : super._();

  factory _UserSubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$UserSubscriptionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get planId;
  @override
  SubscriptionStatus get status;
  @override
  @JsonKey(name: 'started_at')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'cancelled_at')
  DateTime? get cancelledAt;
  @override
  @JsonKey(name: 'trial_ends_at')
  DateTime? get trialEndsAt;
  @override
  @JsonKey(name: 'next_billing_date')
  DateTime? get nextBillingDate;
  @override
  @JsonKey(name: 'last_payment_date')
  DateTime? get lastPaymentDate;
  @override
  @JsonKey(name: 'auto_renew')
  bool get autoRenew;
  @override
  @JsonKey(name: 'platform')
  String? get platform;
  @override
  @JsonKey(name: 'platform_subscription_id')
  String? get platformSubscriptionId;
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethodModel? get paymentMethod;
  @override
  SubscriptionPlanModel? get plan;
  @override
  List<PaymentModel>? get payments;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  bool get isActive;
  @override
  bool get isTrial;
  @override
  @JsonKey(ignore: true)
  _$$UserSubscriptionModelImplCopyWith<_$UserSubscriptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) {
  return _FeatureModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureModel {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get isIncluded => throw _privateConstructorUsedError;
  String? get limitation => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureModelCopyWith<FeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureModelCopyWith<$Res> {
  factory $FeatureModelCopyWith(
          FeatureModel value, $Res Function(FeatureModel) then) =
      _$FeatureModelCopyWithImpl<$Res, FeatureModel>;
  @useResult
  $Res call(
      {String key,
      String name,
      String? description,
      String? icon,
      bool isIncluded,
      String? limitation,
      int? quantity,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$FeatureModelCopyWithImpl<$Res, $Val extends FeatureModel>
    implements $FeatureModelCopyWith<$Res> {
  _$FeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? isIncluded = null,
    Object? limitation = freezed,
    Object? quantity = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isIncluded: null == isIncluded
          ? _value.isIncluded
          : isIncluded // ignore: cast_nullable_to_non_nullable
              as bool,
      limitation: freezed == limitation
          ? _value.limitation
          : limitation // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureModelImplCopyWith<$Res>
    implements $FeatureModelCopyWith<$Res> {
  factory _$$FeatureModelImplCopyWith(
          _$FeatureModelImpl value, $Res Function(_$FeatureModelImpl) then) =
      __$$FeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      String? description,
      String? icon,
      bool isIncluded,
      String? limitation,
      int? quantity,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$FeatureModelImplCopyWithImpl<$Res>
    extends _$FeatureModelCopyWithImpl<$Res, _$FeatureModelImpl>
    implements _$$FeatureModelImplCopyWith<$Res> {
  __$$FeatureModelImplCopyWithImpl(
      _$FeatureModelImpl _value, $Res Function(_$FeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? isIncluded = null,
    Object? limitation = freezed,
    Object? quantity = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$FeatureModelImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isIncluded: null == isIncluded
          ? _value.isIncluded
          : isIncluded // ignore: cast_nullable_to_non_nullable
              as bool,
      limitation: freezed == limitation
          ? _value.limitation
          : limitation // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureModelImpl extends _FeatureModel {
  const _$FeatureModelImpl(
      {required this.key,
      required this.name,
      this.description,
      this.icon,
      this.isIncluded = true,
      this.limitation,
      this.quantity,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$FeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureModelImplFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  @JsonKey()
  final bool isIncluded;
  @override
  final String? limitation;
  @override
  final int? quantity;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FeatureModel(key: $key, name: $name, description: $description, icon: $icon, isIncluded: $isIncluded, limitation: $limitation, quantity: $quantity, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureModelImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isIncluded, isIncluded) ||
                other.isIncluded == isIncluded) &&
            (identical(other.limitation, limitation) ||
                other.limitation == limitation) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      description,
      icon,
      isIncluded,
      limitation,
      quantity,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      __$$FeatureModelImplCopyWithImpl<_$FeatureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureModelImplToJson(
      this,
    );
  }
}

abstract class _FeatureModel extends FeatureModel {
  const factory _FeatureModel(
      {required final String key,
      required final String name,
      final String? description,
      final String? icon,
      final bool isIncluded,
      final String? limitation,
      final int? quantity,
      final Map<String, dynamic>? metadata}) = _$FeatureModelImpl;
  const _FeatureModel._() : super._();

  factory _FeatureModel.fromJson(Map<String, dynamic> json) =
      _$FeatureModelImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  bool get isIncluded;
  @override
  String? get limitation;
  @override
  int? get quantity;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PaymentStatus get status => throw _privateConstructorUsedError;
  PaymentMethod get method => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date')
  DateTime get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_transaction_id')
  String? get platformTransactionId => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;
  String? get receiptUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      String subscriptionId,
      double amount,
      String currency,
      PaymentStatus status,
      PaymentMethod method,
      @JsonKey(name: 'payment_date') DateTime paymentDate,
      @JsonKey(name: 'platform_transaction_id') String? platformTransactionId,
      String? failureReason,
      String? receiptUrl,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? method = null,
    Object? paymentDate = null,
    Object? platformTransactionId = freezed,
    Object? failureReason = freezed,
    Object? receiptUrl = freezed,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      platformTransactionId: freezed == platformTransactionId
          ? _value.platformTransactionId
          : platformTransactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subscriptionId,
      double amount,
      String currency,
      PaymentStatus status,
      PaymentMethod method,
      @JsonKey(name: 'payment_date') DateTime paymentDate,
      @JsonKey(name: 'platform_transaction_id') String? platformTransactionId,
      String? failureReason,
      String? receiptUrl,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? method = null,
    Object? paymentDate = null,
    Object? platformTransactionId = freezed,
    Object? failureReason = freezed,
    Object? receiptUrl = freezed,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      platformTransactionId: freezed == platformTransactionId
          ? _value.platformTransactionId
          : platformTransactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl extends _PaymentModel {
  const _$PaymentModelImpl(
      {required this.id,
      required this.subscriptionId,
      required this.amount,
      required this.currency,
      required this.status,
      required this.method,
      @JsonKey(name: 'payment_date') required this.paymentDate,
      @JsonKey(name: 'platform_transaction_id') this.platformTransactionId,
      this.failureReason,
      this.receiptUrl,
      @JsonKey(name: 'created_at') required this.createdAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String subscriptionId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final PaymentStatus status;
  @override
  final PaymentMethod method;
  @override
  @JsonKey(name: 'payment_date')
  final DateTime paymentDate;
  @override
  @JsonKey(name: 'platform_transaction_id')
  final String? platformTransactionId;
  @override
  final String? failureReason;
  @override
  final String? receiptUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentModel(id: $id, subscriptionId: $subscriptionId, amount: $amount, currency: $currency, status: $status, method: $method, paymentDate: $paymentDate, platformTransactionId: $platformTransactionId, failureReason: $failureReason, receiptUrl: $receiptUrl, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.platformTransactionId, platformTransactionId) ||
                other.platformTransactionId == platformTransactionId) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subscriptionId,
      amount,
      currency,
      status,
      method,
      paymentDate,
      platformTransactionId,
      failureReason,
      receiptUrl,
      createdAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel extends PaymentModel {
  const factory _PaymentModel(
      {required final String id,
      required final String subscriptionId,
      required final double amount,
      required final String currency,
      required final PaymentStatus status,
      required final PaymentMethod method,
      @JsonKey(name: 'payment_date') required final DateTime paymentDate,
      @JsonKey(name: 'platform_transaction_id')
      final String? platformTransactionId,
      final String? failureReason,
      final String? receiptUrl,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      final Map<String, dynamic>? metadata}) = _$PaymentModelImpl;
  const _PaymentModel._() : super._();

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get subscriptionId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  PaymentStatus get status;
  @override
  PaymentMethod get method;
  @override
  @JsonKey(name: 'payment_date')
  DateTime get paymentDate;
  @override
  @JsonKey(name: 'platform_transaction_id')
  String? get platformTransactionId;
  @override
  String? get failureReason;
  @override
  String? get receiptUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodModel {
  String get id => throw _privateConstructorUsedError;
  PaymentMethod get type => throw _privateConstructorUsedError;
  String? get last4 => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_month')
  int? get expiryMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_year')
  int? get expiryYear => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
          PaymentMethodModel value, $Res Function(PaymentMethodModel) then) =
      _$PaymentMethodModelCopyWithImpl<$Res, PaymentMethodModel>;
  @useResult
  $Res call(
      {String id,
      PaymentMethod type,
      String? last4,
      String? brand,
      @JsonKey(name: 'expiry_month') int? expiryMonth,
      @JsonKey(name: 'expiry_year') int? expiryYear,
      bool isDefault,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res, $Val extends PaymentMethodModel>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? last4 = freezed,
    Object? brand = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? isDefault = null,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodModelImplCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$$PaymentMethodModelImplCopyWith(_$PaymentMethodModelImpl value,
          $Res Function(_$PaymentMethodModelImpl) then) =
      __$$PaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PaymentMethod type,
      String? last4,
      String? brand,
      @JsonKey(name: 'expiry_month') int? expiryMonth,
      @JsonKey(name: 'expiry_year') int? expiryYear,
      bool isDefault,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PaymentMethodModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodModelCopyWithImpl<$Res, _$PaymentMethodModelImpl>
    implements _$$PaymentMethodModelImplCopyWith<$Res> {
  __$$PaymentMethodModelImplCopyWithImpl(_$PaymentMethodModelImpl _value,
      $Res Function(_$PaymentMethodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? last4 = freezed,
    Object? brand = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? isDefault = null,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_$PaymentMethodModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodModelImpl extends _PaymentMethodModel {
  const _$PaymentMethodModelImpl(
      {required this.id,
      required this.type,
      this.last4,
      this.brand,
      @JsonKey(name: 'expiry_month') this.expiryMonth,
      @JsonKey(name: 'expiry_year') this.expiryYear,
      this.isDefault = true,
      @JsonKey(name: 'created_at') required this.createdAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$PaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodModelImplFromJson(json);

  @override
  final String id;
  @override
  final PaymentMethod type;
  @override
  final String? last4;
  @override
  final String? brand;
  @override
  @JsonKey(name: 'expiry_month')
  final int? expiryMonth;
  @override
  @JsonKey(name: 'expiry_year')
  final int? expiryYear;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, type: $type, last4: $last4, brand: $brand, expiryMonth: $expiryMonth, expiryYear: $expiryYear, isDefault: $isDefault, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.expiryMonth, expiryMonth) ||
                other.expiryMonth == expiryMonth) &&
            (identical(other.expiryYear, expiryYear) ||
                other.expiryYear == expiryYear) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      last4,
      brand,
      expiryMonth,
      expiryYear,
      isDefault,
      createdAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      __$$PaymentMethodModelImplCopyWithImpl<_$PaymentMethodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodModel extends PaymentMethodModel {
  const factory _PaymentMethodModel(
      {required final String id,
      required final PaymentMethod type,
      final String? last4,
      final String? brand,
      @JsonKey(name: 'expiry_month') final int? expiryMonth,
      @JsonKey(name: 'expiry_year') final int? expiryYear,
      final bool isDefault,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      final Map<String, dynamic>? metadata}) = _$PaymentMethodModelImpl;
  const _PaymentMethodModel._() : super._();

  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodModelImpl.fromJson;

  @override
  String get id;
  @override
  PaymentMethod get type;
  @override
  String? get last4;
  @override
  String? get brand;
  @override
  @JsonKey(name: 'expiry_month')
  int? get expiryMonth;
  @override
  @JsonKey(name: 'expiry_year')
  int? get expiryYear;
  @override
  bool get isDefault;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
