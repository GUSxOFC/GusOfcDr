#!/bin/bash

# ===============================
# GUSxOFC - NGL ULTRA SPAM v1
# Dibuat oleh: GUSxOFC
# ===============================

clear

# Warna
red='\033[0;31m'
green='\033[0;32m'
cyan='\033[0;36m'
yellow='\033[1;33m'
nc='\033[0m'

# Animasi keren
function opening() {
    for i in {1..3}; do
        echo -ne "${cyan}Menyiapkan spammer"
        for j in {1..5}; do
            echo -ne "."
            sleep 0.1
        done
        clear
    done
}

# Big Banner
function banner() {
    echo -e "${red}"
    echo " ██████╗ ██╗   ██╗███████╗     ██████╗ ███████╗"
    echo "██╔═══██╗██║   ██║██╔════╝    ██╔════╝ ██╔════╝"
    echo "██║   ██║██║   ██║█████╗      ██║  ███╗█████╗  "
    echo "██║▄▄ ██║██║   ██║██╔══╝      ██║   ██║██╔══╝  "
    echo "╚██████╔╝╚██████╔╝███████╗    ╚██████╔╝███████╗"
    echo " ╚══▀▀═╝  ╚═════╝ ╚══════╝     ╚═════╝ ╚══════╝"
    echo -e "${nc}"
}

# Tampilkan Info
opening
banner
echo -e "${yellow}Owner   : GUSxOFC"
echo -e "Version : 1"
echo -e "Tanggal : $(date '+%d-%m-%Y')${nc}\n"

# Input
read -p "Masukkan username NGL (tanpa @): " user
read -p "Masukkan isi pesan: " pesan
read -p "Jumlah pesan: " jumlah

# Mulai
echo -e "\n${green}Memulai spam $jumlah pesan ke @$user ...${nc}\n"

for ((i=1; i<=jumlah; i++)); do
    devID="GUSx$(date +%s%N | cut -b1-13)$RANDOM"
    curl -s -X POST "https://ngl.link/api/submit" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data "username=$user&question=$pesan&deviceId=$devID" > /dev/null &
    echo -e "${cyan}[$i] Terkirim ke @$user ✔️${nc}"
done

# Tunggu semua selesai
wait

echo -e "\n${green}Selesai semua. Total terkirim: $jumlah pesan.${nc}"
