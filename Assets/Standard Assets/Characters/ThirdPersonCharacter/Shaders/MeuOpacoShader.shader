Shader "MeuOpacoShader" 
{
	Properties
	{
		_Cor ("Cor do Objeto", Color) = (0, 1, 0.15, 1)
	}
	SubShader
	{
		Pass
		{
			Material
			{
				Ambient [_Cor]
				Diffuse [_Cor]
			}
			Lighting On
		}
	}
}