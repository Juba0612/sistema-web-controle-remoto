# Projeto Integrador SCOM + LCON: Sistema Web para Controle Remoto e Monitoramento

Este repositório contém o código-fonte e a documentação do projeto integrador das disciplinas de Sistemas Computacionais (SCOM) e Laboratório de Sistemas de Controle (LCON).

O objetivo é desenvolver um sistema web completo (Frontend, API, Banco de Dados) para monitorar e controlar em tempo real um sistema físico (soprador térmico, tanques ou motor CC) conectado a um microcontrolador ESP.

## 1. Arquitetura Geral do Sistema

A arquitetura foi definida com base nos requisitos e sugestões do documento do projeto, priorizando tecnologias modernas, seguras e escaláveis.

| Módulo | Tecnologias Escolhidas | Justificativa |
| :--- | :--- | :--- |
| **Microcontrolador (ESP)** | **ESP32** com C++ (Arduino Core) | Escolhido pela sua capacidade de processamento dual-core e recursos de segurança, superior ao ESP8266. |
| | Bibliotecas: `WiFi.h`, `HTTPClient.h`, `ArduinoJson.h` | Para conectividade Wi-Fi, requisições HTTP à API e serialização de dados. |
| **API (Backend)** | **PHP 8+** com Framework **Laravel** | Sugerido no documento. Oferece um ecossistema robusto para rotas RESTful, ORM (Eloquent) e mecanismos nativos de autenticação e criptografia. |
| **Banco de Dados** | **MySQL** | Alta compatibilidade com Laravel (Eloquent) e possui funções nativas (`AES_ENCRYPT`/`AES_DECRYPT`) que cumprem o requisito de criptografia em repouso. |
| **Frontend (Web)** | **JavaScript (ES6+)** com Framework **React.js** | Ideal para a criação de dashboards interativos e responsivos, conforme sugerido. |
| | Bibliotecas: `Socket.IO`, `Chart.js`, `Axios` | Para atualização em tempo real (WebSocket), visualização de dados (gráficos) e comunicação assíncrona com a API. |
| **Comunicação** | **HTTP (REST API)** e **WebSockets** | HTTP para envio de leituras (ESP->API) e comandos (User->API). WebSockets para envio de dados em tempo real (API->Frontend). |

## 2. Estrutura de Pastas do Repositório

O projeto segue uma estrutura de monorepo, separando os três componentes principais (firmware, backend, frontend) e a documentação.
## 3. Especificação da API e Formato dos Dados

A API servirá como o cérebro do sistema, gerenciando autenticação, recebimento de dados, envio de comandos e criptografia.

**Formato Padrão de Dados:** `application/json`

---

### Endpoints de Autenticação (Usuário)

* `POST /api/register`
    * **Descrição:** Registra um novo usuário no sistema.
    * **Entrada (JSON):** `{ "name": "...", "email": "...", "password": "..." }`
    * **Saída (JSON):** `{ "user": { ... }, "token": "jwt_token" }`

* `POST /api/login`
    * **Descrição:** Autentica um usuário e retorna um token JWT.
    * **Entrada (JSON):** `{ "email": "...", "password": "..." }`
    * **Saída (JSON):** `{ "user": { ... }, "token": "jwt_token" }`

* `POST /api/logout`
    * **Descrição:** Invalida o token JWT do usuário.
    * **Autenticação:** Requer Token JWT.
    * **Saída (JSON):** `{ "message": "Logout realizado com sucesso." }`

---

### Endpoints de Comunicação (ESP ↔ API)

* `POST /api/leitura`
    * **Descrição:** Usado pelo ESP para enviar dados de sensores para o servidor.
    * **Autenticação:** Requer Chave de API (API Key) do dispositivo.
    * **Entrada (JSON):** `{ "sensor": "temperatura", "valor": 45.2, "timestamp_esp": 1678886400 }`
    * **Saída (JSON):** `{ "status": "recebido" }`

* `GET /api/parametro`
    * **Descrição:** Usado pelo ESP para solicitar (fazer "polling") novos parâmetros de controle.
    * **Autenticação:** Requer Chave de API (API Key).
    * **Entrada (Query String):** `?parametro=setpoint_temp`
    * **Saída (JSON):** `{ "parametro": "setpoint_temp", "valor": 50.0 }`

---

### Endpoints de Interface (Frontend ↔ API)

* `POST /api/parametro`
    * **Descrição:** Usado pelo dashboard (usuário) para definir um novo parâmetro de controle.
    * **Autenticação:** Requer Token JWT de usuário.
    * **Entrada (JSON):** `{ "parametro": "setpoint_temp", "valor": 55.0 }`
    * **Saída (JSON):** `{ "status": "comando_atualizado" }`

* `GET /api/historico`
    * **Descrição:** Retorna dados históricos (decriptados) para os gráficos do dashboard.
    * **Autenticação:** Requer Token JWT de usuário.
    * **Entrada (Query String):** `?sensor=temperatura&inicio=1678880000&fim=1678886400`
    * **Saída (JSON):** `[ { "valor_decriptado": 45.2, "timestamp": ... }, { ... } ]`

* `GET /api/logs`
    * **Descrição:** Retorna logs de sessão (acesso administrativo).
    * **Autenticação:** Requer Token JWT de Admin.
    * **Saída (JSON):** `[ { "user_id": 1, "action": "login", "ip": "...", "timestamp": ... }, ... ]`

---

### Comunicação em Tempo Real (WebSocket)

* **Canal:** `dashboard-realtime`
* **Evento:** `nova_leitura`
* **Descrição:** Quando a API recebe uma nova leitura do ESP via `POST /api/leitura`, ela armazena o dado criptografado e, em paralelo, transmite o dado decriptado via WebSocket para todos os dashboards conectados.
* **Dado (JSON):** `{ "sensor": "temperatura", "valor_decriptado": 45.2, "timestamp": ... }`

## 4. Diagrama de Fluxo de Dados

O diagrama visual (PNG) que ilustra os fluxos abaixo está salvo em: `/docs/diagrama_fluxo_dados.png`.

### Fluxo 1: Leitura de Sensor (ESP → Dashboard em Tempo Real)

1.  **[Sistema Físico]** gera um dado (ex: 45°C).
2.  **[ESP]** Lê o dado via sensor.
3.  **[ESP]** Formata um JSON: `{ "sensor": "temp", "valor": 45 }`.
4.  **[ESP]** Envia uma requisição `POST /api/leitura` para a API (com sua API Key).
5.  **[API Backend]** Recebe a requisição e autentica o ESP.
6.  **[API Backend]** **Criptografa** o valor "45" (ex: `AES_ENCRYPT`).
7.  **[API Backend]** Salva o dado criptografado (`"xyz..."`) no **[Banco de Dados MySQL]**.
8.  **[API Backend]** Responde ao ESP com `{ "status": "recebido" }`.
9.  **[API Backend]** (Em paralelo) Emite um evento `nova_leitura` no canal **WebSocket** com o dado original/decriptado: `{ "sensor": "temp", "valor": 45 }`.
10. **[Frontend Dashboard]** (Ouvindo o WebSocket) recebe o evento.
11. **[Frontend Dashboard]** Atualiza o gráfico do `Chart.js` em tempo real.

### Fluxo 2: Envio de Comando (Usuário → ESP)

1.  **[Frontend Dashboard]** Usuário (logado) digita "50" no formulário de "Setpoint".
2.  **[Frontend Dashboard]** Envia `POST /api/parametro` (com Token JWT) e o JSON: `{ "parametro": "setpoint_temp", "valor": 50 }`.
3.  **[API Backend]** Recebe a requisição e autentica o usuário (JWT).
4.  **[API Backend]** Salva (ou atualiza) esse novo parâmetro na tabela `configuracoes` do **[Banco de Dados MySQL]**.
5.  **[API Backend]** Retorna `{ "status": "comando_atualizado" }` para o Frontend.
6.  *(O fluxo do usuário termina aqui)*.
7.  ...
8.  *(Alguns segundos depois)* **[ESP]** executa sua rotina de "polling".
9.  **[ESP]** Envia uma requisição `GET /api/parametro?parametro=setpoint_temp` (com sua API Key).
10. **[API Backend]** Recebe a requisição e autentica o ESP.
11. **[API Backend]** Consulta o **[Banco de Dados]** e busca o valor mais recente para "setpoint_temp", que agora é "50".
12. **[API Backend]** Retorna o JSON: `{ "parametro": "setpoint_temp", "valor": 50 }`.
13. **[ESP]** Recebe a resposta, analisa o JSON e entende que o novo setpoint é 50.
14. **[ESP]** Ajusta o atuador (ex: PWM do aquecedor) no **[Sistema Físico]**.
