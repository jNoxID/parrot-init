#!/bin/bash
# Script de préparation Parrot OS HTB — Dev + Pentest Ready

echo "[+] Mise à jour complète du système..."
sudo parrot-upgrade -y

echo "[+] Nettoyage des paquets inutiles..."
sudo apt autoremove --purge -y
sudo apt clean

echo "[+] Vérification du compte utilisateur..."
whoami
id

echo "[+] Configuration du clavier (FR)..."
setxkbmap fr
sudo localectl set-x11-keymap fr

echo "[+] Installation des outils de base dev & réseau..."
sudo apt install -y git curl wget python3 python3-pip build-essential net-tools iputils-ping dnsutils htop neofetch unzip

echo "[+] Configuration de Git (à adapter)..."
git config --global user.name "Ton Nom"
git config --global user.email "ton@email.com"

echo "[+] Activation du pare-feu UFW..."
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw enable

echo "[+] Installation et configuration de Fail2ban..."
sudo apt install -y fail2ban
sudo systemctl enable fail2ban --now

echo "[+] Installation de rkhunter et lynis..."
sudo apt install -y rkhunter lynis
sudo rkhunter --update
sudo rkhunter --propupd
sudo lynis update info

echo "[+] Désactivation de services réseau inutiles..."
sudo systemctl disable --now avahi-daemon 2>/dev/null
sudo systemctl disable --now cups 2>/dev/null
sudo systemctl disable --now bluetooth 2>/dev/null

echo "[+] Vérification des services actifs..."
sudo ss -tulpn

echo "[+] Définition d'alias utiles..."
echo "alias update='sudo parrot-upgrade'" >> ~/.bashrc
echo "alias ll='ls -alh --color=auto'" >> ~/.bashrc
echo "alias cls='clear'" >> ~/.bashrc
source ~/.bashrc

echo "[+] Audit de sécurité initial avec Lynis..."
sudo lynis audit system

echo "[✓] Configuration terminée. Redémarrage recommandé."

exit