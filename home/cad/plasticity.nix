{ pkgs, ... }:

let
  plasticityRunScript = pkgs.writeScriptBin "runPlasticity" ''
    #! ${pkgs.bash}/bin/bash
    export GDK_DPI_SCALE 1
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    ${pkgs.plasticity}/bin/Plasticity --use-gl=egl %U
  '';
  plasticityDesktopItem = pkgs.makeDesktopItem {
    name = "plasticity-cad";
    desktopName = "Plasticity CAD";
    exec = "${plasticityRunScript}/bin/runPlasticity";
    terminal = false;
    icon = "Plasticity";
    keywords = [ "cad" "3D" ];
    mimeTypes = [ "x-scheme-handler/plasticity" ];
    # categories = [ "cad" ];
    startupWMClass = "Plasticity";
  };
in {
  # Stuff
  home.packages = [ pkgs.plasticity plasticityDesktopItem plasticityRunScript ];
}
