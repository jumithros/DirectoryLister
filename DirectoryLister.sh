#!/bin/bash

# Festlegen des Benutzerprofils und des Ausgabepfads für das Ergebnis
userProfile=$HOME
outputPath="$userProfile/dl_result.txt"

# Aufforderung an den Benutzer, einen Pfad einzugeben oder durch Drücken von "Enter" den aktuellen Pfad zu verwenden
read -p "Bitte gib hier den Pfad ein, dessen Verzeichnisstruktur du auflisten möchtest (z. B. '$userProfile') oder drücke 'Enter' für den aktuellen Pfad: " startPath
if [ -z "$startPath" ]; then
    startPath="." # Setzt den Pfad auf den aktuellen Ordner, falls keine Eingabe erfolgt
fi

# Überprüfung, ob der angegebene Pfad existiert
if [ -d "$startPath" ] || [ -f "$startPath" ]; then
    # Auflisten aller Dateien und Ordner rekursiv und Speichern des vollständigen Pfades in einer Datei
    find "$startPath" > "$outputPath"
    
    # Benachrichtigung des Benutzers über den Speicherort des Ergebnisses
    echo "Die Verzeichnisstruktur wurde in folgendem Pfad gespeichert: $outputPath"
else
    # Fehlermeldung, falls der Pfad nicht existiert
    echo "Der angegebene Pfad existiert nicht. Bitte versuche es erneut."
fi