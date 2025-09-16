{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "weechat-vimode";
  version = "0.7";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/GermainZ/weechat-vimode/refs/tags/0.7/vimode.py";
    sha256 = "8fd0ca52e40be4faf91d6bcb4c99294865a8516826765eb0e3e7f2dea8e3909a";
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
    maintainers = with maintainers; [ amar-laksh ];
  };
}
