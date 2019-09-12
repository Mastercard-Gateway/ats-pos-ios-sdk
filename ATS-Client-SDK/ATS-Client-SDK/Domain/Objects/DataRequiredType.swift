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

public enum DataRequiredType: String {
    case track2 = "Track2"
    case pan = "PAN"
    case expiryDate = "ExpiryDate"
    case startDate = "StartDate"
    case issueNumber = "IssueNumber"
    case signature = "Signature"
    case cashback = "Cashback"
    case splitPayment = "SplitPayment"
    case gratuity = "Gratuity"
    case donation = "Donation"
    case amount = "Amount"
    case products = "Products"
    case mileage = "Mileage"
    case registration = "Registration"
    case id = "Id"
    case supplementary = "Supplementary"
    case authCode = "AuthCode"
    case cv2 = "CV2"
    case postCode = "PostCode"
    case address = "Address"
    case failureAcknowledgement = "FailureAcknowledgement"
    case etuProvider = "ETUProvider"
    case etuPlan = "ETUPlan"
    case etuAmount = "ETUAmount"
    case dataNotChecked = "DataNotChecked"
    case allMatch = "AllMatch"
    case securityCodeMatchOnly = "SecurityCodeMatchOnly"
    case addressMatchOnly = "AddressMatchOnly"
    case noDataMatches = "NoDataMatches"
    case fallbackPKE = "FallbackPKE"
    case printDone = "PrintDone"
    case printRetry = "PrintRetry"
    case dccQuery = "DCCQuery"
    case dccConfirm = "DCCConfirm"
    case transaction = "Transaction"
    case password = "Password"
}
