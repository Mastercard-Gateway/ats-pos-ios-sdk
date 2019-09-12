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

/// sourcery: xmlName = "TotalAmountType"
/// sourcery: Auto_XMLRoot, Auto_XMLSerializable, Auto_XMLParsable
public struct TotalAmountType: XMLRoot, XMLSerializable, XMLParsable {
    /// sourcery: xmlValue
    public var value: Decimal
    /// sourcery: xmlName = "Currency", xmlAttribute
    public var currency: CurrencyCode?
    /// sourcery: xmlName = "PaymentAmount", xmlAttribute
    public var paymentAmount: Decimal?
    /// sourcery: xmlName = "CashBackAmount", xmlAttribute
    public var cashBackAmount: Decimal?
    /// sourcery: xmlName = "GratuityAmount", xmlAttribute
    public var gratuityAmount: Decimal?
    /// sourcery: xmlName = "DonationAmount", xmlAttribute
    public var donationAmount: Decimal?
    /// sourcery: xmlName = "Changeable", xmlAttribute
    public var changeable: Bool?
    /// sourcery: xmlName = "OriginalAmount", xmlAttribute
    public var originalAmount: Decimal?
    /// sourcery: xmlName = "AvailableAmount", xmlAttribute
    public var availableAmount: Decimal?
    
    // sourcery:inline:auto:TotalAmountType.InitMethods
    public init(value: Decimal, currency: CurrencyCode? = nil, paymentAmount: Decimal? = nil, cashBackAmount: Decimal? = nil, gratuityAmount: Decimal? = nil, donationAmount: Decimal? = nil, changeable: Bool? = nil, originalAmount: Decimal? = nil, availableAmount: Decimal? = nil) {
        self.value = value
        self.currency = currency
        self.paymentAmount = paymentAmount
        self.cashBackAmount = cashBackAmount
        self.gratuityAmount = gratuityAmount
        self.donationAmount = donationAmount
        self.changeable = changeable
        self.originalAmount = originalAmount
        self.availableAmount = availableAmount
    }
    // sourcery:end
}
