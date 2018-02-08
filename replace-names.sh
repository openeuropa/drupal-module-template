#!/usr/bin/env bash
repo_root=$(git rev-parse --show-toplevel);
repo_name=$(basename ${repo_root});
subst="s/module-skeleton/${repo_name}/g";
find ${repo_root} -maxdepth 1 -type f | xargs sed -i  ${subst};
sed -i "/replace-names/d" composer.json
rm replace-names.sh
