{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "weechat-vimode";
  version = "0.7";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/GermainZ/weechat-vimode/192eb3ef0fa2166e1d35a163434b9e446226a4fa/vimode.py";
    sha256 = "1ypn5hkz9n7qjmk22h86lz8sikf7a4wql08cc0540a5lwd4m2qgz";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share
    cp $src $out/share/vimode.py
  '';

  passthru = {
    scripts = [ "vimode.py" ];
  };

  meta = with lib; {
    description = "Add vi/vim-like modes and keybindings to WeeChat.";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ qyliss ];
  };
}
