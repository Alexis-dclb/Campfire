varying vec2 vUv; 
varying float vElevation; 
uniform float uTime;


void main () {
  /**
  *Position
  */

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    float elevation = sin(modelPosition.x  + (uTime )) *
                    sin(modelPosition.z  + (uTime )) * 0.02;
  modelPosition.y += elevation;
  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;

  vElevation = elevation * 0.2;
  vUv = uv;
  gl_Position = projectionPosition;
}