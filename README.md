# autoAura.ahk
#########################   autoAura v1.0   ############################
##############  A simple wrapper for ASUS Aura SDK v3.1   ##############

** You have to fully install Asus ARMOURY CRATE before using this class: https://rog.asus.com/us/armoury-crate/

Usage:
	Aura := autoAura() ; Connects to service.
	Aura.show() ; Shows the available list of Aura devices.
	Aura.setLight(deviceName, lightIndex, R, G, B) ; from deviceName, one light to RGB values (Decimal 0-255)
	Aura.apply(deviceName); Apply changes and show the current light map
	Aura := "" ; disconnects and release control of the class from the SDK
	Aura.deviceNameList ; returns an array containing a list of available device names.
	Aura.deviceCount ; returns an integer containing the count of available devices
