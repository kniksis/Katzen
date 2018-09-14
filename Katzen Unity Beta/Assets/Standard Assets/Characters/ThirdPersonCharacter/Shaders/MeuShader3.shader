Shader "MeuShade3r" 
{
	Properties
	{
		_Cor ("Cor do Objeto", Color) = (0, 1, 0.15, 1)
		_Textura ("Textura do Objeto", 2D) = "" {}
		_Reflexo ("Cor do Reflexo", Color) = (1, 1, 1, 1)
		_Brilho ("Intensidade do Reflexo", Range(0.0001, 1)) = 0.7
	}
	SubShader
	{
		Pass
		{
			Material
			{
				Ambient [_Cor]
				Diffuse [_Cor]
				Specular [_Reflexo]
				Shininess [_Brilho]
			}

			Lighting On

			SeparateSpecular On

			Cull Off

			Blend SrcAlpha OneMinusSrcAlpha

			SetTexture [_Textura]
			{
				Combine texture * primary DOUBLE
			}
		}
	}

	FallBack "Diffuse"
}