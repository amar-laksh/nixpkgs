{ lib, stdenv, fetchFromGitHub, glib, gettext, gnumake, gnome, bash, zip, unzip }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-window-thumbnails";
  version = "48.0";

  src = fetchFromGitHub {
    owner = "G-dH";
    repo = "window-thumbnails";
    rev = "80227ddac52f9cb9418849a760acd22387f6c323";
    sha256 = "17ywrygz94imnbb45fnlxmp6x3nqmvakpizkscdmsyp2l7na8f7i";
  };

  nativeBuildInputs = [ glib gettext gnome.gnome-shell gnumake bash zip unzip ];

  passthru = {
    extensionUuid = "window-thumbnails@G-dH.github.com";
    extensionPortalSlug = "window-thumbnails";
  };

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions
    make SHELL=${stdenv.shell} zip
    unzip window-thumbnails@G-dH.github.com.zip -d $out/share/gnome-shell/extensions/window-thumbnails@G-dH.github.com/
  '';

  meta = with lib; {
    description = "A GNOME Shell extension that allows the creation of scaled-down window clones for use as Picture-in-Picture (PIP) thumbnails.";
    longDescription = ''A GNOME Shell extension that allows the creation of scaled-down window clones for use as Picture-in-Picture (PIP) thumbnails.
      WTMB is supported by the V-Shell, AATWS and CHC-E extensions which allows you to create window thumbnails using their controls.
    '';
    license = licenses.gpl3;
    maintainers = with maintainers; [ G-dH ];
    platforms = gnome.gnome-shell.meta.platforms;
    homepage = "https://github.com/G-dH/window-thumbnails";
    broken = lib.versionAtLeast gnome.gnome-shell.version "45.0"; # Doesn't support 3.34
  };
}
