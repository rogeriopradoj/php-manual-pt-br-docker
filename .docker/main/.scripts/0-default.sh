#!/usr/bin/env sh
set -e

indent_output() {
  while read data; do
    echo -e " \033[1;32m|\033[0m  $data"
  done
}

colorize_output() {
  while read data; do
    echo -e "\033[1;32m$data\033[0m"
  done
}

update_svn() {
  local lang="$1"
  local repo_dir="/repositories_temp/doc-${lang}"

  echo "Updating svn ${lang}" | colorize_output

  cd ${repo_dir}
  svn update
  php doc-base/configure.php --enable-xml-details
  phd --docbook doc-base/.manual.xml --package PHP --format php --output mydocs

  echo "Done." | indent_output
  echo
}

update_svn_en() {
  local repo_dir="/repositories_temp/doc-en"

  echo "Updating svn en" | colorize_output

  cd ${repo_dir}
  svn update
  php doc-base/configure.php --enable-xml-details
  phd --docbook doc-base/.manual.xml --package PHP --format php --output mydocs

  echo "Done." | indent_output
  echo
}

update_svn_pt_br() {
  local repo_dir="/repositories_temp/doc-pt_BR"

  echo "Updating svn pt_BR" | colorize_output

  cd ${repo_dir}
  svn update
  php doc-base/configure.php --enable-xml-details
  phd --docbook doc-base/.manual.xml --package PHP --format php --output mydocs

  echo "Done." | indent_output
  echo
}

update_git_web() {
  local repo_dir="/repositories_temp/web-php"

  echo "Updating git web" | colorize_output

  cd ${repo_dir}

  git clean -df
  git checkout -- .
  git pull
  cd ..
  rm -r `pwd`/web-php/manual/en
  ln -s `pwd`/doc-en/mydocs/php-web `pwd`/web-php/manual/en
  ln -s `pwd`/doc-pt_BR/mydocs/php-web `pwd`/web-php/manual/pt_BR
  cd web-php

}

echo "INFO" | colorize_output
echo "Todas as dependências e repos já estão dentro da imagem/container" | indent_output
echo
echo "Agora, vamos atualizar os repositórios" | indent_output
echo

update_svn_en
update_svn_pt_br
update_git_web
