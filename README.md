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
