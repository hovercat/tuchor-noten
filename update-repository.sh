./symlink-creator.sh _sharepoint tuchor-tuchor-alle-noten-pdf-mscz mscz pdf
cd tuchor-alle-noten-pdf-mscz
git add *
git commit -m 'auto-update'
git push
cd ..

./symlink-creator.sh _sharepoint tuchor-alle-noten-pdf pdf
cd tuchor-alle-noten-pdf
git add *
git commit -m 'auto-update'
git push
cd ..

./link-flat.sh _sharepoint tuchor-noten-pdf-mscz pdf mscz
cd tuchor-noten-pdf-mscz
git add *
git commit -m 'auto-update'
git push
cd ..

./link-flat.sh _sharepoint tuchor-noten-pdf pdf
cd tuchor-noten-pdf
git add *
git commit -m 'auto-update'
git push
cd ..