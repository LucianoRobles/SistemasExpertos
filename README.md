# Trabajo Práctico 2

### Autores:
- **Javier Robledo**  
- **Matías Crisnejo**
- **Luciano Robles**
- **Julian Diani**
- **Miriam Olson**
- **Valentino Chiapani**
- **Agustin Fiordalisi**
- **Octavio Cesio**
- **Juan Manuel Llanez Alzogaray**

### Institución:
- **Universidad Nacional de Hurlingham**

### Materia:
- **Lógica y Programación**

### Docente:
- **Pablo Miguel Angel Pandolfo**

### Tema:
- **Sistemas Expertos**

### Fecha:
- **23 de Junio de 2025**


# ¿Que es un Sistema Experto?
- **Un sistema experto es un programa de computadora que simula el comportamiento de un experto humano en un dominio específico. Su objetivo principal es resolver problemas complejos, tomar decisiones o dar recomendaciones tal como lo haría un especialista humano en ese campo.**

# Tipos de Sistemas Expertos
****

# Ejemplos de Sistemas Expertos
- **MYCIN**
    - **Uno de los primeros sistemas expertos, desarrollado para diagnosticar enfermedades bacterianas y recomendar tratamientos con antibióticos.** [Más Información](https://msmk.university/mycin/)


- **Dendral**
    - **Diseñado para ayudar a los químicos a identificar estructuras moleculares.** [Más Información](https://es.wikipedia.org/wiki/Dendral)


- **Deep Blue**
    - **Un sistema experto que venció a Garri Kaspárov en una partida de ajedrez.** [Más Información](https://datascientest.com/es/deep-blue-todo-sobre)


- **XCon**
    - **Un sistema que automatiza la configuración de sistemas informáticos.** [Más Información](https://es.wikipedia.org/wiki/XCon)


- **Watson (IBM)**
    - **Una plataforma de inteligencia artificial que ha demostrado su capacidad en una variedad de aplicaciones, incluyendo atención médica y finanzas.** [Más Información](https://www.techtarget.com/searchenterpriseai/definition/IBM-Watson-supercomputer)


- **CaDet**
    - **Ayuda en el diagnóstico temprano del cáncer.** [Más Información](https://pubmed.ncbi.nlm.nih.gov/9892994/)


- **DXplain**
    - **Ayuda a los médicos a diagnosticar diversas enfermedades.** [Más Información](https://www.mghlcs.org/projects/dxplain)


- **Dipmeter Advisor**
    - **Analiza datos de exploración petrolera.** [Más Información](https://en.wikipedia.org/wiki/Dipmeter_Advisor)


- **CADUCEUS**
    - **Se especializa en diagnósticos de medicina interna.** [Más Información](https://es.wikipedia.org/wiki/CADUCEUS_(sistema_experto)


# ¿Que es Prolog y como funciona?
**Prolog es un lenguaje de programación declarativo basado en lógica de predicados. En lugar de indicar paso a paso cómo resolver un problema, se describe un conjunto de hechos y reglas, y se realizan consultas. El motor de Prolog intenta demostrar esas consultas utilizando unificación y backtracking.**

**Los hechos son afirmaciones simples que representan la base de conocimiento del sistema.**

- *padre(juan, pedro).*


**Las reglas, representan relaciones lógicas entre los hechos.**
 - *progenitor(X, Y) :- padre(X, Y).*
**Las consultas, realizadas por el usuario, se realizan en un apartado de la interfaz donde se formulan preguntas al sistema.** 
 - *?- progenitor(X, pedro).*

**El mecanismo utilizado por prolog para responder a las consultas es la unificación, el sistema compara términos e intenta hacerlos coincidir mediante sustitución de variables.**

 *“padre(juan, Y). El sistema reemplaza la variable Y unificando con el hecho padre(juan, pedro), dando como resultado juan = Y.”*

**Cuando una consulta puede satisfacerse de más de una forma, el sistema utiliza la técnica de backtracking, que le permite volver al punto de decisión anterior y probar otra opción, para de esa manera encontrar todas las soluciones posibles, o confirmar que ninguna lo satisface.**


# ¿Cuál es su motor de inferencia? Elección de implementar el sistema experto
**Prolog es ideal para implementar sistemas expertos porque ya incluye un motor de inferencia incorporado. Este motor permite razonar automáticamente sobre los hechos y reglas para llegar a conclusiones, tal como lo haría un experto humano.**

**El motor de inferencia de Prolog funciona buscando respuestas lógicas a partir de las reglas definidas. Utiliza un proceso llamado resolución lógica, que compara lo que se pregunta con lo que se sabe, y deduce nueva información si es necesario. Este enfoque es el corazón de los sistemas expertos.**

- **Se elige Prolog porque:**

    - **Permite representar el conocimiento de forma simple y estructurada.**

    - **Su motor de inferencia resuelve automáticamente los problemas sin necesidad de programar los pasos.**

    - **Es fácil de modificar: se pueden agregar nuevas reglas sin reprogramar desde cero.**

    - **Está diseñado específicamente para aplicaciones basadas en lógica y reglas, como los sistemas expertos.**  
# SistemasExpertos
Repositorio para documentar un sistema experto, desarrollado en prolog.
4 \- Ejemplos de tipos de aplicaciones:

* #### MYCIN:

  * Uno de los primeros sistemas expertos, desarrollado para diagnosticar enfermedades bacterianas y recomendar tratamientos con antibióticos.   
    * [más información](https://msmk.university/mycin/)

* #### Dendral: 

  * Diseñado para ayudar a los químicos a identificar estructuras moleculares.   
    * [más información](https://es.wikipedia.org/wiki/Dendral)

* #### Deep Blue:

  *  Un sistema experto que venció a Garri Kaspárov en una partida de ajedrez.   
       * [más información](https://datascientest.com/es/deep-blue-todo-sobre)

* #### XCon: 

  *  Un sistema que automatiza la configuración de sistemas informáticos complejos. 

       * [más información](https://es.wikipedia.org/wiki/XCon)

* #### Watson (IBM):

  * Una plataforma de inteligencia artificial que ha demostrado su capacidad en una variedad de aplicaciones, incluyendo atención médica y finanzas.   
    * [más información](https://www.techtarget.com/searchenterpriseai/definition/IBM-Watson-supercomputer)

* #### CaDet: 

  * Ayuda en el diagnóstico temprano del cáncer.   
    * [más información](https://pubmed.ncbi.nlm.nih.gov/9892994/)

* #### DXplain:

  *  Ayuda a los médicos a diagnosticar diversas enfermedades.   
       * [más información](https://www.mghlcs.org/projects/dxplain)

* #### Dipmeter Advisor:

  *  Analiza datos de exploración petrolera.  
       * [más información](https://en.wikipedia.org/wiki/Dipmeter_Advisor)

* #### CADUCEUS:

  *  Se especializa en diagnósticos de medicina interna.  
       * [más información](https://es.wikipedia.org/wiki/CADUCEUS_\(sistema_experto\))  
      

6 \- 

Prolog es ideal para implementar sistemas expertos porque **ya incluye un motor de inferencia incorporado**. Este motor permite razonar automáticamente sobre los hechos y reglas para llegar a conclusiones, tal como lo haría un experto humano.

El motor de inferencia de Prolog funciona buscando respuestas lógicas a partir de las reglas definidas. Utiliza un proceso llamado **resolución lógica**, que compara lo que se pregunta con lo que se sabe, y deduce nueva información si es necesario. Este enfoque es el corazón de los sistemas expertos.

Se elige Prolog porque:

* Permite representar el conocimiento de forma **simple y estructurada**.  
* Su motor de inferencia resuelve automáticamente los problemas sin necesidad de programar los pasos.  
* Es fácil de modificar: se pueden agregar nuevas reglas sin reprogramar desde cero.  
* Está diseñado específicamente para **aplicaciones basadas en lógica y reglas**, como los sistemas expertos.

