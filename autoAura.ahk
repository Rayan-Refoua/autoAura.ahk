;#########################   autoAura v1.0   ############################
;##############  A simple wrapper for ASUS Aura SDK v3.1   ##############

; ** You have to fully install Asus ARMOURY CRATE before using this class: https://rog.asus.com/us/armoury-crate/

/* Usage:
	Aura := autoAura() ; Connects to service.
	Aura.show() ; Shows the available list of Aura devices.
	Aura.setLight(deviceName, lightIndex, R, G, B) ; from deviceName, one light to RGB values (Decimal 0-255)
	Aura.apply(deviceName); Apply changes and show the current light map
	Aura := "" ; disconnects and release control of the class from the SDK
	Aura.deviceNameList ; returns an array containing a list of available device names.
	Aura.deviceCount ; returns an integer containing the count of available devices
*/
class autoAura {
	static devices := "", sdk := {}, deviceCount := 0, deviceNameList := []
	static autoAura_class_have_been_once_created := 0
	__New() {
		if (IsSet(autoAura_class_have_been_once_created)) { ;checks for previous instantiation of the class
			throw ValueError("autoAura should not be instantiated more than once.")
		}
		global autoAura_class_have_been_once_created := true ;sets a global variable to prevent future instantiations
		this.sdk := ComObject("aura.sdk.1") ; connects to aura SDK service
		this.sdk.SwitchMode() ; Takes Control of all lighting
		this.devices := this.sdk.Enumerate(0) ; loads all Aura capable devices.
		this.deviceCount := this.devices.count ; sets the current device count
		if (this.deviceCount <= 0) {
			throw ValueError("No Aura capable device found.")
		}
		this.devicelist := Map()
		this.deviceNameList := []
		loop (this.deviceCount) {
			Holder := Map()
			dev := this.devices.Item[A_index - 1]
			Holder["dev"] := dev
			this.deviceNameList.push(dev.Name)
			Holder["devname"] := dev.Name
			Holder["devType"] := dev.Type
			Lights := dev.Lights
			Holder["Lights"] := Lights
			Holder["Lightscount"] := Lights.count
			this.devicelist[dev.Name] := Holder
		}

		return this

	}

	setLight(deviceName, lightIndex, R, G, B) {
		if (this.devicelist[deviceName]["Lightscount"] >= lightIndex) {
			dev := this.devicelist[deviceName]["dev"]
			lights := dev.Lights
			light := lights.item[lightIndex - 1]
			light.color := Integer(format("0x00{1:02x}{2:02x}{3:02x}", R, G, B)) ;Converts the R,G,B values to Hex and adds 2 reserved empty bytes to the beginning
		}
	}
	apply(deviceName) {
		this.devicelist[deviceName]["dev"].Apply()
	}

	show() {
		list := "Available list of Aura Devices:"
		loop (this.deviceNameList.Length) {
			list .= "`n" . this.deviceNameList[A_index]
		}
		A_Clipboard := list
		list .= "`n`n" . "Copied to clipboard!"
		MsgBox(list)
	}
	__Delete() {
		this.sdk.ReleaseControl(0) ; graceful exit and release the control of the class
	}
}
