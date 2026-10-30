# Preparación — Del iPhone al escritorio

Este laboratorio parte de la rama **`lab-macos`**. El proyecto inicial compila y contiene ejercicios pequeños para completar siguiendo la [guía paso a paso](codelab/macos.html).

## Obtén la base del laboratorio

Desde tu clon del fork, ejecuta `git status` y guarda cualquier cambio pendiente en tu rama anterior. Comprueba con `git remote -v` que origin apunta a tu fork. Sustituye `tu-alias` por un nombre propio sin espacios y ejecuta:

```bash
git fetch https://github.com/franzueto/TODOiOSLab.git lab-macos
git switch -c lab/macos-tu-alias FETCH_HEAD
open codelab/macos.html
open macOS/TODOMacLab.xcodeproj
```

Ejecuta switch inmediatamente después de fetch: `FETCH_HEAD` representa la rama que acabas de descargar. No necesitas que esa rama ya exista en tu fork ni cambiar origin. Tu trabajo anterior permanece en su rama. Si el nombre de rama de trabajo ya existe, elige uno nuevo, por ejemplo con sufijo `-2`.

## Antes de ejecutar

Selecciona el esquema TODOMacLab y el destino My Mac. El proyecto tiene firma para ejecución local y no requiere una Apple Account ni simulador.

Xcode 27.1, tu clon y tu acceso a GitHub deben estar preparados. No hay paquetes externos que instalar. La guía y la app funcionan offline; GitHub requiere internet para obtener la rama y entregar el trabajo.

## Entrega

Trabaja en tu rama `lab/macos-tu-alias`, guarda al menos dos commits propios y abre un PR nuevo hacia **main de tu fork**, con las capturas indicadas por la guía. El diff puede incluir la base preparada; explica cuáles son tus cambios personales.

Si GitHub carga la plantilla anterior, reemplaza la descripción con el contenido de `.github/pull_request_template.md` de tu rama actual. Deja el PR abierto, comparte su enlace y revoca tu token temporal al terminar.
