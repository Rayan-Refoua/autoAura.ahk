# autoAura.ahk - A simple wrapper for ASUS Aura SDK v3.1

This simple wrapper for ASUS Aura SDK lets you control aura-capable devices from AutoHotkey. you can set individual light colors and apply them at once.
If you plan to show an animation using this class, I highly recommend using a 50ms (or more) sleep between apply() commands to prevent laggy animation.
autoAura should not be instantiated more than once, since aura SDK only accepts commands from one interface.
The mainboard cannot know how many individual lights are available to work with, So if you try to set a non-existent light, nothing will happen. although the mainboards usually limit this number to 200. the class ignores any index input above the acceptable number of index input


** You have to fully install Asus ARMOURY CRATE before using this class: https://rog.asus.com/us/armoury-crate/

#Usage:

	Aura := autoAura() ; Connects to service.
	
	Aura.show() ; Shows the available list of Aura devices.
	
	Aura.setLight(deviceName, lightIndex, R, G, B) ; from deviceName, one light to RGB values (Decimal 0-255)
	
	Aura.apply(deviceName); Apply changes and show the current light map
	
	Aura := "" ; disconnects and release control of the class from the SDK
	
	Aura.deviceNameList ; returns an array containing a list of available device names.
	
	Aura.deviceCount ; returns an integer containing the count of available devices
	
