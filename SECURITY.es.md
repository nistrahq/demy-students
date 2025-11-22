# Política de Seguridad

Idiomas disponibles:
- [Inglés](SECURITY.md)
- [Español](SECURITY.es.md)

## Versiones soportadas
Este proyecto es **académico y privado**, desarrollado para la aplicación iOS DemyStudents.  
Las actualizaciones de seguridad se aplican únicamente a la **rama activa de desarrollo** (`develop`) y a la **última versión estable** (`main`).  
Las versiones anteriores o tags **no se mantienen**.

---

## Reporte de vulnerabilidades
Por favor, **no divulgues vulnerabilidades públicamente** en Issues o Pull Requests.

En su lugar, repórtalas de manera privada a los responsables:

- Contacto: <contact.demyteam@gmail.com>  
- O a través del canal privado indicado en el Discord del equipo.

Al reportar, incluye:
- Una descripción clara del problema y su impacto potencial.
- Pasos para reproducir la vulnerabilidad (capturas, grabaciones o cuentas de prueba).
- Logs, reportes de crash, salida de consola o stacktraces  
  (**compartidos de forma privada**, nunca en público).
- Una propuesta de mitigación o solución (si la conoces).

Confirmaremos la recepción del reporte dentro de **48 horas**  
y enviaremos una evaluación inicial en un máximo de **5 días hábiles**.

---

## Alcance
Esta política aplica al **código y arquitectura de la app iOS**, incluyendo:

- Código Swift / SwiftUI (arquitectura basada en features)
- Capas de MVVM y Clean Architecture (Data, Domain, Presentation)
- Módulos Core (Networking, Storage/Keychain, DIContainer, AppRouter)
- Configuraciones sensibles (endpoints, sesión, autenticación)
- Manejo de datos, almacenamiento seguro y flujo de login

Esta política **no aplica** a:
- Dependencias externas vía Swift Package Manager  
  (reportar directamente a sus mantenedores)
- Problemas específicos del simulador/dispositivo no relacionados al código
- Retroalimentación académica o de curso (manejar vía la plataforma académica)

---

## Divulgación responsable
Al seguir esta política, nos ayudas a manejar los problemas de seguridad de forma responsable.  
Reconoceremos tu aporte en la **documentación interna**, pero no se hará divulgación pública sin aprobación del equipo.

**Nota:**  
Este repositorio es un **proyecto académico y privado**.  
No se aceptan contribuciones externas.
