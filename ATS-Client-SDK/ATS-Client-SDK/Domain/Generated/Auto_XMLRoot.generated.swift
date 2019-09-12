// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


extension ATSError {
    static var RootElementName: String { return "ATSErrorType" }
}
extension ATSErrorDetail {
    static var RootElementName: String { return "ATSErrorDetailType" }
}
extension ATSResponse {
    static var RootElementName: String { return "ATSResponseType" }
}
extension CardServiceRequest {
    static var RootElementName: String { return "CardServiceRequest" }
}
extension CardServiceRequest.Acquirer {
    static var RootElementName: String { return "Acquirer" }
}
extension CardServiceRequest.CardCircuitCollection {
    static var RootElementName: String { return "CardCircuitCollection" }
}
extension CardServiceRequest.CardCircuitCollection.CardCircuit {
    static var RootElementName: String { return "CardCircuit" }
}
extension CardServiceRequest.Loyalty {
    static var RootElementName: String { return "Loyalty" }
}
extension CardServiceRequest.Loyalty.MOPrule {
    static var RootElementName: String { return "MOPrule" }
}
extension CardServiceRequest.OriginalTransaction {
    static var RootElementName: String { return "OriginalTransaction" }
}
extension CardServiceRequest.POSData {
    static var RootElementName: String { return "POSData" }
}
extension CardServiceResponse {
    static var RootElementName: String { return "CardServiceResponse" }
}
extension CardServiceResponse.Loyalty {
    static var RootElementName: String { return "Loyalty" }
}
extension CardServiceResponse.Loyalty.LoyaltyAmount {
    static var RootElementName: String { return "LoyaltyAmount" }
}
extension CardServiceResponse.Loyalty.LoyaltyApprovalCode {
    static var RootElementName: String { return "LoyaltyApprovalCode" }
}
extension CardServiceResponse.OriginalHeader {
    static var RootElementName: String { return "OriginalHeader" }
}
extension CardServiceResponse.Tender {
    static var RootElementName: String { return "Tender" }
}
extension CardServiceResponse.Tender.Authorisation {
    static var RootElementName: String { return "Authorisation" }
}
extension CardServiceResponse.Terminal {
    static var RootElementName: String { return "Terminal" }
}
extension CardTrack {
    static var RootElementName: String { return "CardTrack" }
}
extension CardValueDRType {
    static var RootElementName: String { return "CardValueDRType" }
}
extension CardValueDRType.CADLuhn {
    static var RootElementName: String { return "CADLuhn" }
}
extension CardValueDRType.Features {
    static var RootElementName: String { return "Features" }
}
extension CardValueICCType {
    static var RootElementName: String { return "CardValueICCType" }
}
extension CardValueType {
    static var RootElementName: String { return "CardValueType" }
}
extension DeviceRequest {
    static var RootElementName: String { return "DeviceRequest" }
}
extension DeviceRequest.Event {
    static var RootElementName: String { return "Event" }
}
extension DeviceRequest.Event.EventData {
    static var RootElementName: String { return "EventData" }
}
extension DeviceRequest.Event.EventData.ProductsAllowed {
    static var RootElementName: String { return "ProductsAllowed" }
}
extension DeviceRequest.Event.EventData.ProductsAllowed.ProductCode {
    static var RootElementName: String { return "ProductCode" }
}
extension DeviceRequest.Input {
    static var RootElementName: String { return "Input" }
}
extension DeviceRequest.Input.Command {
    static var RootElementName: String { return "Command" }
}
extension DeviceRequest.Output {
    static var RootElementName: String { return "Output" }
}
extension DeviceRequest.Output.Buzzer {
    static var RootElementName: String { return "Buzzer" }
}
extension DeviceRequest.Output.TextLine {
    static var RootElementName: String { return "TextLine" }
}
extension DeviceResponse {
    static var RootElementName: String { return "DeviceResponse" }
}
extension DeviceResponse.EventResult {
    static var RootElementName: String { return "EventResult" }
}
extension DeviceResponse.EventResult.Acquirer {
    static var RootElementName: String { return "Acquirer" }
}
extension DeviceResponse.EventResult.AuthResponse {
    static var RootElementName: String { return "AuthResponse" }
}
extension DeviceResponse.EventResult.OACentreDetails {
    static var RootElementName: String { return "OACentreDetails" }
}
extension DeviceResponse.EventResult.TransactionLimits {
    static var RootElementName: String { return "TransactionLimits" }
}
extension DeviceResponse.Input {
    static var RootElementName: String { return "Input" }
}
extension DeviceResponse.Output {
    static var RootElementName: String { return "Output" }
}
extension E2EEValues {
    static var RootElementName: String { return "E2EEValues" }
}
extension EncryptedCardValueType {
    static var RootElementName: String { return "EncryptedCardValueType" }
}
extension ICCType {
    static var RootElementName: String { return "ICCType" }
}
extension InputValueType {
    static var RootElementName: String { return "InputValueType" }
}
extension MACType {
    static var RootElementName: String { return "MACType" }
}
extension P2PEValues {
    static var RootElementName: String { return "P2PEValues" }
}
extension SaleItemType {
    static var RootElementName: String { return "SaleItemType" }
}
extension SecureDataFlow {
    static var RootElementName: String { return "SecureDataFlow" }
}
extension ServiceRequest {
    static var RootElementName: String { return "ServiceRequest" }
}
extension ServiceRequest.PINPadProgramLoad {
    static var RootElementName: String { return "PINPadProgramLoad" }
}
extension ServiceRequest.POSData {
    static var RootElementName: String { return "POSData" }
}
extension ServiceRequest.TotalAmount {
    static var RootElementName: String { return "TotalAmount" }
}
extension ServiceResponse {
    static var RootElementName: String { return "ServiceResponse" }
}
extension ServiceResponse.Authorisation {
    static var RootElementName: String { return "Authorisation" }
}
extension ServiceResponse.OriginalHeader {
    static var RootElementName: String { return "OriginalHeader" }
}
extension ServiceResponse.Reconciliation {
    static var RootElementName: String { return "Reconciliation" }
}
extension ServiceResponse.Reconciliation.TotalAmount {
    static var RootElementName: String { return "TotalAmount" }
}
extension ServiceResponse.Submission {
    static var RootElementName: String { return "Submission" }
}
extension ServiceResponse.Submission.Failed {
    static var RootElementName: String { return "Failed" }
}
extension ServiceResponse.Submission.Successful {
    static var RootElementName: String { return "Successful" }
}
extension ServiceResponse.Terminal {
    static var RootElementName: String { return "Terminal" }
}
extension ServiceResponse.Versions {
    static var RootElementName: String { return "Versions" }
}
extension ServiceResponse.Versions.Devices {
    static var RootElementName: String { return "Devices" }
}
extension ServiceResponse.Versions.Devices.Device {
    static var RootElementName: String { return "Device" }
}
extension TotalAmountType {
    static var RootElementName: String { return "TotalAmountType" }
}
