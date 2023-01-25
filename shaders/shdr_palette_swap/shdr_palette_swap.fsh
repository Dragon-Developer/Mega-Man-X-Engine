//
// Simple passthrough fragment shader
//
/*****************************************************************************/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//  Get palette as texture
uniform sampler2D Palette;

//  Color Offset Index
uniform float Offset;
//  Source
uniform float OffsetSource;

void main() {
    vec4 NewColor;
    vec4 ref = texture2D(gm_BaseTexture, v_vTexcoord);
    const float Width = 32.0;
    bool Found = false;
    if (Offset == 0.0){
        gl_FragColor = ref;
        return;
    }
	if (Offset < 0.0){
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
		return;	
	}
	if (ref.a == 0.0){
		return;
	}
	for (float n = 0.0; n < Width; n += 1.0){
        if (Found){
            break;
        }
        vec2 uv_coord = vec2((n / 32.0), (OffsetSource));
        vec4 ver = texture2D(Palette, uv_coord);
        if (ref == ver){
            vec2 uv_coord2 = vec2((n / Width), Offset);
            NewColor = texture2D(Palette, uv_coord2);
            Found = true;
        }
    }
    if (!Found){
        NewColor = ref;    
    }
    gl_FragColor = NewColor;
}