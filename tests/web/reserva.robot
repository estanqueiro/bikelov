*** Settings ***
Documentation   Pedido de reservas
...             Para que eu possa aprovar ou reprovar
...             Sendo um anunciante que possui anúncios cadastrados
...             Quero receber pedidos de reservas no meu dashboard

Resource  ../resources/steps_kw.resource

Suite Setup     Logged With "eu@papito.io"
Suite Teardown  End Session

Test Teardown   End Test

*** Test Cases ***
Receber pedido de reserva
    Dado que estou logado como "eu@papito.io"
    E tenho anúncios cadastrados
    Quando o cliente "eu@paulo.io" solicita uma reserva para o meu anúncio
    Então devo ver esta solicitação no meu dashboard

