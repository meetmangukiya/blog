hugo -t ghostwriter
cd public/
git checkout master
git add *
git commit -m "Website Update $(date -u)"
git push
