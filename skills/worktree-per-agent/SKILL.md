---
name: worktree-per-agent
description: Da a cada agente paralelo su propio git worktree y rama para evitar conflictos de archivos. Úsalo al lanzar varios implementer a la vez.
---

# Worktree por agente

Cada agente que edita código en paralelo trabaja en un worktree aislado, nunca en el checkout principal.

## Crear (orquestador, antes de lanzar el agente)

```bash
git worktree add ../wt-<tarea> -b agent/<tarea> main
```

- Un worktree y una rama por agente: `agent/<tarea>`.
- El prompt del agente debe indicar su ruta `../wt-<tarea>` como directorio de trabajo.

## Reglas para el agente

- Trabaja solo dentro de su worktree y toca solo los archivos asignados.
- Haz commits pequeños en su rama; no hagas push a `main`.
- Ejecuta los tests relevantes antes de terminar.
- Entrega: nombre de la rama y resumen de los cambios.

## Integrar (orquestador)

1. Pasa el `reviewer` sobre cada rama.
2. Fusiona una a una: `git merge --no-ff agent/<tarea>`.
3. Ejecuta tests tras cada merge; si hay conflicto, resuélvelo tú, no el agente.

## Limpiar

```bash
git worktree remove ../wt-<tarea>
git branch -d agent/<tarea>
```

## Cuándo no usarlo

Tareas de un solo agente o cambios de ≤2 archivos: trabaja directamente en la rama actual.
