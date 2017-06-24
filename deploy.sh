# Update all the themes at every build
cd themes/
for Dir in $(ls)
do
    echo
    cd "$Dir" && echo "[Updating theme $Dir]"
    git pull --ff-only origin master
    cd ..
done
cd ..

echo "[building]"
hugo -t hugo-steam-theme
echo
echo "[Pushing to master]"
cd public/
git checkout master
git add *
git commit -m "Website Update $(date -u)"
git push
