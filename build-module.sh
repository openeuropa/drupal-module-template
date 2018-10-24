#!/usr/bin/env bash
repo_root=$(pwd);
repo_name=$(basename ${repo_root/-/_});
subst="s/drupal_module_template/${repo_name}/g";

# Replace all occurrences of `drupal_module_template` with the module name.
find ${repo_root} -maxdepth 1 -type f | xargs sed -i ${subst};

# Replace `drupal-module-template` with the module name in composer project name.
sed -i 's/drupal-module-template/${repo_name}/g' composer.json

# Rename the files.
mv drupal_module_template.info.yml ${repo_name}.info.yml
mv drupal_module_template.module ${repo_name}.module

# Replace the README.md with README.module.md
mv README.module.md README.md

# Remove the call of build-module.sh in composer and delete it
sed -i "/build-module/d" composer.json
rm build-module.sh
