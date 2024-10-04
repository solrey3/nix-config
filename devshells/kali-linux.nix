{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nmap
    wireshark
    john
    aircrack-ng
    thc-hydra
    sqlmap
    metasploit
    nikto
    gobuster
    hashcat
    # Add more tools as needed
  ];

  shellHook = ''
    echo "Kali Linux environment activated"
  '';
}
