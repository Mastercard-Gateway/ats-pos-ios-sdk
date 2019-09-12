fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios update_version_number
```
fastlane ios update_version_number
```
Updates the version number for all frameworks
### ios update_build_number
```
fastlane ios update_build_number
```
Updates the build number for all frameworks
### ios release_checklist
```
fastlane ios release_checklist
```
perform all the updates required to cut a release
### ios test
```
fastlane ios test
```
Tests all frameworks
### ios update_docs
```
fastlane ios update_docs
```
Update generated documentation

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
