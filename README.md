# Projeto Trainee {Struct} 2023

## Projeto Final

Integrantes do grupo:

- Carolina Fernandes
- Eduardo P.P. Ferreira
- Luis Antonio Benjamin Flexa
- Pedro Menezes

## Como contribuir com o projeto:

Para dar inicio à contribuição, é necessário clonar o repositório:

`git clone https://github.com/EdPPF/trainee2023-backEnd.git`

Feito isso, rode `bundle install` para iniciar as gems do repositório (para mais informações, veja a seção de dependências deste projeto).

Sempre que quiser iniciar um novo trabalho neste repositório, **abra um novo issue** na seção *issues* no GitHub. Coloque seu nome no issue para marcá-lo como sua tarefa. Além disso, **crie uma nova branch**, como

`git branch issueN069`,

troque para ela em seu repositório local,

`git checkout issueN069`

e inicie seu trabalho.

Após finalizar as tarefas do issue, *marque-o como finalizado* no GitHub e, após dar seus commits na branch em que trabalhou, dê push:

`git push issueN069`

Dependendo do caso, talvez seja necessário abrir um **pull request (PR)** para dar merge de sua branch à outra branch do projeto.

No próprio GitHub, isso pode ser feito ao ir na aba *Pull requests* e clicar em *New pull request*, ou, na página inicial do repositório, mudando para a branch que quer dar merge e clicando em *Contribute* no menu contextual que aparecerá logo acima dos arquivos dessa branch.

Em qualquer caso, é importante selecionar a branch **que será mesclada** (no caso, a branch onde foi feito o trabalho) e a branch **na qual será** mesclada, que não necessariamente precisa ser a branch principal (main/master).

____

## Dependências deste Projeto

### Gems utilizadas:

Aqui estão listados os passos tomados para configuração inicial das gems no início do repositório, após escrita delas no *gemfile*.

*Figaro* (database credentials):

    bundle install
    bundle exec figaro install

*RSpec*:

    bundle install
    rails generate rspec:install

*Factory Bot*:

`bundle install`, depois foi criada a pasta *spec\support*, onde foi criado o arquivo *factory_bot.rb*.

### Base de Dados:

Em *config > application.yml*, descomente as duas últimas linhas (*db_user* e *db_password*) apenas se necessário (verificar vídeo "Trainee 2023/1 - Rails API Models", 12min).
