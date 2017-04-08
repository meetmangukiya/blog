echo "[building]"
hugo -t hugo-type-theme
echo "[Pushing to master]"
cd public/
git checkout master
git add *
git commit -m "Website Update $(date -u)"
git push
