class StockData {
  late final String previous;
  late final String next;
  late final List<Results> results = List.empty(growable: true);

  StockData(String previous, String next, String, List<Results> results);

  StockData.fromJson(Map<String, dynamic> json) {

    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  late final String empresa;
  late final String setor;
  late final String acao;
  late final String cotacao;
  late final String variacao_dia;
  late final String preco_teto;
  late final String preco_justo;
  late final String data_valuation;
  late final String risco;
  late final String dy_projetado;
  late final String inicio_recomendacao;
  late final String preco_entrada;
  late final String retorno_total;
  late final String sugestao;
  late final String desconto_teto;
  late final String potencial_valor;
  late final String divulgacao;

  Results(String empresa, String setor, String acao, String cotacao,
      String variacao_dia, String preco_teto, String preco_justo,
      String data_valuation, String risco, String dy_projetado,
      String inicio_recomendacao, String preco_entrada, String preco_retorno,
      String sugestao, String desconto_teto, String potencial_valor,
      String divulgacao);

  Results.fromJson(Map<String, dynamic> json) {
    empresa = json['empresa'];
    setor = json['setor'];
    acao = json['acao'];
    cotacao = json['cotacao'];
    variacao_dia = json['variacao_dia'];
    preco_teto = json['preco_teto'];
    preco_justo = json['preco_justo'];
    data_valuation = json['data_valuation'];
    risco = json['risco'];
    dy_projetado = json['dy_projetado'];
    inicio_recomendacao = json['inicio_recomendacao'];
    preco_entrada = json['preco_entrada'];
    retorno_total = json['retorno_total'];
    sugestao = json['sugestao'];
    desconto_teto = json['desconto_teto'];
    potencial_valor = json['potencial_valor'];
    divulgacao = json['divulgacao'];
  }
}
