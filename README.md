# Teste de Desenvolvimento Flutter

Este é um teste de desenvolvimento Flutter que avalia a sua capacidade de consumir APIs, gerenciar estado, criar uma interface de usuário limpa e seguir as melhores práticas de codificação.

## Requisitos obrigatórios

- **Recuperar dados de APIs**: Use a API AlphaVantage para recuperar dados de duas séries temporais - a série diária ajustada e a série intradiária. As URLs da API são fornecidas abaixo:
    - https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=demo 
    - https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo 

- **Exibir dados**: Mostre os dados recuperados em um formato claro e organizado na tela. Cada conjunto de informações deve estar contido em um contêiner separado.

- **Favoritar dados**: Dê ao usuário a capacidade de favoritar conjuntos de dados.

- **Ordenar dados**: Permita ao usuário ordenar a lista de conjuntos de dados por dois atributos de sua escolha.

- **Visualizar Favoritos**: Implemente uma funcionalidade para permitir que o usuário veja as informações que foram marcadas como favoritas.

- **Gerenciamento de estado**: Use o padrão Bloc/Cubit para gerenciamento de estado. 

- **Widgets Responsivos**: Certifique-se de que os widgets são responsivos e se adaptam a diferentes tamanhos de tela.

- **Boas práticas de código**: Siga as melhores práticas de codificação, mantendo uma estrutura de código limpa e organizada. Nomes de variáveis, funções e classes devem ser claros e significativos. Implemente testes para validar o funcionamento do aplicativo.

## Requisitos opcionais

- **Tratamento de erros**: Implementar um robusto tratamento de erros para lidar com qualquer falha potencial da API.

- **Recarga / atualização de dados**: Implemente uma opção para permitir que os usuários recarreguem ou atualizem os dados.

- **Cache de dados**: Implemente um sistema de cache que armazena os dados localmente e os usa quando não há conexão com a internet.

- **Filtros**: Permita que os usuários apliquem filtros aos dados exibidos.

- **Documentação**: Documente seu código para facilitar o entendimento por outras pessoas.

- **Testes de unidade e e2e**: Além dos testes básicos e de unidade, implemente testes de ponta a ponta (e2e) para validar a experiência do usuário do início ao fim.

- **Animações**: Use animações sutis para aumentar o polimento e o profissionalismo do seu aplicativo.

- **Internacionalização**: Faça o aplicativo estar pronto para ser internacionalizado.

- **Acessibilidade**: Torne seu aplicativo acessível a todos os usuários.

- **Tema escuro / claro**: Permita a troca entre o tema claro e escuro.

Lembre-se, esses recursos opcionais são sugeridos para demonstrar uma compreensão mais profunda do Flutter e para melhorar a experiência do usuário, mas não são estritamente necessários para a conclusão do teste.

Boa sorte!
