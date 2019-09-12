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

public enum ServiceRequestType: String {
    case diagnosis = "Diagnosis"
    case sendOfflineTransactions = "SendOfflineTransactions"
    case reconciliation = "Reconciliation"
    case reconciliationWithClosure = "ReconciliationWithClosure"
    case globalReconciliation = "GlobalReconciliation"
    case globalReconciliationWithClosure = "GlobalReconciliationWithClosure"
    case administration = "Administration"
    case login = "Login"
    case logoff = "Logoff"
    case onlineAgent = "OnlineAgent"
    case repeatLastMessage = "RepeatLastMessage"
    case getReference = "GetReference"
    case encryptionRSAPublicKey = "EncryptionRSAPublicKey"
    case acquireDevice = "AcquireDevice"
    case releaseDevice = "ReleaseDevice"
    case ruleLookup = "RuleLookup"
    case pINPadProgramLoad = "PINPadProgramLoad"
    case querySoftwareVersions = "QuerySoftwareVersions"
    case memoryReport = "MemoryReport"
}
