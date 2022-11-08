```mermaid
classDiagram
    Effect <|-- VisualEffect
    Effect -- SignalProcesser
    EffectManager *-- Effect
    EffectManager -- Renderer
    EffectManager -- InputManager
```
