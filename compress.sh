#!/bin/bash

# openssl rand 1024 > symmetric_keyfile.key

# Percorso del file PKCS#12
file_pkcs12="./Certificati.p12"

# Nome del file di archivio compresso e criptato
archivio="./ExtraFiles.7z"

simmetric_keyfile="./symmetric_keyfile.key"

function zipArchive() {
    # Comprimi la cartella mantenendo la struttura delle directory
    zip -r $archivio . -x ".vscode/*" -x "**/.DS_Store" -x "./$file_pkcs12" -x "./compress.sh" -x ".git/*"
    echo "Archivio generato 💪"
}

function generateFileCriptato() {
    # Crittografa l'archivio con OpenSSL usando il file PKCS#12
    openssl aes-256-cbc -a -salt -pbkdf2 -in "$archivio" -out "$archivio".enc -kfile $simmetric_keyfile

    echo "Archivio cryptato 💪"

    # rm ./$file_pkcs12
    # rm -rf $archivio
    echo "File compresso in chiaro eliminato 💪"
}

zipArchive && generateFileCriptato