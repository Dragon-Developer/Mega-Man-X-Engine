//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// RGB Offset (Range = [0...1])
uniform float OffsetR;
uniform float OffsetG;
uniform float OffsetB;

void main()
{
	vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
	col.r = OffsetR + ((1.0 - OffsetR) * col.r);
	col.g = OffsetG + ((1.0 - OffsetG) * col.g);
	col.b = OffsetB + ((1.0 - OffsetB) * col.b);
    gl_FragColor = v_vColour * col;	
}
