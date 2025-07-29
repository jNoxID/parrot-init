# 🛠️ Script d'Initialisation pour Parrot OS HTB Edition

Ce script Bash prépare un environnement **propre, sécurisé et prêt pour le pentest ou le développement** sous la distribution **Parrot OS HTB Edition**. Il s'agit d'un setup de base recommandé après une première installation.

---

## ✅ Objectifs du Script

- Mettre à jour le système proprement via `parrot-upgrade`
- Nettoyer les paquets inutiles
- Configurer le clavier (FR)
- Installer les outils essentiels pour le développement et le réseau
- Activer et configurer un pare-feu avec UFW
- Installer des outils de sécurité comme Fail2ban, rkhunter et lynis
- Désactiver des services réseau inutiles
- Ajouter des alias pratiques pour un shell plus productif
- Lancer un audit de sécurité initial

---

## 📦 Outils installés

| Catégorie    | Paquets                                 |
| ------------ | --------------------------------------- |
| Base système | `build-essential`, `htop`, `neofetch`   |
| Réseau       | `net-tools`, `iputils-ping`, `dnsutils` |
| Sécurité     | `ufw`, `fail2ban`, `rkhunter`, `lynis`  |
| Dev/Python   | `git`, `python3`, `python3-pip`         |
| Divers       | `curl`, `wget`, `unzip`                 |

---

## 🚀 Utilisation

```bash
chmod +x parrot-init.sh
./parrot-init.sh
```
