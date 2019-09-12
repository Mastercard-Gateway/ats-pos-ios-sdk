/*
 Copyright (c) 2019 Mastercard
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation

public enum CardRequestType: String {
    case cardPayment = "CardPayment"
    case cardSwipe = "CardSwipe"
    case loyaltySwipe = "LoyaltySwipe"
    case cardPaymentLoyaltyAward = "CardPaymentLoyaltyAward"
    case loyaltyAward = "LoyaltyAward"
    case cardPreAuthorisation = "CardPreAuthorisation"
    case cardFinancialAdvice = "CardFinancialAdvice"
    case cardPreAuthorisationLoyaltySwipe = "CardPreAuthorisationLoyaltySwipe"
    case cardFinancialAdviceLoyaltyAward = "CardFinancialAdviceLoyaltyAward"
    case loyaltyRedemption = "LoyaltyRedemption"
    case cardPaymentLoyaltyRedemption = "CardPaymentLoyaltyRedemption"
    case paymentReversal = "PaymentReversal"
    case paymentLoyaltyReversal = "PaymentLoyaltyReversal"
    case paymentRefund = "PaymentRefund"
    case paymentLoyaltyRefund = "PaymentLoyaltyRefund"
    case loyaltyAwardReversal = "LoyaltyAwardReversal"
    case loyaltyRedemptionReversal = "LoyaltyRedemptionReversal"
    case loyaltyBalanceQuery = "LoyaltyBalanceQuery"
    case loyaltyLinkCard = "LoyaltyLinkCard"
    case loyaltyPointsTransfer = "LoyaltyPointsTransfer"
    case pinChange = "PINchange"
    case ticketReprint = "TicketReprint"
    case storeValueInCard = "StoreValueInCard"
    case refundValueFromCard = "RefundValueFromCard"
    case cardActivate = "CardActivate"
    case cardStop = "CardStop"
    case cardBalanceQuery = "CardBalanceQuery"
    case repeatLastMessage = "RepeatLastMessage"
    case abortRequest = "AbortRequest"
    case refundReversal = "RefundReversal"
    case preAuthReversal = "PreAuthReversal"
    case cardBarTab = "CardBarTab"
    case barTabReversal = "BarTabReversal"
    case eTUPayment = "ETUPayment"
    case eTUPaymentReversal = "ETUPaymentReversal"
    case eTURefund = "ETURefund"
    case eTURefundReversal = "ETURefundReversal"
    case cardValidation = "CardValidation"
    case cardPaymentLoyaltySwipe = "CardPaymentLoyaltySwipe"
    case etuPreAuthorisation = "ETUPreAuthorisation"
    case etuPreAuthReversal = "ETUPreAuthReversal"
    case etuFinancialAdvice = "ETUFinancialAdvice"
    case cardTokenise = "CardTokenise"
    case cardTokenize = "CardTokenize"
    case cardValidation1 = "CardValidation1"
    case cardValidation2 = "CardValidation2"
    case cardPayment2 = "CardPayment2"
    case financialAdviceRingFenceFix = "FinancialAdviceRingFenceFix"
    case cardTokenPayment = "CardTokenPayment"
    case cardTokenRefund = "CardTokenRefund"
    case cardTokenPreAuth = "CardTokenPreAuth"
    case paymentTokenPayment = "PaymentTokenPayment"
    case paymentTokenRefund = "PaymentTokenRefund"
    case paymentTokenPreAuth = "PaymentTokenPreAuth"
}
