#!/bin/bash

# Nome del file di archivio compresso e criptato
archivio="./ExtraFiles.7z"

simmetric_keyfile="./symmetric_keyfile.key"

# Nome del file di archivio compresso e criptato
archivio="./ExtraFiles.7z"

function decriptFileCriptato() {
    # Crittografa l'archivio con OpenSSL usando il file PKCS#12
    openssl aes-256-cbc -d -a -pbkdf2 -in $archivio.enc -out $archivio.dec.7z -kfile $simmetric_keyfile
    
    echo "File decriptato correttamente 💪"
}

cartella=./PuntoEttoreExtraFiles

function unzipArchive() {
    # Comprimi la cartella mantenendo la struttura delle directory
    unzip -: -o $archivio.dec.7z -d $cartella

    echo "Cartella decompressa con successo in $cartella"

    # rm -rf $Archivio
    # rm -rf cert-decrypted.tmp
    # rm -rf client-new.p12
    # rm -rf ExtraFiles.7z
    
    echo "Archivio rimosso 💪"
}

decriptFileCriptato && unzipArchive