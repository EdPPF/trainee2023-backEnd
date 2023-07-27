# Projeto Trainee {Struct} 2023

## Projeto Final

Integrantes do grupo:

- Eduardo P.P. Ferreira

## Como contribuir com o projeto:

Para dar inicio à contribuição, é necessário clonar o repositório:

`git clone https://github.com/EdPPF/trainee2023-backEnd.git`

Feito isso, rode `bundle install` para iniciar as gems do repositório (para mais informações, veja a seção de dependências deste projeto).

As contribuições neste projeto são feitas durante os *sprints* definidos de acordo com a metodologia ágil SCRUM.

Para contribuir durante um sprint, **certifique-se de mudar para a branch do sprint atual**, como por exemplo

`git checkout sprint-Models`

Sempre que quiser iniciar um novo trabalho neste repositório, **abra um novo issue** na seção *issues* no GitHub. Coloque seu nome no issue para marcá-lo como sua tarefa. Além disso, **crie uma nova branch a partir da branch do sprint atual**, como

`git branch issueN069`,

troque para ela em seu repositório local,

`git checkout issueN069`

e inicie seu trabalho.

Após finalizar as tarefas do issue, *marque-o como finalizado* no GitHub e, após dar seus commits na branch em que trabalhou, dê push:

`git push issueN069`

Dependendo do caso, talvez seja necessário abrir um **pull request (PR)** para dar merge de sua branch à outra branch do projeto.

No próprio GitHub, isso pode ser feito ao ir na aba *Pull requests* e clicar em *New pull request*, ou, na página inicial do repositório, mudando para a branch que quer dar merge e clicando em *Contribute* no menu contextual que aparecerá logo acima dos arquivos dessa branch.

Em qualquer caso, é importante selecionar a branch **que será** mesclada (no caso, a branch onde foi feito o trabalho) e a branch **na qual será** mesclada. Durante os sprints, todos os issues serão mesclados na branch do sprint. Ao final do sprint, e após revisão, essa branch será mesclada à main.

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

`bundle install`, depois foi criada a pasta *spec/support*, onde foi criado o arquivo *factory_bot.rb*.

*Panko Serializer*:

`bundle install`, depois foi criada a pasta *app/serializer*. Nessa pasta, são criados os arquivos de serializer para cada model (nem todas as models precisam de serializer).

*Devise*:

    bundle install
    rails g devise:install

*Simple Token Authentication*:

    bundle install

### Base de Dados:

Em *config > application.yml*, descomente as duas últimas linhas (*db_user* e *db_password*) apenas se necessário (verificar vídeo "Trainee 2023/1 - Rails API Models", aos 12min).

Uma ferramenta que não é exataente uma *gem* mas se relaciona com o banco de dados é o *Active Storage*, instalado por meio dos comandos:

    rails active_storage:install
    rails db:migrate
