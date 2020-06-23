

*** Variables ***
### Login page
${INPUT_EMAIL}       id:email
${BUTTON_LOGIN}      xpath://button[@class='btn btn-red'][contains(text(),'Quero Anúnciar')]
${ALERT_DARK}        class:alert-dark

### Dashboard page
${DIV_DASHBOARD}     class:dashboard
${BUTTON_ANUNCIAR}   xpath://button[@class='btn btn-red'][contains(text(),'Criar anúncio')]
${BIKE_LIST}         xpath://ul[@class='bike-list']

### Form page
${INPUT_THUMBNAIL}   xpath://label[@id='thumbnail']//input[@type='file']
${INPUT_NAME}        id:name
${INPUT_BRAND}       id:brand
${INPUT_PRICE}       id:price
${BUTTON_SUBMIT}     xpath://button[@class='btn btn-red'][contains(text(),'Cadastrar')]
${ALERT_ERROR}       class:alert-error