import gi
import subprocess

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk



class WifiToggleApp(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="WiFi Toggle Switch")

        # Create a toggle switch (Gtk.Switch)
        self.switch = Gtk.Switch()
        self.switch.connect("state-set", self.on_switch_state_set)

        # Set the window properties
        self.set_border_width(10)
        self.set_default_size(200, 100)

        # Create a vertical box to pack the switch
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        box.pack_start(self.switch, True, True, 0)

        self.add(box)

    def on_switch_state_set(self, widget, state):
        """ This function will be called when the switch is toggled. """
        if state:  # WiFi on
            self.toggle_wifi(True)
        else:  # WiFi off
            self.toggle_wifi(False)

    def toggle_wifi(self, enable):
        """ Enable or disable WiFi using nmcli command. """
        try:
            if enable:
                # Turn WiFi ON
                subprocess.run(["nmcli", "radio", "wifi", "on"], check=True)
                print("WiFi enabled")
            else:
                # Turn WiFi OFF
                subprocess.run(["nmcli", "radio", "wifi", "off"], check=True)
                print("WiFi disabled")
        except subprocess.CalledProcessError as e:
            print(f"Error toggling WiFi: {e}")

if __name__ == "__main__":
    app = WifiToggleApp()
    app.connect("destroy", Gtk.main_quit)
    app.show_all()
    Gtk.main()
