#language:pt

Funcionalidade: Remover filme
    Para que eu possa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título cancelado/indesejado ou  teve notas baixas pelo público
    Posso remover este item


Cenario: Confirmar exclusão

    Dado que "witch" está no catálogo
    Quando eu solicito a exclusão
    E eu confirmo a solicitação
    Então este item deve ser removido do catálogo

@rm_movie
Cenario: Cancelar exclusão

    Dado que "down" está no catálogo
    Quando eu solicito a exclusão
    Mas cancelo a solicitação
    Então este item deve permanecer no catálogo