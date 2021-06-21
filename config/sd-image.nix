{ lib, ... }: {
  imports = [
    ## Uncomment at most one of the following to select the target system:
    # ./generic-aarch64 # (note: this is the same as 'rpi3')
    ./rpi4
    #./rpi3
  ];

  # The installer starts with a "nixos" user to allow installation, so add the SSH key to
  # that user. Note that the key is, at the time of writing, put in `/etc/ssh/authorized_keys.d`
  users.extraUsers.nixos.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDU+wbNztxJSaAatNoq0BXE9ZVuGTz4r7BNO6C0mU947reXlLd50sbGzH71VwLhfM9R+4y1sH5/Il3NmdkZMaUudHUycqxLo/TzOMdWak9a1thFO1pRhVmxMTn4LLLDW/m0VeDk/UXNGmJHfjo+G5szYaJ2C+SSfnsYCSNnqHToXBIGKhjRyqKLZZ49w3V48ctM0bddXoa2WrYIVTKmOuVTppzy9z8rZdrNb7H27YRc/t0NEAesLL1YIpWi2HSojxHS+ZcwiLH56E9kLfngQ8cIhOknpI6++Z9UD+VZHy3tKG7G2gBXLi6/inG60E7udwR2Z8R8dJAtyw2uxJz0TBXr"
  ];




  # Enable OpenSSH out of the box.


  virtualisation.docker.enable = true;


  # Wireless networking (1). You might want to enable this if your Pi is not attached via Ethernet.
  #networking.wireless = {
  #  enable = true;
  #  interfaces = [ "wlan0" ];
  #  networks = {
  #    "SSID" = {
  #      psk = "password";
  #    };
  #  };
  #};

  # Wireless networking (2). Enables `wpa_supplicant` on boot.
  #systemd.services.wpa_supplicant.wantedBy = lib.mkOverride 10 [ "default.target" ];

  # NTP time sync.
  #services.timesyncd.enable = true;
}
