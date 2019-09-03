# findmeacoach
Test Website

The entire contents of this repo are currently copied into the AWS amplify console and built in a docker container at https://www.findmeacoach.co.uk


Step 1: git clone --single-branch --branch dev https://github.com/marlof/findmeacoach.git

Step 2: Mirroe the website
  wget -q --mirror -p --adjust-extension -e robots=off --base=./ -k -P ./ http://example.com

Step 3: Remove query strings
  find -name "*.*\?*" | while read filename; do mv "$filename" "${filename%%\?*}"; done

Step 4: Reset the root
  mv autoscorch.com/* .

Step 5: Commit changes

Step 6: Push changes

Step 7: Merge request

Step 8: Merge


