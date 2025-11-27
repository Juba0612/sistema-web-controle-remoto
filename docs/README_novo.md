# Projeto Integrador SCOM + LCON: Sistema Web para Controle Remoto e Monitoramento

Este repositório contém o código-fonte e a documentação do projeto integrador das disciplinas de Sistemas Computacionais (SCOM) e Laboratório de Sistemas de Controle (LCON).

O objetivo é desenvolver um sistema web completo (Frontend, API, Banco de Dados) para monitorar e controlar em tempo real um sistema físico (soprador térmico, tanques ou motor CC) conectado a um microcontrolador ESP.

## Arquitetura Geral do Sistema

A arquitetura foi definida com base nos requisitos e sugestões do documento do projeto, priorizando tecnologias modernas, seguras e escaláveis.

| Módulo | Tecnologias Escolhidas | Justificativa |
| :--- | :--- | :--- |
| **Microcontrolador (ESP)** | **ESP32** com C++ (Arduino Core) | Escolhido pela sua capacidade de processamento dual-core e recursos de segurança, superior ao ESP8266. |
| | Bibliotecas: `WiFi.h`, `HTTPClient.h`, `ArduinoJson.h` | Para conectividade Wi-Fi, requisições HTTP à API e serialização de dados. |
| **API (Backend)** | **Node-RED** | Integrando os conhecimentos aprendidos na disciplina de Redes Industriais de COmunicação, desenvolvendo um servidor. Além disso, foi aproveitada a função de criação de dashboard da ferramenta.|
| **Banco de Dados** | **MySQL** | Utilizando o XAMPP e requisitos de criptografia. |
| **Frontend (Web)** | **php** unido a HTML/CSS | Para atualização em tempo real (WebSocket), visualização de dados (gráficos) e comunicação assíncrona com a API. |
| **Comunicação** | **HTTP (REST API)** e **WebSockets** | HTTP para envio de leituras (ESP->API) e comandos (User->API). WebSockets para envio de dados em tempo real (API->Frontend). |

## Estrutura de Pastas do Repositório

Os documentos de SCOM estão dentro de docs > SCOM > (atividade)