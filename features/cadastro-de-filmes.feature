#language:pt

Funcionalidade: Cadastro de filmes
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

    @new_movie
    Esquema do Cenário: Novo filme
        O gestor de catálogo cadastra um novo filme através do formulário
        e um novo registro é inserido no catálogo Ninjaflix

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastrado deste filme
        Então devo ver o novo filme na lista

        Exemplos:
            | codigo     |
            | "ultimato" |
            | "spider"   |
            | "jocker"   |

    Cenário: Sem nome
        Quando eu tento cadastrar um filme sem o nome
        Então devo ver a notificação "Oops - Filme sem título. Pode isso Arnaldo?  "
    
    Cenário: Sem status
        Quando eu tento cadastrar um filme sem o status
        Então devo ver a notificação "Oops - O status deve ser informado."
    
    Cenário: Ano de lançamento não informado
        Quando eu tento cadastrar um filme sem o ano de lançamento
        Então devo ver a notificação "Oops - Faltou o ano de lançamento."

    Cenário: Data de estréia não informada
        Quando eu tento cadastrar um filme sem a data de estréia
        Então devo ver a notificação "Oops - Quase lá, só falta a data de estréia."
    
    Cenário: Duplicado
        Quando "Deadpool 2" já foi cadastrado
        Então devo ver a notificação "Oops - Este título já existe no Ninjaflix."