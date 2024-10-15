# autoAura.ahk - A Simple Wrapper for ASUS Aura SDK v3.1

This wrapper lets you control Aura-capable devices from AutoHotkey. You can set individual light colors and apply them at once. 

## Prerequisites

- **Asus ARMOURY CRATE**: Fully install it before using this class. [Download here](https://rog.asus.com/us/armoury-crate/)

## Installation

Download `autoAura.ahk` and include it in your AutoHotkey script:

```autohotkey
#include autoAura.ahk
```

## Usage:
```
Aura := autoAura()                  ; Connects to the service.
Aura.show()                         ; Shows the available list of Aura devices.
Aura.setLight(deviceName, lightIndex, R, G, B) ; Sets one light to RGB values (0-255).
Aura.apply(deviceName)              ; Apply changes and show the current light map.
Aura := ""                          ; Disconnects and releases control of the class.
Aura.deviceNameList                 ; Returns an array of available device names.
Aura.deviceCount                    ; Returns the count of available devices.
```
## Important Notes
* Single Instance: Do not instantiate autoAura more than once, as the Aura SDK accepts commands from only one interface.
* Animation: For animations, add at least a 50ms sleep between apply() commands to prevent lag.
* Device Limit: Mainboards usually limit the number of individual lights to 200. The class ignores index inputs above the acceptable number.
## Example
```
; Initialize the wrapper
Aura := autoAura()

; Display the list of devices
Aura.show()

; Set the first light of the first device to red
Aura.setLight(Aura.deviceNameList[1], 1, 255, 0, 0)

; Apply the changes
Aura.apply(Aura.deviceNameList[1])

; Release control
Aura := ""
```
## License
This project is licensed under the MIT License.
