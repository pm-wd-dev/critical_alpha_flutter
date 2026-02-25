// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionPlanModelImpl _$$SubscriptionPlanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionPlanModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecodeNullable(_$SubscriptionTypeEnumMap, json['type']) ??
          SubscriptionType.premium,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      billingPeriod: $enumDecode(_$BillingPeriodEnumMap, json['billingPeriod']),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      limitations: (json['limitations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isPopular: json['isPopular'] as bool? ?? false,
      isRecommended: json['isRecommended'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      promoText: json['promoText'] as String?,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
      trialDays: (json['trial_days'] as num?)?.toInt(),
      platformProductId: json['platform_product_id'] as String?,
      googleProductId: json['google_product_id'] as String?,
      appleProductId: json['apple_product_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SubscriptionPlanModelImplToJson(
        _$SubscriptionPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$SubscriptionTypeEnumMap[instance.type]!,
      'price': instance.price,
      'currency': instance.currency,
      'billingPeriod': _$BillingPeriodEnumMap[instance.billingPeriod]!,
      'features': instance.features,
      'limitations': instance.limitations,
      'isPopular': instance.isPopular,
      'isRecommended': instance.isRecommended,
      'isActive': instance.isActive,
      'promoText': instance.promoText,
      'originalPrice': instance.originalPrice,
      'discountPercentage': instance.discountPercentage,
      'trial_days': instance.trialDays,
      'platform_product_id': instance.platformProductId,
      'google_product_id': instance.googleProductId,
      'apple_product_id': instance.appleProductId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.free: 'free',
  SubscriptionType.premium: 'premium',
  SubscriptionType.enterprise: 'enterprise',
};

const _$BillingPeriodEnumMap = {
  BillingPeriod.monthly: 'monthly',
  BillingPeriod.quarterly: 'quarterly',
  BillingPeriod.semiAnnual: 'semi_annual',
  BillingPeriod.yearly: 'yearly',
  BillingPeriod.lifetime: 'lifetime',
};

_$UserSubscriptionModelImpl _$$UserSubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSubscriptionModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      planId: json['planId'] as String,
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      startDate: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      endDate: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      trialEndsAt: json['trial_ends_at'] == null
          ? null
          : DateTime.parse(json['trial_ends_at'] as String),
      nextBillingDate: json['next_billing_date'] == null
          ? null
          : DateTime.parse(json['next_billing_date'] as String),
      lastPaymentDate: json['last_payment_date'] == null
          ? null
          : DateTime.parse(json['last_payment_date'] as String),
      autoRenew: json['auto_renew'] as bool? ?? true,
      platform: json['platform'] as String?,
      platformSubscriptionId: json['platform_subscription_id'] as String?,
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethodModel.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      plan: json['plan'] == null
          ? null
          : SubscriptionPlanModel.fromJson(
              json['plan'] as Map<String, dynamic>),
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      isActive: json['isActive'] as bool? ?? false,
      isTrial: json['isTrial'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserSubscriptionModelImplToJson(
        _$UserSubscriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'planId': instance.planId,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'started_at': instance.startDate?.toIso8601String(),
      'expires_at': instance.endDate?.toIso8601String(),
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'trial_ends_at': instance.trialEndsAt?.toIso8601String(),
      'next_billing_date': instance.nextBillingDate?.toIso8601String(),
      'last_payment_date': instance.lastPaymentDate?.toIso8601String(),
      'auto_renew': instance.autoRenew,
      'platform': instance.platform,
      'platform_subscription_id': instance.platformSubscriptionId,
      'payment_method': instance.paymentMethod,
      'plan': instance.plan,
      'payments': instance.payments,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'metadata': instance.metadata,
      'isActive': instance.isActive,
      'isTrial': instance.isTrial,
    };

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.trial: 'trial',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.expired: 'expired',
  SubscriptionStatus.paused: 'paused',
  SubscriptionStatus.pendingPayment: 'pending_payment',
};

_$FeatureModelImpl _$$FeatureModelImplFromJson(Map<String, dynamic> json) =>
    _$FeatureModelImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      isIncluded: json['isIncluded'] as bool? ?? true,
      limitation: json['limitation'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$FeatureModelImplToJson(_$FeatureModelImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'isIncluded': instance.isIncluded,
      'limitation': instance.limitation,
      'quantity': instance.quantity,
      'metadata': instance.metadata,
    };

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: json['id'] as String,
      subscriptionId: json['subscriptionId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      method: $enumDecode(_$PaymentMethodEnumMap, json['method']),
      paymentDate: DateTime.parse(json['payment_date'] as String),
      platformTransactionId: json['platform_transaction_id'] as String?,
      failureReason: json['failureReason'] as String?,
      receiptUrl: json['receiptUrl'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscriptionId': instance.subscriptionId,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'payment_date': instance.paymentDate.toIso8601String(),
      'platform_transaction_id': instance.platformTransactionId,
      'failureReason': instance.failureReason,
      'receiptUrl': instance.receiptUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.completed: 'completed',
  PaymentStatus.failed: 'failed',
  PaymentStatus.refunded: 'refunded',
  PaymentStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.creditCard: 'credit_card',
  PaymentMethod.applePay: 'apple_pay',
  PaymentMethod.googlePay: 'google_pay',
  PaymentMethod.paypal: 'paypal',
  PaymentMethod.bankTransfer: 'bank_transfer',
  PaymentMethod.other: 'other',
};

_$PaymentMethodModelImpl _$$PaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodModelImpl(
      id: json['id'] as String,
      type: $enumDecode(_$PaymentMethodEnumMap, json['type']),
      last4: json['last4'] as String?,
      brand: json['brand'] as String?,
      expiryMonth: (json['expiry_month'] as num?)?.toInt(),
      expiryYear: (json['expiry_year'] as num?)?.toInt(),
      isDefault: json['isDefault'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentMethodModelImplToJson(
        _$PaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PaymentMethodEnumMap[instance.type]!,
      'last4': instance.last4,
      'brand': instance.brand,
      'expiry_month': instance.expiryMonth,
      'expiry_year': instance.expiryYear,
      'isDefault': instance.isDefault,
      'created_at': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };
