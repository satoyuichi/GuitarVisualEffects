```mermaid
classDiagram
    class Effect {
        <<interface>>
        +apply(signal_processer)
    }
    
    class Renderer {
        -SignalProcesser sp
        
        +renderer(effect_manager)
    }
    
    class EffectManager {
        -ArrayList~Effect~ effects
        
        +add(effect)
        +get(index)
        +size() int
    }
    
    Effect <|-- LineEffect
    Effect -- SignalProcesser
    EffectManager *-- Effect
    EffectManager -- Renderer
    EffectManager -- InputManager
	
	Renderer *-- SignalProcesser
```
