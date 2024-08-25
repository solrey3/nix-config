{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nmap
    wireshark
    john
    aircrack-ng
    hydra
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
