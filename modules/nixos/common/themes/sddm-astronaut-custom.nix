{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "sddm-astronaut-custom";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "master";
    sha256 = "14c7nbp4c5z9kpk3hmlb841715v7s29apb8qcyd2fim2zimyvvkr"; # preencha depois
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
    cp -r * $out/share/sddm/themes/sddm-astronaut-theme

    # substitui o metadata.desktop pelo seu
    cp ${../../../../config/sddm/metadata.desktop} \
       $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
  '';
}
