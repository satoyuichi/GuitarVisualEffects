uniform float uTime;
uniform mat4 uWorld;
uniform mat4 uView;
uniform mat4 uProjection;
uniform mat4 uOrtho;
uniform mat4 uMVP;
uniform mat4 uMVO;

attribute vec3 aVertex;

varying vec4 vColor;

void main() {
     vColor = vec4(1.0);
//     gl_Position = uMVP * vec4(aVertex, 1.0);
     gl_Position = uProjection * uView * uWorld * vec4(aVertex, 1.0);
}
