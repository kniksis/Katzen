Shader "Custom/KatzenShader" {
	Properties {
		_ColorPelo("CorPelo", Color) = (1,1,1,1)
		_ColorPele("CorPele", Color) = (1,1,1,1)
		_ColorShorts("CorShorts", Color) = (1,1,1,1)
		_ColorShortsDetalhes("CorShortsDetalhes", Color) = (1,1,1,1)
		_ColorAgua("ColorAgua", Color) = (1,1,1,1)

		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_TerraTex("Terra Albedo (RGB)", 2D) = "white" {}
		_TerraMaskTex("Terra Mascara(RGB)", 2D) = "white" {}
		_AguaMaskTex("Agua Mascara (RGB)", 2D) = "white" {}
		_NormalTerra("Normal Terra(RGB)", 2D) = "white" {}

		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
		_TerraQuantidade("Terra Quantidade", Range(0,1)) = 0.0
		_AguaQuantidade("Agua Quantidade", Range(0,1)) = 0.0

	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _TerraTex;
		sampler2D _TerraMaskTex;
		sampler2D _AguaMaskTex;
		sampler2D _NormalTerra;

		struct Input {
			float2 uv_MainTex;
			float2 uv_TerraTex;
			float2 uv_TerraMaskTex;
			float2 uv_AguaMaskTex;
			float2 uv_NormalTerra;
		};

		half _Glossiness;
		half _Metallic;
		half _TerraQuantidade;
		half _AguaQuantidade;

		fixed4 _ColorPelo;
		fixed4 _ColorPele;
		fixed4 _ColorShorts;
		fixed4 _ColorShortsDetalhes;
		fixed4 _ColorAgua;

		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			fixed4 r = tex2D(_TerraTex, IN.uv_MainTex);
			fixed4 mt = tex2D(_TerraMaskTex, IN.uv_TerraMaskTex);
			fixed4 ma = tex2D(_AguaMaskTex, IN.uv_AguaMaskTex);
			fixed3 n = UnpackNormal(tex2D(_NormalTerra, IN.uv_NormalTerra));


			if (mt.x < _TerraQuantidade)
			{
				if (c.x > 0.5 && c.y > 0.5 && c.z > 0.5)//Se for branco
				{
					o.Albedo = _ColorPelo;
				}

				if (c.x > 0.5 && c.y < 0.5 && c.z > 0.5)//Se for Rosa
				{
					o.Albedo = _ColorPele;
				}

				if (c.x > 0.5 && c.y > 0.5 && c.z < 0.5)//Se for Amarelo
				{
					o.Albedo = _ColorShorts;
				}

				if (c.x < 0.5 && c.y < 0.5 && c.z < 0.5)//Se for Preto
				{
					o.Albedo = _ColorShortsDetalhes;
				}
				o.Smoothness = _Glossiness;
			}

			else
			{
				o.Albedo = r.rgb;
				o.Normal = n;
			}

			if(_AguaQuantidade < 0.25)
			if (ma.x < _AguaQuantidade)
			{
				if (c.x > 0.5 && c.y > 0.5 && c.z > 0.5)//Se for branco
				{
					o.Albedo = _ColorPelo;
				}

				if (c.x > 0.5 && c.y < 0.5 && c.z > 0.5)//Se for Rosa
				{
					o.Albedo = _ColorPele;
				}

				if (c.x > 0.5 && c.y > 0.5 && c.z < 0.5)//Se for Amarelo
				{
					o.Albedo = _ColorShorts;
				}

				if (c.x < 0.5 && c.y < 0.5 && c.z < 0.5)//Se for Preto
				{
					o.Albedo = _ColorShortsDetalhes;
				}
				o.Smoothness = _Glossiness;
			}

			else
			{
				if (c.x > 0.5 && c.y > 0.5 && c.z > 0.5)//Se for branco
				{
					o.Albedo = _ColorPelo * _ColorAgua;
				}

				if (c.x > 0.5 && c.y < 0.5 && c.z > 0.5)//Se for Rosa
				{
					o.Albedo = _ColorPele * _ColorAgua;
				}

				if (c.x > 0.5 && c.y > 0.5 && c.z < 0.5)//Se for Amarelo
				{
					o.Albedo = _ColorShorts * _ColorAgua;
				}

				if (c.x < 0.5 && c.y < 0.5 && c.z < 0.5)//Se for Preto
				{
					o.Albedo = _ColorShortsDetalhes * _ColorAgua;
				}
				o.Smoothness = 0.8;
			}



			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
