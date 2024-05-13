shader_type canvas_item;
uniform float value : hint_range(0, 1);
uniform sampler2D noise_texture;

void fragment()
{
    vec4 current_pixel = texture(TEXTURE, UV);
    vec4 current_noise_pixel = texture(noise_texture, UV);

    if (current_noise_pixel.r > value)
    {
        // Verringere die Alpha-Komponente des aktuellen Pixels:
        COLOR.a -= 1.0; // Hier kannst du den Wert anpassen
    }
    else
    {
        // Behalte den aktuellen Pixel unverändert:
        COLOR = current_pixel;
    }
}
