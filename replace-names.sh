#!/usr/bin/env bash
repo_root=$(pwd);
repo_name=$(basename ${repo_root});
subst="s/module-skeleton/${repo_name}/g";
find ${repo_root} -maxdepth 1 -type f | xargs sed -i  ${subst};
mv module-skeleton.info.yml ${repo_name}.info.yml
sed -i "/replace-names/d" composer.json
rm replace-names.sh
