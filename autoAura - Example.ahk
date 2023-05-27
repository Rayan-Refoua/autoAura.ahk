; This example shows how to control and show a simple light animation of all Aura devices

; ** You have to fully install Asus ARMOURY CRATE before using this class: https://rog.asus.com/us/armoury-crate/

#Include autoAura.ahk

Aura := autoAura()

loop (Aura.deviceCount) {
	CurrentDevice := Aura.deviceNameList[A_Index]
	loop(20){ ;sets the first 20 lights of each device
		Aura.setLight(CurrentDevice, A_index, 255, 0, 0)
		Sleep(50)
		Aura.apply(CurrentDevice)
	}
}

Aura.show()

Aura := ""
