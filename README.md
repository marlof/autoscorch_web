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
    mkdir -p ${dir_workspace}
    cd ${dir_workspace}
    
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


    # Based on Winbuntu and drupal-nas
    dir_workspace=/tmp/temp-websites/
    str_target=findmeacoach
    git_branch=https://github.com/marlof/${str_target}.git
    str_domain="drupal-nas:35000"
    url="http://${str_domain}"

    # System setup done here
    mkdir -p $dir_workspace
    cd ${dir_workspace}
    git clone --single-branch --branch dev ${git_branch}

    wget --mirror --convert-links --adjust-extension --page-requisites --no-parent "${url}"
    # wget -mkEpnp http://example.org
    str_domain_fix=${str_domain/:/\\:}
    cp -r "${dir_workspace}"/${str_domain_fix}/* "${dir_workspace}/${str_target}/."
    find  "${dir_workspace}/${str_target}/." -name "*.*\?*" | while read filename; do mv "$filename" "${filename%%\?*}"; done
    find "${dir_workspace}/${str_target}/." -name '*.html' | xargs  sed -ri  -e 's/(.css)\?[0-z]*/\1/gi'  -e 's#'"${url}"'/##gi' -e 's/(.css)%3F[0-z]*.css/\1/gi'

    cd ${dir_workspace}/${str_target}
    git status
    git commit -am "Updates from drupal-nas"
    git push
