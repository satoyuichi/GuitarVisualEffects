```mermaid
classDiagram
    class Effect {
        <<interface>>
        +apply(renderer, signal_processor)
    }
    
    class Renderer {
        -PImage prevBB
        -PApplet parent
        
        +renderer(signal_processor effect_manager)
    }
    
    class EffectManager {
        -ArrayList~Effect~ effects
        
        +add(effect)
        +get(index)
        +size() int
    }
    
    class VisualEffect {
    	-PShader shader
    }
    
    class SignalProcesser {
        +process()
        +getSpectrum(index) float
        +getWaveform(index) float
        +getAmplitude() float
        +getSampleSize() int
    }
    
    Effect <|.. VisualEffect
    VisualEffect <|-- PolygonalLineEffect
    VisualEffect <|-- PolarEffect
    VisualEffect <|-- BarEqualizerEffect
    VisualEffect <|-- WarpEffect
    Effect -- SignalProcesser
    EffectManager *-- Effect
    EffectManager -- Renderer
    EffectManager -- InputManager
    Renderer *-- SignalProcesser
    Renderer -- Sequencer
    Sequencer -- Effect
```
