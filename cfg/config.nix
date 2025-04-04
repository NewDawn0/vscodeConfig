{ pkgs }:
let
  # Config
  fontFamily = "JetBrainsMono Nerd Font";
  fontSize = 12.0;
  config = {
    chat.editor = { inherit fontSize fontFamily; };
    debug.console = { inherit fontSize fontFamily; };
    editor = {
      inherit fontSize fontFamily;
      inlineHints = { inherit fontSize fontFamily; };
      inlineSuggest = { inherit fontSize fontFamily; };
      minimap.sectionHeaderFontSize = fontSize;
    };
    markdown.preview = { inherit fontSize fontFamily; };
    scm.inputFontFamily = fontFamily;
    scm.inputFontSize = fontSize;
    screencastMode = { inherit fontSize; };
    terminal.integrated = { inherit fontSize; };
    workbench.colorTheme = "Everblush";
  };
  # Builder function
  flattenAttrsPrefix = attrs: prefix:
    pkgs.lib.attrsets.foldlAttrs (acc: name: value:
      let key = if prefix == "" then name else "${prefix}.${name}";
      in if builtins.isAttrs value then
        acc // flattenAttrsPrefix value key
      else
        acc // { "${key}" = value; }) { } attrs;
  vsCfg = pkgs.stdenvNoCC.mkDerivation {
    name = "vsc-settings-json";
    src = null;
    dontUnpack = true;
    dontBuild = true;
    settingsFile = (pkgs.formats.json { }).generate "settings.json"
      (flattenAttrsPrefix config "");
    installPhase = ''
      install -D $settingsFile $out/share/settings.json
    '';
  };
in vsCfg
