shader_type canvas_item;
// 1e1e1ebe new for source color (old = 646464e7)
uniform vec4 sunGlass_color : source_color;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR *= sunGlass_color;
}
