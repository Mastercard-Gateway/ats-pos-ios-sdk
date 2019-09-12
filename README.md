# ATS POS iOS SDK

The iOS SDK by Mastercard Payment Gateway Services allows you to integrate ATS-driven payments into your iOS app. It provides a few components that can be used to communicate with ATS, expose bluetooth-connected card readers to the network, and collect log information for diagnostics reporting.

For complete documentation on all of these components, consult the wiki.

## Requirements
  - Swift 4.2 or higher

## Installation

The iOS SDK can be manually included in your project by downloading or cloning the SDK project and adding it as a subproject in your project.  


If you would like to use [Carthage]( https://github.com/Carthage/Carthage) to integrate the sdk into your project, you can do so with the following line in your cartfile.

```
github "Mastercard-Gateway/ats-pos-ios-sdk"
```

## Usage

## Import the SDK
Import the ATS SDK components into your project. What you import will be specific to each use case.

```swift
import ATS_Common
import ATS_Client_SDK
import ATS_Device_SDK
```

## Initialialize the ATS Client SDK

The `ATS Client SDK` is a communication client for sending messages to/from an ATS server

In order to use the `ATS Client SDK` you need to initialize it with a suitable configuration. This allows you to connect to ATS over a persistent socket connection and send/receive messages.

```swift
let ats = ATSClient()

let host = "1.1.1.1"
let port = 20002

atsClient.connect(ip: host, port: port)

```

## Initialialize the ATS Device SDK

The `ATS Device SDK` is a communication client for sending messages to/from an Bluetooth PED. When both `ATS Client SDK` and `ATS Device SDK` are initilized the `ATS Device SDK` acts as a proxy between ATS and bluetooth-connected PEDs.

The `ATS Device SDK` should be initilized with a configurations for a paired bluetooth PED.

```swift

let device = "Miura Device"
let protocol = "com.miura"
let port = 1234
let mode = ATSBluetoothAdapter.Mode.static(port: port)

var adapter = ATSBluetoothAdapter()

adapter.start(deviceNamed: device, usingProtocol: protocol, mode: mode)
```

## Diagnostics

The ATS SDK includes a diagnostic utility that can help troubleshoot any issues that you might encounter during a transaction. initialize the diagnostic utility to gather logs during the transaction lifecycle.

```swift
ATSDiagnostics.startLogCapture()
```
To retrieve the log after some activity:
```swift
let log = ATSDiagnostics.getLog()
```
To stop capturing log data, you can clean it up like this:
```swift
ATSDiagnostics.clearLog()
ATSDiagnostics.stopLogCapture()
```

## Starting a Transaction
Once you have initilized an instance of `ATS Client`, you can then construct a `CardServiceRequest` containing the transaction information and send that to the ATS server to start a transaction.

```swift
var posData = CardServiceRequest.POSData(posTimeStamp: Date())
posData.transactionNumber = transactionNumber
posData.reference = reference

// create the CardServiceRequest and populate the optional fields that we need for this transaction.
var request = CardServiceRequest(posData: posData, requestType: requestType, workstationID: workstation, requestID: requestID)
request.popID = popId
request.totalAmount = TotalAmountType(value: amount)
request.totalAmount?.paymentAmount = amount
request.applicationSender = "ATSSampleApp"

// send the CardServiceRequest
atsClient.send(request)
```

---

## Sample App
This project includes a sample app to demonstrate SDK usage. To run the sample app you will need to ensure you have a suitable ATS Server instance configured and started to accept transactions.
