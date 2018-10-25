#!/usr/bin/env bash
repo_root=$(pwd);
repo_name=$(basename ${repo_root/-/_});

# Replace all occurrences of `drupal_module_template` with the module name.
subst="s/drupal_module_template/${repo_name}/g";
find ${repo_root} -maxdepth 1 -type f | xargs sed -i ${subst};

# Replace `drupal-module-template` with the module name in composer project name.
subst="s/drupal-module-template/${repo_name}/g";
sed -i ${subst} composer.json

# Rename the files.
mv drupal_module_template.info.yml ${repo_name}.info.yml
mv drupal_module_template.module ${repo_name}.module

# Replace the README.md with README.module.md
mv README.module.md README.md

# Remove the call of build-module.sh in composer and delete it
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
        # Mac OSX
        sed -i "" ""/build-module/d" composer.json
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
 #       sed -i "" ""/build-module/d" composer.json
# else
        sed -i "/build-module/d" composer.json
fi
rm build-module.sh
