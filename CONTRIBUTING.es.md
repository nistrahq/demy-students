# Guía de Colaboración (iOS)

Idiomas disponibles:
- [Inglés](CONTRIBUTING.md)
- [Español](CONTRIBUTING.es.md)

Este repositorio contiene la **aplicación móvil iOS** del proyecto **DemyStudents**, desarrollada con **Swift**, **SwiftUI**, **MVVM**, **Clean Architecture** y una estructura **feature-based**.  
Esta guía define cómo trabajamos en equipo para mantener un flujo ordenado, escalable y consistente.

---

## 1) Introducción rápida

### Requisitos
- **Xcode (última versión estable)**
- **Swift 5+**
- **iOS SDK 17+**
- Simulador o dispositivo físico con iOS 15+  

### Clonar el repositorio
`  
git clone <REPOSITORY-URL>  
cd <REPO-NAME>  
`

### Configurar tu usuario de Git
`  
git config --global user.name "Tu Nombre"  
git config --global user.email "tu.email`example.com"  
`

### Abrir el proyecto
1. Abre **Xcode** → *Open* → selecciona la carpeta del repo.
2. Espera a que Swift Package Manager resuelva dependencias.
3. Verifica configuración:
   - Equipo (Team)
   - Bundle ID
   - Target seleccionados correctamente
   - Deployment target adecuado

### Compilar y ejecutar
`  
# Compilar
⌘B

# Ejecutar en simulador o dispositivo
⌘R

# Ejecutar tests unitarios
⌘U

# SwiftLint (si está habilitado)
swiftlint  
`  

> Consejo: Si es tu primera contribución, crea primero una rama feature (ver *Workflow de Git*).

---

## 2) Workflow de Git

- Repositorio central: **GitHub**.  
- Rama principal: `main`  
- Modelo de ramas: **Gitflow** adaptado para iOS:
    - `main`: versiones estables (hitos académicos)
    - `develop`: integración de nuevas funcionalidades
    - Ramas adicionales:
        - `feature/<tema>` → nuevas funciones  
          Ej.: `feature/authentication-flow`
        - `hotfix/<nombre>` → correcciones críticas  
          Ej.: `hotfix/fix-session-crash`
        - `release/vX.Y.Z` → preparación de versión  
          Ej.: `release/v1.0.0`

### Mantener tu rama actualizada (desde `develop`)
`  
git checkout feature/authentication  
git fetch origin  
git merge origin/develop  
git push origin feature/authentication  
`

### Crear una nueva rama feature (desde `develop`)
`  
git checkout develop  
git pull origin develop  
git checkout -b feature/<tu-tema>  
`

---

## 3) Mensajes de commit (Conventional Commits)

Usamos **Conventional Commits** con un **scope opcional** para indicar el módulo o área afectada.

### Formato
`  
<type>(<scope>): <mensaje>  
`

### Tipos comunes
- `feat` → nueva funcionalidad (pantalla/flujo)
- `fix` → corrección de bug
- `refactor` → mejora interna sin cambiar el comportamiento
- `perf` → mejoras de rendimiento (SwiftUI, recomposición, etc.)
- `docs` → documentación
- `build` → cambios en el proyecto o dependencias SPM
- `ci` → pipelines GitHub Actions
- `test` → tests unitarios
- `style` → formato (sin cambios lógicos)

### Scopes sugeridos (iOS)
- `feature_auth`, `feature_home`, `feature_profile`
- `ui`, `navigation`, `core`, `data`, `network`, `storage`, `i18n`, `a11y`

### Ejemplos
`  
feat(feature_auth): implementar vista de SignIn y ViewModel  
fix(ui): corregir padding del HomeView  
refactor(core): extraer HTTPClient a Core/Network  
perf(feature_home): optimizar actualizaciones de estado  
docs(readme): agregar instrucciones de setup  
build(spm): actualizar dependencias Swift Package  
`

---

## 4) Pull Requests (PR)

- **Rama base:** `develop` (nunca `main`)
- Usa la plantilla de PR y explica claramente **qué** cambiaste y **por qué**
- Si aplica, vincula Issues con: `Closes #<número>`
- Solicita revisión de al menos **un compañero**
- Estrategia de merge: **Merge commit** (para conservar el historial)

### Checklist antes de abrir un PR
- [ ] La rama `feature/*` está sincronizada con `origin/develop`
- [ ] El proyecto compila sin errores (⌘B)
- [ ] Los tests unitarios pasan (⌘U)
- [ ] La UI fue probada en simulador/dispositivo
- [ ] No se cometieron secretos, llaves o tokens
- [ ] Los commits siguen **Conventional Commits**
- [ ] Se incluyeron capturas/video si se cambió la UI

---

## 5) Alcance de los cambios

- Un **único cambio lógico por PR**  
- Respeta la estructura:
  - `Features/<Feature>/Data`
  - `Features/<Feature>/Domain`
  - `Features/<Feature>/Presentation`
  - `Core/` para módulos compartidos
- Sigue MVVM:
  - View → ViewModel → UseCase → Repository → DataSource
- Mantén la consistencia en todos los features
- Actualiza AppRouter y DIContainer claramente cuando sea necesario

---

## 6) Estilo de código y convenciones

Este proyecto usa **Swift + SwiftUI**.

### Reglas generales
- Codificación UTF-8
- Máx. 120 caracteres por línea
- Indentación de 4 espacios
- Un tipo principal por archivo (View, ViewModel, etc.)
- Sin código comentado innecesario

### Convenciones Swift
- Tipos (struct/class/enum): PascalCase  
- Variables y funciones: camelCase  
- Constantes: UPPER_SNAKE_CASE  
- Preferir `struct` sobre `class`  
- Usar `protocols` para abstracciones  
- Mantener las capas Data/Domain/Presentation bien separadas

### SwiftUI
- Usar ``StateObject`, ``ObservedObject`, ``EnvironmentObject` adecuadamente
- Views declarativas y sin lógica pesada
- Previews útiles para pantallas principales
- Componentes reutilizables dentro del feature
- Evitar recomposiciones innecesarias (split de Views)

---

## 7) Prácticas de testing

- Escribir **tests unitarios** para:
  - ViewModels
  - UseCases
  - Repositories
- Mantener los tests rápidos y deterministas
- Usar mocks/fakes para dependencias

### Ejecutar tests
`  
⌘U  
`

### Guías
- Nombres descriptivos: `test_signInFailsWithInvalidPassword()`
- Una única intención por test
- Evitar tests inestables (timings, dependencias externas)

---

## 8) Buenas prácticas

- Una feature por rama/PR
- PRs pequeños y enfocados
- Commit messages claros (Conventional Commits)
- Probar en **al menos un simulador**
- Nunca subir secretos o credenciales
- Documentar cambios significativos en el PR

---

## 9) Resolución de conflictos

- Actualiza tu rama frecuentemente:  
`  
git checkout feature/<nombre>  
git fetch origin  
git merge origin/develop  
`
- Coordina con el equipo cuando se modifiquen archivos críticos:
  - AppRouter
  - DIContainer
  - Core modules
- Evitar usar `--force` salvo casos excepcionales

---

## 10) Comunicación

- Usa el canal oficial del equipo (Discord/WhatsApp) para coordinar
- Al abrir un PR:
  - Explica **qué** cambiaste y **por qué**
  - Solicita revisión
- Usa la plantilla correcta para Issues (Bug, Feature, UI/UX, etc.)
- Mantén una comunicación clara, respetuosa y profesional  
  (ver [Código de Conducta](./CODE_OF_CONDUCT.es.md))

---

## 11) Política de Seguridad

No reportes vulnerabilidades públicamente en Issues o PRs.  
Consulta [SECURITY.es.md](./SECURITY.es.md) para reportarlas de forma privada.

---
