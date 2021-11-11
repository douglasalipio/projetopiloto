class StockData {
  String previous;
  String next;
  List<Results> results;

  StockData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  String empresa;
  String setor;
  String acao;
  String cotacao;
  String variacao_dia;
  String preco_teto;
  String preco_justo;
  String data_valuation;
  String risco;
  String dy_projetado;
  String inicio_recomendacao;
  String preco_entrada;
  String retorno_total;
  String sugestao;
  String desconto_teto;
  String potencial_valor;
  String divulgacao;

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
