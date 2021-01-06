coach
Test Website

The entire contents of this repo are currently copied into the AWS amplify console and built in a docker container at https://www.findmeacoach.co.uk

    # Users Sets These
    str_protocol=http
    str_domain=autoscorch.com
    str_project=scorch
    dir_workspace=/mnt/d/temp-websites/
    str_target=findmeacoach
    git_branch=https://github.com/marlof/${str_target}.git
    
    # It makes these
    url="${str_protocol}://${str_domain}"
    cd dir_workspace
    
Step 1: Clone

    git clone --single-branch --branch dev ${git_branch}

Step 2: Mirror the website

    wget -q --mirror -p --adjust-extension -e robots=off --base=./ -k -P ./ ${url}

Step 3: Remove query strings

    find  ${str_target} -name "*.*\?*" | while read filename; do mv "$filename" "${filename%%\?*}"; done

Step 4: Reset the root

    cp -r  ${str_domain}/* ${str_target}/.

Step 5: Commit changes

Step 6: Push changes

Step 7: Merge request

Step 8: Merge


# Drupal-NAS way

    # Based on Winbuntu
    dir_workspace=/tmp/temp-websites/
    mkdir -p $dir_workspace
    str_target=findmeacoach
    git_branch=https://github.com/marlof/${str_target}.git

    
    # It makes these
    url="http://drupal-nas:35000"
    
    # System setup done here
    mkdir -p ${str_dir_workspace}
    cd ${str_dir_workspace}
    git clone --single-branch --branch dev ${git_branch}
    cd ${str_dir_workspace}/${str_project}
    
Works but there is a "?" issue:

    wget --mirror --convert-links --adjust-extension --page-requisites --no-parent "${url}"
    find  ${str_target} -name "*.*\?*" | while read filename; do mv "$filename" "${filename%%\?*}"; done

Trying:

    wget -q --mirror -p -e robots=off --base=./ -k -P ./ "${url}"

Other options to consider

    --mirror – download recursive
    --convert-links – convert all the links/CSS stylesheets to relative
    --adjust-extension – Adds extensions to filenames (html or css)
    --page-requisites – Download CSS style-sheets and images required to properly display the pages
    --no-parent – When recursing do not ascend to the parent directory. It useful for restricting the download to only a portion of the site.

Wget

    wget -mkEpnp http://example.org
    
Note: that the last p is part of np (--no-parent) and hence you see p twice in the flags.

