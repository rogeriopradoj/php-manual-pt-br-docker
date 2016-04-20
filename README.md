# php-manual-pt-br-docker

Agilize a montagem do seu ambiente de tradução do manual do PHP para português do Brasil usando containers Docker.

## Informações gerais sobre o processo:

- https://wiki.php.net/doc

## Como começar

- Caso ainda não tenha, instale o Docker no seu computador: https://www.docker.com/

-  Acesse a pasta onde você vai trabalhar no seu computador:
```
# exemplo de pasta, escolha a sua
export SUA_PASTA="$HOME/contribs/php-manual-pt-br"

# se a pasta não estiver criada ainda, rode também
# mkdir -p $SUA_PASTA

cd $SUA_PASTA
```

- Execute o `./do.sh`:

```
./do.sh
#
#-----------------------------------------------------------------------
#                      Available commands                              -
#-----------------------------------------------------------------------
# _Standalone_
#==============
#   > git
#   > pear
#   > phd
#   > php
#   > rsync
#   > svn
# _Helpers_
#==============
# _Extras_
#==============
#   > sh - Log you into container
#   > help - Display this help
#-----------------------------------------------------------------------
```

### Dependências Standalone

Se preferir seguir o fluxo padrão, com os repositórios na própria máquina, apenas usando as dependências via Docker.

### Helpers

Serão colocadas alguns scripts que devem ajudar nas várias tarefas do processo de tradução.

- Sincronizar seus repositórios com os dados mais atuais
- Compilar o manual e testar no seu navegador
- Criar o arquivo de patch pronto para mandar via email para a lista oficial

## Por que usar esse projeto (ou qual o ganho de usar containers Docker para fazer a tradução)?

Usando esse projeto você:

- tem um ambiente pronto com todas as dependências (isolado via containers Docker);
- tem a disposição scripts que gerenciam de forma rápida os repositórios e os testes gráficos no seu navegador;
- pode se focar na tradução em vez de gastar tanto tempo com as complexidades do processo.

### Um pouco mais de base

A tradução do manual do PHP em português do Brasil é baseada em 3 grandes repositórios:

1. *GIT* https://github.com/php/web-php.git:
    
    Onde fica página inicial do php.net. Usado para testar graficamente o manual no navegador.

    Nenhuma alteração é feita diretamente nesse repositório.

2. *SVN* https://svn.php.net/repository/phpdoc/modules/doc-en:
    
    Meta-repositório para contribuir com manual original em inglês. No nosso caso, serve apenas para testar graficamente o manual no navegador.

    Nenhuma alteração é feita diretamente nesse repositório.

3. *SVN* https://svn.php.net/repository/phpdoc/modules/doc-pt_BR:

    Meta-repositório onde é feita a tradução de verdade.

    As alterações dos arquivos serão feitas no subdiretório `pt_BR/`.

Você pode fazer esse processo manualmente, gerenciando cada um dos repositórios, mas é um processo dispendioso.

Além disso, você precisa de uma série de dependências pré-instaladas para compilar o manual após fazer as suas alterações (exemplo: PEAR, Phd, php, svn, git etc.)
