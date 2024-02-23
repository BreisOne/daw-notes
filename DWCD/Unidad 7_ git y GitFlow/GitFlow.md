
# GitFlow

En mis gist:

https://gist.github.com/dfleta/78d991237155fdd061c3b22fad7a12f8

Conviene leer este artículo para entender los comandos `git`:

[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

GitFlow define dos tipos de ramas, las principales y las auxiliares. Las principales diferencias entre estos dos grupos de ellas son:

## Ramas Principales (master y develop):

 - No se pueden instanciar
 - Su nombre no tiene complementos, se llaman master y develop “a secas”
 - No se puede commitear código directamente sobre ella, para no perder el control de los cambios, solo recibe merges de otras ramas

Ramas Auxiliares (feature, release y hotfix):
 - Se pueden instanciar tantas veces como características, versiones y defectos haya. No hay límite.
 - Su nombre consta de una raíz, que corresponde al tipo de rama, más la característica implementada o versión. Este complemento la hace inconfundible
 - El objetivo es trabajar directamente sobre ella, subiendo código código a la rama. Luego se mergea con las ramas principales. 

-----------------

## La rama master 

La rama master es la rama principal del repositorio y contiene el código que está actualmente en producción o próximo a subir en una situación estable.

No se hace commit de código de ella, salvo circunstancias muy especiales y por alguien con altos conocimientos en el producto.

Por regla general, recibe merges de ramas release o hotfix. En esta rama están etiquetadas todas las versiones del producto.

------------------

## La rama develop

La rama develop es la rama principal del repositorio que contiene, además del contenido de master, características desarrolladas que aún no están en producción.

En esta rama se está desarrollando código de forma continua, eso sí, todo el contenido que recibe a través de merges de ramas features principalmente, está testeado y verificado, por lo que es código estable.

No se hace commit de código de ella, salvo circunstancias muy especiales, al igual que en la rama master.

El principal objetivo de esta rama es evitar conflictos es master, por lo que el código se depura en esta rama primero.

-------------------

## Rama feature

Cada vez que se va a desarrollar una nueva funcionalidad o modificar una existente, se genera una rama de tipo feature, a partir de develop, cuyo nombre está formado por esta palabra y por la característica a implementar, por ejemplo: “feature/nueva-interfaz”.

Sobre ella se sube el código a través de commits del equipo que debe ser probado antes de mergear con develop, por lo que durante este proceso hay una funcionalidad en curso codificándose, pudiendo trabajar varios miembros a la vez en ella.

Una buena práctica es hacerlas lo más atómicas posibles, pudiendo generar más de una para cubrir una característica y mergeando código de unas a otras.

--------------------

## Rama release

Estas ramas se generan cuando quiere realizarse la tentativa de entrega de una versión, habitualmente cuando se aproxima la finalización de un sprint.

Esto congela los desarrollos, que prosiguen en develop, y agrupa una serie de nuevas características en la nueva rama release, que puede llamarse, por ejemplo: “release/v2.2.0”.

Sobre ella pueden realizarse pequeños cambios, corrección de defectos, establecer versiones de producto… pero no desarrollar nuevas características. Una vez finalizado y testeado, se mergea con master, como nueva versión que es candidata a subir a producción; y con develop, ya que hay defectos corregidos que deben volcarse a la rama de desarrollo.

---------------------

## Rama hotfix

Estas ramas se generan habitualmente cuando se detecta un defecto en producción que debe ser corregido con agilidad. Para ello se genera una rama de tipo hotfix, que parte del código existente en master.

Sobre ella pueden realizarse las correcciones que sean necesarias para arreglar el bug, para luego volver a mergear con master, añadiéndole un nuevo tag de versión.

También es necesario mergear con develop para que el defecto también quede corregido en desarrollo.

-----------------------

## Uniéndolo todo


------------------

# Comandos gitflow

GitFlow también es una librería que dispone de una serie de comandos git de alto nivel que se simplifica el uso de los comandos originales y lo adaptan al flujo de trabajo propuesto anteriormente.

Aun así, hay puristas que prefieren utilizar los comandos originales para sentir más el control sobre el repositorio.

------------------
## Instalación de la extensión GitFlow

Gitflow puede instalarse en cualquier equipo Windows, Linux o macOS de la siguiente forma:

### MacOS

Git instalado y funcional: 

`$ git`

Instalación con Homebrew: 

`$ brew install git-flow-avh`

Instalación con Macports: 

`$ port install git-flow-avh`

Instalación correcta: 

`$ git flow`
`$ git flow version`

### Linux

Git instalado y funcional: 

`$ git`

Instalación de la extensión en Debian / Ubuntu: 

`$ apt-get install git-flow`

Instalación de la extensión en CentOS / RedHat / Fedora: 

`$ sudo dnf install gitflow`

Instalación correcta: 

`$ git flow / $ git flow version`


### Windows

Git instalado y funcional: 

`$ git`

Git for Windows incluye GitFlow por defecto.

Instalación correcta:

`$ git flow`

`$ git flow version`

### Inicializar repo

Para iniciar un repositorio desde cero solo es necesario escribir los siguientes comandos:

```sh
$ mkdir gitflow-Project
$ git flow init
$ git branch
```

Esto generará un repositorio inicial basado en gitflow y con las ramas principales ya creadas.

----------------

### Ramas master y develop

Nuevo repositorio:

`$ git flow init`

Merge de rama develop con master

`$ git checkout master`

`$ git merge --no-ff develop`

Subir rama al repositorio remoto

`$ git push origin master`

--------------------

## Comandos de Ramas Feature

Comandos disponibles a nivel de feature:

`$ git flow feature help`

Visualizar lista de ramas de tipo feature

`$ git flow feature list`

Inicia una nueva rama de tipo feature a partir de develop

`$ git flow feature start <nombre>`

Publica rama en el repositorio remoto (Pair Programming) 

`$ git flow feature publish <nombre>`

Descarga una rama del repositorio remoto (Pair Programming)

`$ git flow feature track <nombre>`

Descarga el contenido de una feature del repositorio remoto

`$ git flow feature pull origin <nombre>`

Finaliza una rama feature, mergeando con develop

`$ git flow feature finish <nombre>`

Elimina la rama del repositorio local 

`$ git flow feature delete <nombre>`

-----------------------

## Comandos release

Comandos disponibles a nivel de release

`$ git flow release help`

Visualizar lista de ramas de tipo release 

`$ git flow release list`

Inicia una nueva rama de tipo release a partir de develop

`$ git flow release start <versión>`

Publica rama en el repositorio remoto (Pair Programming) 

`$ git flow release publish <versión>`

Descarga una rama del repositorio remoto (Pair Programming)

`$ git flow release track <versión>`

Finaliza una rama release, mergeando con develop y master 

`$ git flow release finish <versión>`

Elimina la rama del repositorio local 

`$ git flow release delete <versión>`

-----------------------

## Comandos ramas hotfix

Comandos disponibles a nivel de hotfix  

`$ git flow hotfix help`

Visualizar lista de ramas de tipo hotfix  

`$ git flow hotfix list`

Inicia una nueva rama de tipo hotfix a partir de master  

`$ git flow hotfix start <versión>`

Publica rama en el repositorio remoto (Pair Programming)  

`$ git flow hotfix publish <versión>`

Finaliza una rama hotfix, mergeando con develop y master  

`$ git flow hotfix finish <versión>`

Elimina la rama del repositorio local  

`$ git flow hotfix delete <versión>`
