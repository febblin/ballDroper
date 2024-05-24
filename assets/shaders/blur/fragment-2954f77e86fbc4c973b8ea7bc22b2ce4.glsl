#version 100
#ifdef GL_ES
#define LOWP lowp
precision mediump float;
#else
#define LOWP
#endif
varying LOWP vec4 v_color;
varying vec2 v_texCoords;
uniform sampler2D u_texture;
uniform vec2 resolution;
uniform float iTime;

void main()
{
    vec2 uv = gl_FragCoord.xy / resolution;
    float lod = 5.0*sin( iTime );
    vec4 col = texture2D(u_texture, vec2(uv.x,uv.y), lod);
    gl_FragColor = vec4(col);
}