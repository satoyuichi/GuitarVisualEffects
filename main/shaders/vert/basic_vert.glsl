uniform float uTime;
attribute vec4 aVertex;

varying vec4 vColor;

void main() {
     vColor = vec4(1.0);
     gl_Position = aVertex;
}
