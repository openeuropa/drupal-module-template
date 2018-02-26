#!/usr/bin/env bash
repo_root=$(pwd);
repo_name=$(basename ${repo_root});
subst="s/drupal-module-template/${repo_name}/g";
find ${repo_root} -maxdepth 1 -type f | xargs sed -i  ${subst};
mv drupal-module-template.info.yml ${repo_name}.info.yml
mv .travis.module.yml .travis.yml
sed -i "/replace-names/d" composer.json
rm replace-names.sh
