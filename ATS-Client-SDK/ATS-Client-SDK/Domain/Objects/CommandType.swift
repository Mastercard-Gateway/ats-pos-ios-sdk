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

public enum CommandType: String {

    case getDecimals = "GetDecimals"
    case getChar = "GetChar"
    case getMenu = "GetMenu"
    case getAmount = "GetAmount"
    case getAmountNoPrompt = "GetAmountNoPrompt"
    case getConfirmation = "GetConfirmation"
    case getAnyKey = "GetAnyKey"
    case getOptionKey = "GetOptionKey"
    case checkPIN = "CheckPIN"
    case processPIN = "ProcessPIN"
    case requestCard = "RequestCard"
    case requestTypeCard = "RequestTypeCard"
    case readCard = "ReadCard"
    case transferData = "TransferData"
    case validateMAC = "ValidateMAC"
    case calculateMAC = "CalculateMAC"
    case updateKeys = "UpdateKeys"
    case getTrack2 = "GetTrack2"
    /**
     * To explicitly address the possibility to extend the commands according to each supplier pin-pad implementation.
     * PinPad independence will be subject for future extension of the interface.
     *
     */
    case other = "Other"
}
