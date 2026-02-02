shader_type spatial;
// Important: Transparent blend mode
render_mode blend_mix, depth_draw_opaque, cull_disabled;

uniform vec4 base_color : source_color = vec4(1.0);
uniform float floor_y = 0.0;     // The Y level where it's 100% opaque
uniform float fade_height = 2.0; // How high it takes to become 100% transparent

void fragment() {
    float world_y = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).y;

    float relative_height = world_y - floor_y;

    float alpha_factor = 1.0 - clamp(relative_height / fade_height, 0.0, 1.0);

    ALBEDO = base_color.rgb;
    ALPHA = base_color.a * alpha_factor;
}
