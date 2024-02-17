# Festlegen des Benutzerprofils und des Ausgabepfads für das Ergebnis
$userProfile = $env:USERPROFILE
$outputPath = "$userProfile\Downloads\dl_result.txt"

# Aufforderung an den Benutzer, einen Pfad einzugeben oder durch Drücken von "Enter" den aktuellen Pfad zu verwenden
$startPath = Read-Host "Bitte gib hier den Pfad ein, dessen Verzeichnisstruktur du auflisten möchtest (z. B. '$userProfile') oder drücke 'Enter' für den aktuellen Pfad"
if ($startPath -eq '') {
    $startPath = "." # Setzt den Pfad auf den aktuellen Ordner, falls keine Eingabe erfolgt
}

# Überprüfung, ob der angegebene Pfad existiert
if (Test-Path $startPath) {
    # Auflisten aller Dateien und Ordner rekursiv und Speichern des vollständigen Pfades in einer Datei
    Get-ChildItem -Path $startPath -Recurse | ForEach-Object {
        $_.FullName
    } | Out-File -FilePath $outputPath -Force
    
    # Benachrichtigung des Benutzers über den Speicherort des Ergebnisses
    Write-Host "Die Verzeichnisstruktur wurde in folgendem Pfad gespeichert: $outputPath"
} else {
    # Fehlermeldung, falls der Pfad nicht existiert
    Write-Host "Der angegebene Pfad existiert nicht. Bitte versuche es erneut."
}