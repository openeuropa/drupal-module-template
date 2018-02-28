#!/usr/bin/env bash
repo_root=$(pwd);
repo_name=$(basename ${repo_root});
subst="s/drupal-module-template/${repo_name}/g";

# Replace all occurrences of `drupal-module-template` with the module name.
find ${repo_root} -maxdepth 1 -type f | xargs sed -i  ${subst};

# Rename the info file.
mv drupal-module-template.info.yml ${repo_name}.info.yml

# Replace the travis.yml with travis.module.yml
mv .travis.module.yml .travis.yml

# Replace the README.md with README.module.md
mv README.module.md README.md

# Remove the call of replace-names.sh in composer and delete it
sed -i "/build-module/d" composer.json
rm build-module.sh
