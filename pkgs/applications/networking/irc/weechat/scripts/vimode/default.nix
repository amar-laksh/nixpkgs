{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "weechat-vimode";
  version = "0.7";

  src = fetchurl {
    url = "https://github.com/GermainZ/weechat-vimode/blob/192eb3ef0fa2166e1d35a163434b9e446226a4fa/vimode.py";
    sha256 = "1zap011l3wlxd61j9xyqamzb85srvvwy7qg5sjsrp8sa77snl0r8";
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
