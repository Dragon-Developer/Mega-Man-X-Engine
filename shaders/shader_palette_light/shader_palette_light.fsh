//
// simple colour swapping fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    col.r=((col.r+col.g+col.b)/8.0)+0.53;
    col.g=240.0/256.0;
    col.b=240.0/256.0;
    gl_FragColor = v_vColour * col;
}

