# agent-framework

Colección personal de agentes, prompts y skills, con un orquestador que decide cuándo delegar.

## Estructura

```
agents/    # agentes (*.agent.md); registry.md es el catálogo
prompts/   # prompts reutilizables (*.prompt.md)
skills/    # una carpeta por skill, con SKILL.md
```

## Uso

- Global: copia o enlaza el contenido a `~/.copilot/`.
- Por proyecto: copia o enlaza a `.github/` del repo.

## Añadir un agente

1. Crea `agents/<nombre>.agent.md` con front-matter (`name`, `description`).
2. Regístralo en `agents/registry.md`.
