# findmeacoach
Test Website

The entire contents of this repo are currently copied into the AWS amplify console and built in a docker container at https://www.findmeacoach.co.uk

Step 1: Clone
    git clone --single-branch --branch dev https://github.com/marlof/findmeacoach.git

Step 2: Mirror the website
    wget -q --mirror -p --adjust-extension -e robots=off --base=./ -k -P ./ http://autoscorch.com

Step 3: Remove query strings
    find -name "*.*\?*" | while read filename; do mv "$filename" "${filename%%\?*}"; done

Step 4: Reset the root
    mv autoscorch.com/* .

Step 5: Commit changes

Step 6: Push changes

Step 7: Merge request

Step 8: Merge


# Drupal-NAS way

    mkdir -p /mnt/d/temp-websites/scorch
    cd /mnt/d/temp-websites/
    
Works but there is a "?" issue:

    wget --mirror --convert-links --adjust-extension --page-requisites --no-parent http://autoscorch.com
Trying:

    wget -q --mirror -p -e robots=off --base=./ -k -P ./ http://autoscorch.com

Other options to consider
    --mirror – download recursive
    --convert-links – convert all the links/CSS stylesheets to relative
    --adjust-extension – Adds extensions to filenames (html or css)
    --page-requisites – Download CSS style-sheets and images required to properly display the pages
    --no-parent – When recursing do not ascend to the parent directory. It useful for restricting the download to only a portion of the site.

    wget -mkEpnp http://example.org
    
Note: that the last p is part of np (--no-parent) and hence you see p twice in the flags.
