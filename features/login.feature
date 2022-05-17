#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catalogo Ninjaflix
    Sendo um usuario previamente cadastrado
    Posso acessar o sistema com meu email e senha

    @login_happy
    Cenario: Acesso
        Quando eu faço login com "tony@stark.com" e "123456"
        Então devo ser autenticado
        E devo ver "Tony Stark" na área logada
    
    @login_hapless
    Esquema do Cenário: Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <texto>

        Exemplos:
        | email		       | senha	  | texto			               |
        | "tony@stark.com" | "abc123" | "Usuário e/ou senha inválidos" |
        | "404@yahoo.com"  | "abc123" | "Usuário e/ou senha inválidos" |
        | ""		       | "ABXCV"  | "Opps. Cadê o email?"	       |
        | "teste@asdasd"   | ""	      | "Opps. Cadê a senha?"          |

