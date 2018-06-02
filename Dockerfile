FROM archlinux/base
MAINTAINER psf

USER root
ENV HOME /root
ENV TERM xterm-256colors
WORKDIR /root

RUN echo '[multilib]' >> /etc/pacman.conf && \
    echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

RUN pacman -Syu --noconfirm --needed --force && \
    pacman -S --force --noconfirm --needed base-devel && \
    curl -s https://blackarch.org/strap.sh | sed 's|  check_internet|  #check_internet|' | sh && \
    pacman -S --force --noconfirm --needed \
        0d1n 0trace afflib base64dump bind-tools binwalk bulk-extractor cewl cfr crunch dex2jar     \
        dirsearch dnsrecon dnsspider enum4linux enum-shares ettercap fernflower findmyhash          \
        foremost frida gcc gdb git gnu-netcat grml-zsh-config vim hash-buster hashcat hashid htop   \
        hydra jad john kickthemout kismet lib32-gcc-libs linux-exploit-suggester.sh malwaredetect   \
        mimikatz mimipenguin mitmf msf-mpc mtools mutator nfsshell nfs-utils nikto nmap nosqlmap    \
        openssh ophcrack p7zip padbuster parted peda peframe perl-image-exiftool pngcheck pwndbg    \
        pwntools pyrit python2-yara radamsa radare2 raven recon-ng rsync searchsploit shodan        \
        smbclient smtp-user-enum sqlmap sshfs ssldump sslyze stegdetect steghide stegsolve          \
        sublist3r tcpdump tcpextract tcpick theharvester tigervnc tmux traceroute                   \
        unicorn-powershell unicornscan unrar unzip vim-airline vim-nerdtree vim-tagbar volatility   \
        webshells weechat wget whois wifite wireshark-cli wpscan xsel xz zip zsh zsh-completions    \
        zsh-syntax-highlighting

RUN chsh -s /bin/zsh root
CMD ["/bin/zsh"]
