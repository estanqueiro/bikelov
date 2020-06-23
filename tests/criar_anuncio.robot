*** Settings ***
Documentation   Criar anúncio
...             Para que eu possa disponibilizar bikes para locação
...             Sendo um anunciante
...             Quero poder cadastrar um novo anúncio

Resource  ../resources/steps_kw.resource

Suite Setup     Logged With "eu@papito.io"
Suite Teardown  End Session

Test Teardown   End Test

*** Variables ***
${bike}  {"thumb": "elleven.jpg", "name": "Elleven Rocker 27 Marchas", "brand": "Shimano", "price": "15"}

*** Test Cases ***
Anunciar minha bike
    Dado que eu tenho uma "${bike}" muito bonita
    E eu acesso o formulário de cadastro de anúncios
    Quando eu faço o anúncio dessa bike
    Então devo ver minha bike na lista de anúncios
    E o valor para locação deve ser igual a "R$15/dia"
