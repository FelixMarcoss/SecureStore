class DetectionEvent {
  final String id;
  final DateTime detectedAt;
  final String? suspectName;       // rp.name (nome_suspeito)
  final String? riskLevel;         // rp.risk_level (nivel_risco)
  final double confidenceScore;    // de.confidence_score (precisao_ia)
  final String originStoreName;    // de.origin_store_name (loja_onde_passou)

  DetectionEvent({
    required this.id,
    required this.detectedAt,
    this.suspectName,
    this.riskLevel,
    required this.confidenceScore,
    required this.originStoreName,
  });

  factory DetectionEvent.fromJson(Map<String, dynamic> json) {
    return DetectionEvent(
      id: json['id'] as String,
      detectedAt: DateTime.parse(json['detected_at'] as String),
      suspectName: json['nome_suspeito'] as String?,
      riskLevel: json['nivel_risco'] as String?,
      confidenceScore: (json['precisao_ia'] as num).toDouble(),
      originStoreName: json['loja_onde_passou'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'detected_at': detectedAt.toIso8601String(),
      'nome_suspeito': suspectName,
      'nivel_risco': riskLevel,
      'precisao_ia': confidenceScore,
      'loja_onde_passou': originStoreName,
    };
  }
}
