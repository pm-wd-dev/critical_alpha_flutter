import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
class SubscriptionPlanModel with _$SubscriptionPlanModel {
  const factory SubscriptionPlanModel({
    required String id,
    required String name,
    required String description,
    @Default(SubscriptionType.premium) SubscriptionType type,
    required double price,
    required String currency,
    required BillingPeriod billingPeriod,
    @Default([]) List<FeatureModel> features,
    List<String>? limitations,
    @Default(false) bool isPopular,
    @Default(false) bool isRecommended,
    @Default(true) bool isActive,
    String? promoText,
    double? originalPrice,
    int? discountPercentage,
    @JsonKey(name: 'trial_days') int? trialDays,
    @JsonKey(name: 'platform_product_id') String? platformProductId,
    @JsonKey(name: 'google_product_id') String? googleProductId,
    @JsonKey(name: 'apple_product_id') String? appleProductId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) = _SubscriptionPlanModel;

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPlanModelFromJson(json);

  const SubscriptionPlanModel._();

  /// Whether this is a free plan
  bool get isFree => type == SubscriptionType.free;

  /// Whether this is a premium plan
  bool get isPremium => type == SubscriptionType.premium;

  /// Whether this is a lifetime plan
  bool get isLifetime => billingPeriod == BillingPeriod.lifetime;

  /// Whether this plan has a trial period
  bool get hasTrial => trialDays != null && trialDays! > 0;

  /// Whether this plan has a discount
  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  /// Monthly price (normalized for comparison)
  double get monthlyPrice {
    switch (billingPeriod) {
      case BillingPeriod.monthly:
        return price;
      case BillingPeriod.quarterly:
        return price / 3;
      case BillingPeriod.semiAnnual:
        return price / 6;
      case BillingPeriod.yearly:
        return price / 12;
      case BillingPeriod.lifetime:
        return 0.0; // Lifetime has no recurring cost
    }
  }

  /// Yearly price (normalized for comparison)
  double get yearlyPrice {
    switch (billingPeriod) {
      case BillingPeriod.monthly:
        return price * 12;
      case BillingPeriod.quarterly:
        return price * 4;
      case BillingPeriod.semiAnnual:
        return price * 2;
      case BillingPeriod.yearly:
        return price;
      case BillingPeriod.lifetime:
        return price; // One-time payment
    }
  }

  /// Formatted price string
  String get formattedPrice {
    final formatter = currency == 'USD' ? r'$' : currency;
    if (price == 0) return 'Free';

    final priceStr = price == price.round()
        ? price.round().toString()
        : price.toStringAsFixed(2);

    return '$formatter$priceStr';
  }

  /// Formatted price with billing period
  String get formattedPriceWithPeriod {
    if (isFree) return 'Free';

    final priceStr = formattedPrice;
    switch (billingPeriod) {
      case BillingPeriod.monthly:
        return '$priceStr/month';
      case BillingPeriod.quarterly:
        return '$priceStr/quarter';
      case BillingPeriod.semiAnnual:
        return '$priceStr/6 months';
      case BillingPeriod.yearly:
        return '$priceStr/year';
      case BillingPeriod.lifetime:
        return '$priceStr lifetime';
    }
  }

  /// Formatted original price (if discounted)
  String? get formattedOriginalPrice {
    if (!hasDiscount) return null;
    final formatter = currency == 'USD' ? r'$' : currency;
    final priceStr = originalPrice! == originalPrice!.round()
        ? originalPrice!.round().toString()
        : originalPrice!.toStringAsFixed(2);
    return '$formatter$priceStr';
  }

  /// Calculated discount percentage
  int get calculatedDiscountPercentage {
    if (discountPercentage != null) return discountPercentage!;
    if (!hasDiscount) return 0;
    return ((originalPrice! - price) / originalPrice! * 100).round();
  }

  /// Savings amount
  double get savingsAmount => hasDiscount ? originalPrice! - price : 0.0;

  /// Formatted savings
  String get formattedSavings {
    if (!hasDiscount) return '';
    final formatter = currency == 'USD' ? r'$' : currency;
    final savingsStr = savingsAmount == savingsAmount.round()
        ? savingsAmount.round().toString()
        : savingsAmount.toStringAsFixed(2);
    return 'Save $formatter$savingsStr';
  }

  /// Billing period in months
  int get billingPeriodInMonths {
    switch (billingPeriod) {
      case BillingPeriod.monthly:
        return 1;
      case BillingPeriod.quarterly:
        return 3;
      case BillingPeriod.semiAnnual:
        return 6;
      case BillingPeriod.yearly:
        return 12;
      case BillingPeriod.lifetime:
        return 0; // Lifetime
    }
  }

  /// Display name for billing period
  String get billingPeriodName {
    switch (billingPeriod) {
      case BillingPeriod.monthly:
        return 'Monthly';
      case BillingPeriod.quarterly:
        return 'Quarterly';
      case BillingPeriod.semiAnnual:
        return 'Semi-Annual';
      case BillingPeriod.yearly:
        return 'Yearly';
      case BillingPeriod.lifetime:
        return 'Lifetime';
    }
  }

  /// Feature count
  int get featureCount => features?.length ?? 0;

  /// Whether plan includes specific feature
  bool hasFeature(String featureKey) {
    return features?.any((feature) => feature.key == featureKey) ?? false;
  }

  /// Get feature by key
  FeatureModel? getFeature(String featureKey) {
    return features?.firstWhere((feature) => feature.key == featureKey);
  }

  /// Best value indicator based on yearly savings
  bool get isBestValue {
    if (billingPeriod != BillingPeriod.yearly) return false;
    return hasDiscount && calculatedDiscountPercentage >= 20;
  }
}

@freezed
class UserSubscriptionModel with _$UserSubscriptionModel {
  const factory UserSubscriptionModel({
    required String id,
    required String userId,
    required String planId,
    required SubscriptionStatus status,
    @JsonKey(name: 'started_at') DateTime? startDate,
    @JsonKey(name: 'expires_at') DateTime? endDate,
    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
    @JsonKey(name: 'trial_ends_at') DateTime? trialEndsAt,
    @JsonKey(name: 'next_billing_date') DateTime? nextBillingDate,
    @JsonKey(name: 'last_payment_date') DateTime? lastPaymentDate,
    @JsonKey(name: 'auto_renew') @Default(true) bool autoRenew,
    @JsonKey(name: 'platform') String? platform,
    @JsonKey(name: 'platform_subscription_id') String? platformSubscriptionId,
    @JsonKey(name: 'payment_method') PaymentMethodModel? paymentMethod,
    SubscriptionPlanModel? plan,
    List<PaymentModel>? payments,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    Map<String, dynamic>? metadata,
    @Default(false) bool isActive,
    @Default(false) bool isTrial,
  }) = _UserSubscriptionModel;

  factory UserSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionModelFromJson(json);

  const UserSubscriptionModel._();

  /// Whether subscription is active
  bool get isActive => status == SubscriptionStatus.active;

  /// Whether subscription is cancelled
  bool get isCancelled => status == SubscriptionStatus.cancelled;

  /// Whether subscription is expired
  bool get isExpired => status == SubscriptionStatus.expired;

  /// Whether subscription is in trial period
  bool get isTrial => status == SubscriptionStatus.trial;

  /// Whether subscription is paused/on hold
  bool get isPaused => status == SubscriptionStatus.paused;

  /// Whether subscription will auto-renew
  bool get willAutoRenew => autoRenew && (isActive || isTrial);

  /// Whether subscription is currently in trial period
  bool get isInTrialPeriod {
    if (trialEndsAt == null) return false;
    return DateTime.now().isBefore(trialEndsAt!) && (isTrial || isActive);
  }

  /// Whether trial has ended
  bool get hasTrialEnded {
    if (trialEndsAt == null) return false;
    return DateTime.now().isAfter(trialEndsAt!);
  }

  /// Whether subscription is expiring soon (within 7 days)
  bool get isExpiringSoon {
    if (endDate == null) return false;
    final daysUntilExpiry = endDate!.difference(DateTime.now()).inDays;
    return daysUntilExpiry <= 7 && daysUntilExpiry >= 0;
  }

  /// Whether subscription has expired
  bool get hasExpired {
    if (endDate == null) return false;
    return DateTime.now().isAfter(endDate!);
  }

  /// Days until expiry
  int? get daysUntilExpiry {
    if (endDate == null) return null;
    final days = endDate!.difference(DateTime.now()).inDays;
    return days >= 0 ? days : 0;
  }

  /// Days remaining in trial
  int? get daysRemainingInTrial {
    if (trialEndsAt == null || hasTrialEnded) return null;
    return trialEndsAt!.difference(DateTime.now()).inDays;
  }

  /// Subscription duration so far
  Duration get duration => startDate != null ? DateTime.now().difference(startDate!) : Duration.zero;

  /// Days since subscription started
  int get daysSinceStart => duration.inDays;

  /// Whether subscription was cancelled but still active
  bool get isCancelledButActive => cancelledAt != null && isActive;

  /// Next billing amount
  double? get nextBillingAmount => plan?.price;

  /// Formatted next billing date
  String? get formattedNextBillingDate {
    if (nextBillingDate == null) return null;
    return '${nextBillingDate!.day}/${nextBillingDate!.month}/${nextBillingDate!.year}';
  }

  /// Formatted expiry date
  String? get formattedExpiryDate {
    if (endDate == null) return null;
    return '${endDate!.day}/${endDate!.month}/${endDate!.year}';
  }

  /// Status display text
  String get statusText {
    switch (status) {
      case SubscriptionStatus.active:
        if (isInTrialPeriod) return 'Trial Active';
        return 'Active';
      case SubscriptionStatus.trial:
        return 'Trial';
      case SubscriptionStatus.cancelled:
        return 'Cancelled';
      case SubscriptionStatus.expired:
        return 'Expired';
      case SubscriptionStatus.paused:
        return 'Paused';
      case SubscriptionStatus.pendingPayment:
        return 'Payment Pending';
    }
  }

  /// Status color for UI
  String get statusColor {
    switch (status) {
      case SubscriptionStatus.active:
      case SubscriptionStatus.trial:
        return '#10B981'; // Green
      case SubscriptionStatus.cancelled:
      case SubscriptionStatus.expired:
        return '#EF4444'; // Red
      case SubscriptionStatus.paused:
      case SubscriptionStatus.pendingPayment:
        return '#F59E0B'; // Orange
    }
  }

  /// Total amount paid
  double get totalPaid {
    if (payments == null) return 0.0;
    return payments!
        .where((payment) => payment.status == PaymentStatus.completed)
        .fold(0.0, (sum, payment) => sum + payment.amount);
  }

  /// Last payment amount
  double? get lastPaymentAmount {
    if (payments == null || payments!.isEmpty) return null;
    final completedPayments = payments!
        .where((payment) => payment.status == PaymentStatus.completed)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return completedPayments.isEmpty ? null : completedPayments.first.amount;
  }

  /// Whether payment is overdue
  bool get isPaymentOverdue => status == SubscriptionStatus.pendingPayment;
}

@freezed
class FeatureModel with _$FeatureModel {
  const factory FeatureModel({
    required String key,
    required String name,
    String? description,
    String? icon,
    @Default(true) bool isIncluded,
    String? limitation,
    int? quantity,
    Map<String, dynamic>? metadata,
  }) = _FeatureModel;

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  const FeatureModel._();

  /// Display text for the feature
  String get displayText {
    if (!isIncluded) return 'Not included';
    if (limitation != null) return limitation!;
    if (quantity != null) {
      if (quantity == -1) return 'Unlimited $name';
      return '$quantity $name';
    }
    return name;
  }

  /// Whether this is an unlimited feature
  bool get isUnlimited => quantity == -1;

  /// Whether this feature has a quantity limit
  bool get hasQuantityLimit => quantity != null && quantity! > 0;
}

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    required String subscriptionId,
    required double amount,
    required String currency,
    required PaymentStatus status,
    required PaymentMethod method,
    @JsonKey(name: 'payment_date') required DateTime paymentDate,
    @JsonKey(name: 'platform_transaction_id') String? platformTransactionId,
    String? failureReason,
    String? receiptUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    Map<String, dynamic>? metadata,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  const PaymentModel._();

  /// Whether payment was successful
  bool get isCompleted => status == PaymentStatus.completed;

  /// Whether payment failed
  bool get isFailed => status == PaymentStatus.failed;

  /// Whether payment is pending
  bool get isPending => status == PaymentStatus.pending;

  /// Whether payment was refunded
  bool get isRefunded => status == PaymentStatus.refunded;

  /// Formatted amount
  String get formattedAmount {
    final formatter = currency == 'USD' ? r'$' : currency;
    final amountStr = amount == amount.round()
        ? amount.round().toString()
        : amount.toStringAsFixed(2);
    return '$formatter$amountStr';
  }

  /// Formatted payment date
  String get formattedPaymentDate {
    return '${paymentDate.day}/${paymentDate.month}/${paymentDate.year}';
  }

  /// Payment method display name
  String get methodDisplayName {
    switch (method) {
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.applePay:
        return 'Apple Pay';
      case PaymentMethod.googlePay:
        return 'Google Pay';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.other:
        return 'Other';
    }
  }
}

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    required String id,
    required PaymentMethod type,
    String? last4,
    String? brand,
    @JsonKey(name: 'expiry_month') int? expiryMonth,
    @JsonKey(name: 'expiry_year') int? expiryYear,
    @Default(true) bool isDefault,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    Map<String, dynamic>? metadata,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);

  const PaymentMethodModel._();

  /// Display name for the payment method
  String get displayName {
    switch (type) {
      case PaymentMethod.creditCard:
        if (brand != null && last4 != null) {
          return '$brand •••• $last4';
        }
        return 'Credit Card';
      case PaymentMethod.applePay:
        return 'Apple Pay';
      case PaymentMethod.googlePay:
        return 'Google Pay';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.other:
        return 'Payment Method';
    }
  }

  /// Whether the payment method is expired
  bool get isExpired {
    if (expiryMonth == null || expiryYear == null) return false;
    final now = DateTime.now();
    return expiryYear! < now.year ||
           (expiryYear! == now.year && expiryMonth! < now.month);
  }

  /// Whether the payment method expires soon (within 3 months)
  bool get expiresSoon {
    if (expiryMonth == null || expiryYear == null) return false;
    final now = DateTime.now();
    final expiryDate = DateTime(expiryYear!, expiryMonth!);
    final monthsUntilExpiry = expiryDate.difference(now).inDays ~/ 30;
    return monthsUntilExpiry <= 3 && monthsUntilExpiry >= 0;
  }

  /// Formatted expiry date
  String? get formattedExpiry {
    if (expiryMonth == null || expiryYear == null) return null;
    return '${expiryMonth!.toString().padLeft(2, '0')}/${expiryYear!}';
  }
}

// Enums
enum SubscriptionType {
  @JsonValue('free')
  free,
  @JsonValue('premium')
  premium,
  @JsonValue('enterprise')
  enterprise,
}

enum BillingPeriod {
  @JsonValue('monthly')
  monthly,
  @JsonValue('quarterly')
  quarterly,
  @JsonValue('semi_annual')
  semiAnnual,
  @JsonValue('yearly')
  yearly,
  @JsonValue('lifetime')
  lifetime,
}

enum SubscriptionStatus {
  @JsonValue('active')
  active,
  @JsonValue('trial')
  trial,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('expired')
  expired,
  @JsonValue('paused')
  paused,
  @JsonValue('pending_payment')
  pendingPayment,
}

enum PaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('refunded')
  refunded,
  @JsonValue('cancelled')
  cancelled,
}

enum PaymentMethod {
  @JsonValue('credit_card')
  creditCard,
  @JsonValue('apple_pay')
  applePay,
  @JsonValue('google_pay')
  googlePay,
  @JsonValue('paypal')
  paypal,
  @JsonValue('bank_transfer')
  bankTransfer,
  @JsonValue('other')
  other,
}

// Extensions
extension SubscriptionPlanListExtensions on List<SubscriptionPlanModel> {
  /// Get active plans only
  List<SubscriptionPlanModel> get active =>
      where((plan) => plan.isActive).toList();

  /// Get free plans
  List<SubscriptionPlanModel> get free =>
      where((plan) => plan.isFree).toList();

  /// Get premium plans
  List<SubscriptionPlanModel> get premium =>
      where((plan) => plan.isPremium).toList();

  /// Get plans by billing period
  List<SubscriptionPlanModel> byBillingPeriod(BillingPeriod period) =>
      where((plan) => plan.billingPeriod == period).toList();

  /// Get popular plans
  List<SubscriptionPlanModel> get popular =>
      where((plan) => plan.isPopular).toList();

  /// Get recommended plans
  List<SubscriptionPlanModel> get recommended =>
      where((plan) => plan.isRecommended).toList();

  /// Get plans with trial
  List<SubscriptionPlanModel> get withTrial =>
      where((plan) => plan.hasTrial).toList();

  /// Get discounted plans
  List<SubscriptionPlanModel> get discounted =>
      where((plan) => plan.hasDiscount).toList();

  /// Sort by price (ascending)
  List<SubscriptionPlanModel> get sortedByPrice {
    final list = List<SubscriptionPlanModel>.from(this);
    list.sort((a, b) => a.monthlyPrice.compareTo(b.monthlyPrice));
    return list;
  }

  /// Sort by value (best value first)
  List<SubscriptionPlanModel> get sortedByValue {
    final list = List<SubscriptionPlanModel>.from(this);
    list.sort((a, b) {
      // Prioritize best value plans
      if (a.isBestValue && !b.isBestValue) return -1;
      if (!a.isBestValue && b.isBestValue) return 1;

      // Then by discount percentage
      return b.calculatedDiscountPercentage.compareTo(a.calculatedDiscountPercentage);
    });
    return list;
  }

  /// Get cheapest plan
  SubscriptionPlanModel? get cheapest {
    if (isEmpty) return null;
    return reduce((a, b) => a.monthlyPrice < b.monthlyPrice ? a : b);
  }

  /// Get most expensive plan
  SubscriptionPlanModel? get mostExpensive {
    if (isEmpty) return null;
    return reduce((a, b) => a.monthlyPrice > b.monthlyPrice ? a : b);
  }
}