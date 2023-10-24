# Sistema de Gerenciamento de Tarefas

## Descrição

Este é um sistema de gerenciamento de tarefas escrito em Haskell. Ele permite que você adicione, remova e pesquise tarefas com base em vários critérios, como prioridade, data de vencimento e descrição. O sistema utiliza uma árvore binária de busca (BST) para armazenar as tarefas, o que permite uma organização e priorização eficientes das tarefas.

## Como executar

Para executar este programa, você precisa ter o compilador GHC (Glasgow Haskell Compiler) instalado em seu sistema. Você pode baixar o GHC do site oficial do Haskell: https://www.haskell.org/ghc/

Uma vez que você tenha o GHC instalado, você pode compilar e executar o programa da seguinte maneira:

1. Abra um terminal.
2. Navegue até o diretório que contém o arquivo do programa.
3. Compile o programa usando o comando `ghc -o main main.hs`.
4. Execute o programa usando o comando `./main`.

Alternativamente, você também pode executar este código no Repl.it, uma plataforma online para execução de código.

## Desenvolvimento

O desenvolvimento deste sistema envolveu várias etapas:

1. **Definição da linguagem e ambiente**: Inicialmente tive que definir qual linguagem iria usar, e em qual ambiente iria trabalhar. Optei por utilizar a linguagem Haskell, e trabalhar nesse projeto localmente.
2. **Definição da estrutura de dados**: A primeira etapa foi definir a estrutura de dados para as tarefas e a árvore binária de busca. Cada tarefa é representada por uma instância do tipo `Task`, que inclui um ID, descrição, prioridade e data de vencimento.

3. **Implementação das funções da árvore binária de busca**: Em seguida, implementei várias funções para manipular a árvore binária de busca, incluindo funções para inserir um nó, remover um nó e buscar nós com base em vários critérios.

4. **Implementação do loop principal do programa**: O loop principal do programa lê comandos do usuário e chama as funções apropriadas para manipular a árvore binária de busca. Essas funções são pensadas para atender algumas necessidadess quando se trata de lista de tarefas, como adicionar tarefas, listar tarefas com algum filtro, listar todas tarefas e remover tarefas.

5. **Teste e depuração**: Por fim, testei o programa para garantir que ele funcionasse corretamente. Corrigi vários bugs durante esse processo. Essa etapa de teste sempre foi realizada a cada implementação de uma nova função.

## Reflexões

Durante o desenvolvimento deste sistema, aprendi muito sobre a linguagem Haskell e sobre como usar árvores binárias de busca para organizar dados de maneira eficiente. Também aprendi sobre a importância de testar cuidadosamente o código e corrigir bugs.

Fiz várias escolhas importantes durante o desenvolvimento. Por exemplo, decidi representar as tarefas como instâncias de um tipo personalizado (`Task`), em vez de usar um tipo embutido como uma tupla ou lista. Isso tornou o código mais legível e fácil de entender.

Cometi vários erros ao longo do caminho, como inicialmente esquecer de tratar o caso em que duas tarefas têm a mesma prioridade. No entanto, consegui corrigir esses erros durante o processo. Além desses erros mais semânticos, várias vezes ocorrearam erros de sintaxes que pareciam insolucionáveis, e muitos deles se davam por um pequeno erro, causado pela falta de prática na linguagem.

Fiz várias buscas na internet e em sites como StackOverflow, além desses sites também utilizei dos materiais apresentados em aula, que me ajudaram a corrigir vários erros do código, quando se tratava de funções.

Algo que "bugou" bastante as minhas ideias foi que, a cada nova função a arvore precisaria ser atualizada, por exemplo se eu adicionar uma nova tarefa ela precisa estar la quando eu for listar as tarefas, e não lembro de termos feito nada parecido em aula. Com isso, tive que utilizar de um commandloop que identifica qual a  função que o usuário está chamando e faz a chamada dentro do programa.

 
Teve um problema que não consegui corrigir, que foi a entrada de dados da função addTask ser correspondente ao necessário. Caso entrasse com dados inválidos só daria problema na hora de mostras as tarefas, acho que isso acontece por que o Haskell faz tratamento de erros em tempo de compilação.

Aprender como a Árvore Binária de Busca funcionava em Haskell foi um desafio, pois não havíamos visto isso ainda em aula. Reutilizei alguns códigos de manipulação da árvore binária de busca do StackOverflow e outros sites referenciados, mas sempre buscando compreender o funcionamento da estrutura, essa reutilização foi feita visando facilitar a escrita do código e mitigar pequenos erros de sintaxe ou algo assim.

Foi difícil para mim fazer a conversão de ideias para uma forma mais funcional/declarativa, pois todos os projetos maiores que fiz eram em linguagens imperativas.Algumas vezes fiquei confuso se estava fazendo correto, e se o sistema estava funcional/declarativo mas continuei fazendo, acredito que o principal foi o desafio, não consegui colocar em prática totalmente as ideias que tive, mas busquei fazer o mais próximo do que havia proposto.
No geral, estou satisfeito com a forma como este projeto se desenvolveu, foi bem desafiador e interessante me aprofundar um pouco mais em uma linguagem, até pouco tempo desconhecida para mim.

## Referências
- Material das aulas
- Haskell Language Official Website
- Haskell Wiki
- Stack Overflow
## SreenCast

Aqui está o link https://drive.google.com/file/d/1U_2R5z-W8GmdxHNilJkpVSN4vHOFgBt7/view?usp=sharing  para o ScreenCast, que explica rapidamente o código e faz uma demonstração de seu funcionamento.
