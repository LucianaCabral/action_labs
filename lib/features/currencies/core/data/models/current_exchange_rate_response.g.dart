// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_exchange_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentExchangeRateResponse _$CurrentExchangeRateResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentExchangeRateResponse(
      exchangeRate: (json['exchangeRate'] as num).toInt(),
      fromSymbol: json['fromSymbol'] as String,
      toSymbol: json['toSymbol'] as String,
      lastUpdatedAt: json['lastUpdatedAt'] as String,
      rateLimitExceeded: json['rateLimitExceeded'] as bool?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$CurrentExchangeRateResponseToJson(
        CurrentExchangeRateResponse instance) =>
    <String, dynamic>{
      'exchangeRate': instance.exchangeRate,
      'fromSymbol': instance.fromSymbol,
      'toSymbol': instance.toSymbol,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'rateLimitExceeded': instance.rateLimitExceeded,
      'success': instance.success,
    };
