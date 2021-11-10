#!/bin/bash
USUARIO=$1
SENHA=$2
SERVICO=$3
DESCRICAO=$4
URL=$5

# Carregar credenciais
. ~/admin-openrc

# Criar UsuÃ¡rio
openstack user create --domain default --password $SENHA $USUARIO

# Adicionar papel
openstack role add --project service --user $USUARIO admin

# Criar ServiÃ§o
openstack service create --name $USUARIO --description "$DESCRICAO" $SERVICO

# Adicionar os endpoints
openstack endpoint create --region RegionOne $SERVICO public $URL
openstack endpoint create --region RegionOne $SERVICO internal $URL
openstack endpoint create --region RegionOne $SERVICO admin $URL
