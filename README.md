# SecureStore — interface de monitoramento de acesso

Protótipo em Flutter de um painel móvel para acompanhar eventos de detecção em entradas de uma loja. O projeto explora como apresentar risco, confiança da identificação, origem do evento e histórico em uma interface que possa ser lida rapidamente.

> **Estado do projeto:** protótipo visual. Os eventos são dados de exemplo definidos no aplicativo. A área de câmera é uma simulação visual; não há captura de vídeo, reconhecimento facial, autenticação nem conexão ativa com um servidor.

## O que o protótipo mostra

- painel de monitoramento com indicador visual de atividade e área reservada para câmera;
- cartão de destaque para uma detecção prioritária;
- linha do tempo com horário, local, nível de risco e confiança;
- navegação inferior que alterna o estado visual das abas Monitor, Alerts e Profile;
- tema escuro e componentes reutilizáveis para um contexto de operação de segurança.

O modelo [`DetectionEvent`](lib/models/detection_event.dart) converte os campos `detected_at`, `nome_suspeito`, `nivel_risco`, `precisao_ia` e `loja_onde_passou` de/para JSON. Essa estrutura prepara a interface para receber dados, mas o repositório ainda não inclui essa integração.

## Tecnologias e organização

| Parte | Implementação |
| --- | --- |
| Interface | Flutter, Dart e Material |
| Estilo | Tema e tokens em [`lib/design_system.dart`](lib/design_system.dart) |
| Tela principal | Widgets e dados de demonstração em [`lib/entry_guard_screen.dart`](lib/entry_guard_screen.dart) |
| Modelo de evento | [`lib/models/detection_event.dart`](lib/models/detection_event.dart) |

O arquivo [`DESIGN.md`](DESIGN.md) registra as decisões visuais do protótipo.

## Executar

Com o Flutter instalado e um dispositivo ou emulador disponível:

```bash
flutter pub get
flutter run
```

Para conferir o ambiente, execute `flutter doctor`.

## Limites e próximos passos

Os botões de ação e as abas ainda não abrem fluxos funcionais. Uma integração real exigiria fonte de vídeo, API de eventos, autenticação, tratamento de permissões e validação dos dados recebidos. O indicador “LIVE” faz parte da demonstração visual e não confirma uma conexão ativa.
