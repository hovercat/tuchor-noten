# Chor Repository


- Alle Chor-PDFs in einem Ordner: https://github.com/hovercat/tuchor-noten-pdf
- Alle Chor-PDFs und MuseScore-Files in einem Ordner: https://github.com/hovercat/tuchor-noten-pdf-mscz
- SharePoint-Klon nur mit PDFs: https://github.com/hovercat/tuchor-alle-noten-pdf
- SharePoint-Klon mit PDFs und MuseSCore: https://github.com/hovercat/tuchor-alle-noten-pdf-mscz



## Symlinkerstellung

Wir ziehen aus dem Sharepoint hier die PDFs und auch die MuseScore-Files als Verknüpfung raus.
Eine reine PDF-Sammlung ist hier: https://github.com/hovercat/tuchor-noten-pdf


Chad Gibbidy hat mir die scripts erstellt, grüße gehen raus:
https://chatgpt.com/c/69552b8e-d228-8329-b81e-44b19b0ce751


```
chmod +x link-flat.sh
chmod +x symlink-creator.sh
chmod +x update-repository.sh
```

## Noten updaten

```
./update-repository.sh # macht:
./symlink-creator.sh ../alle-noten alle-noten-pdf-mscz mscz pdf
./link-flat.sh ../SharePoint gesammelt-pdf-mscz pdf mscz
./link-flat.sh ../SharePoint gesammelt-pdf pdf
```

