#!/bin/bash
#
#
# the goal is to generate a html website that has a list of all the images styled in a way to represent a portfolio
# let's break that down to building blocks and pseudocode
#
# what do i want:
# - throw a bunch of images in  a folder
# - run a script
# - get a html page published.
#
# html page structure:
# - html boilerplate
# - the image gallery unordered list
#
# step through the script
# - create the empty html  page using the html boilerplate (header, body container, footer)
# - go into the images folder and create a list of all the image paths
# - loop over the image paths, for each image path, append the html body container with a list item html tag with the src being that image path
# - copy the html file as well as the images into a dist folder
# - commit and push 
#




# TODO:
# handle image  scaling before copying to dist folder.
# add   categories using subfolders

dt=$(date '+%Y%m%d-%H_%M');
echo "$dt"

distfolder="./dist"
srcimages="./images/"

mkdir -p $distfolder
cp -r "./images" "./dist/images"
touch tmp.html

cat ./templates/htmltop.html > tmp.html
find ./dist/images -type f | grep -E '\.(webp|jpg|png|gif)$' | while read -r imagepath; do
  echo "<li class='photo-item'><img class='photo-img' src='$imagepath'/></li>" >> tmp.html
done

cat ./templates/htmlbottom.html >> tmp.html

# add final html to dist folder
mv tmp.html ./dist/index.html
cp ./templates/style.css ./dist/style.css

# git add .
# git commit -m "$dt"
# git push
# git subtree push --prefix dist origin gh-pages

echo "done."

