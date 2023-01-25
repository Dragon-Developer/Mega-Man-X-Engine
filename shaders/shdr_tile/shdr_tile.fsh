//
// simple colour swapping fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Multiplier;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	col.r = col.r*Multiplier;
	col.g = col.g*Multiplier;
	col.b = col.b*Multiplier;
	
    gl_FragColor = v_vColour * col;
}

