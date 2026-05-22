# 🤖 Telegram AI Agent con Cohere y MySQL

Este repositorio contiene la arquitectura y el flujo de automatización para un Agente de Inteligencia Artificial integrado con Telegram. El agente es capaz de mantener conversaciones con contexto, consultar información estructurada en bases de datos relacionales y realizar búsquedas semánticas.

## 🏗️ Arquitectura del Flujo

El proyecto está diseñado mediante un flujo de orquestación visual que integra los siguientes nodos y servicios:

* **Trigger (Entrada):** `Telegram Trigger`. Escucha y captura los mensajes entrantes de los usuarios a través de un bot de Telegram.
* **Agente Principal:** `AI Agent`. Orquesta la lógica del modelo y decide qué herramientas utilizar basándose en la solicitud del usuario.
    * **LLM (Chat Model):** `Cohere Chat Model`. Motor principal de procesamiento de lenguaje natural.
    * **Memoria:** `Simple Memory`. Mantiene el contexto de la conversación para interacciones fluidas.
* **Herramientas (Tools):**
    * **Vector Database:** `Simple Vector Store`. Almacena y recupera información no estructurada utilizando `Embeddings Cohere` para la generación de vectores (RAG - Retrieval-Augmented Generation).
    * **Relational Database:** Conexión a `MySQL`. Permite al agente ejecutar consultas `SELECT` sobre tablas específicas para recuperar datos estructurados en tiempo real.
* **Acción (Salida):** `Telegram (Send a text message)`. Devuelve la respuesta procesada por el agente de IA directamente al chat del usuario.

## 🚀 Requisitos Previos

Para desplegar y ejecutar este flujo, necesitarás:

1.  Una instancia de la plataforma de automatización (ej. n8n) instalada en local o en la nube.
2.  Credenciales / API Keys de:
    * **Telegram Bot API** (Obtenido a través de *BotFather*).
    * **Cohere API** (Para el modelo de chat y los embeddings).
3.  Una base de datos **MySQL** accesible, con las tablas y permisos de lectura configurados.

## 🛠️ Instalación y Configuración

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/tu-usuario/telegram-ai-agent-workflow.git](https://github.com/tu-usuario/telegram-ai-agent-workflow.git)
    ```
2.  **Importar el Flujo:**
    * Abre tu plataforma de automatización.
    * Importa el archivo `workflow/ai_agent_flow.json`.
3.  **Configurar Credenciales:**
    * Dentro del flujo, actualiza los nodos de Telegram, Cohere y MySQL con tus credenciales de entorno de desarrollo o producción.
4.  **Base de Datos:**
    * Ejecuta el script `sql/schema.sql` en tu servidor MySQL para asegurar que la estructura de la tabla coincida con lo que el Agente espera consultar.
5.  **Activar el Flujo:**
    * Asegúrate de que el flujo esté activo ("Active") para que el webhook de Telegram comience a escuchar eventos.

## 🛡️ Consideraciones de Seguridad

* **No expongas credenciales:** Asegúrate de que las API Keys y contraseñas de la base de datos estén gestionadas mediante variables de entorno o el gestor de credenciales seguro de la plataforma.
* **Permisos de MySQL:** El usuario de MySQL utilizado por el agente debe tener estrictamente privilegios de solo lectura (`SELECT`) para evitar inyecciones SQL maliciosas o alteraciones de la base de datos.
