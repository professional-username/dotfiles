{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  home.file."jrnl.yaml" = {
    target = ".config/jrnl/jrnl.yaml";
    text = ''
      colors:
        body: none
        date: black
        tags: yellow
        title: cyan
      default_hour: 9
      default_minute: 0
      editor: nvim
      encrypt: false
      highlight: true
      indent_character: '|'
      journals:
        default:
          journal: /home/username/Documents/journal.txt
      linewrap: 79
      tagsymbols: '#@'
      template: false
      timeformat: '%F %r'
      version: v4.1
    '';
  };
}
