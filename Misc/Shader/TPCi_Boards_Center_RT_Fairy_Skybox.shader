//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_Fairy_Skybox" {
Properties {
_Color_BackgroundSpace_2 ("Color_BackgroundSpace_2", Color) = (0.3607843,0.8,0.6431373,0)
_Color_BackgroundSpace_1 ("Color_BackgroundSpace_1", Color) = (0.01176468,0.207671,0.8313726,0)
_ColorMaskPower ("Color Mask Power", Float) = 2
_Starfield1Offset (" Starfield 1 Offset", Vector) = (0,0.1,0,0)
_Starfield1Tiling ("Starfield 1 Tiling", Vector) = (2,2,0,0)
_Starfield1Power ("Starfield 1 Power", Float) = 3.15
_StarfieldColor ("Starfield Color", Color) = (0.7688679,1,0.9860051,0)
_StarfieldBrightness ("Starfield Brightness", Float) = 1
_StarfieldTexture ("Starfield Texture", 2D) = "white" { }
_Starfield2Power ("Starfield 2 Power", Float) = 1
_Starfield2Offset ("Starfield 2 Offset", Vector) = (0,0,0,0)
_Starfield2Tiling ("Starfield 2 Tiling", Vector) = (2,2,0,0)
_Starfield2Panning ("Starfield 2 Panning", Vector) = (0,0.02,0,0)
_T_VFX_Clouds_Minimize_2 ("T_VFX_Clouds_Minimize_2", 2D) = "white" { }
_Float1 ("Float 1", Float) = 4.27
_ColorClouds2 ("Color Clouds 2", Color) = (0.1744393,0.3542104,0.754717,0)
_ColorClouds1 ("Color Clouds 1", Color) = (0.8679245,0.3561766,0.8387138,0)
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 14300
Program "vp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _Color_BackgroundSpace_1;
uniform 	vec4 _Color_BackgroundSpace_2;
uniform 	float _ColorMaskPower;
uniform 	vec4 _ColorClouds2;
uniform 	vec4 _ColorClouds1;
uniform 	float _Float1;
uniform 	float _StarfieldBrightness;
uniform 	vec4 _StarfieldColor;
uniform 	vec2 _Starfield2Panning;
uniform 	vec2 _Starfield2Tiling;
uniform 	vec2 _Starfield2Offset;
uniform 	float _Starfield2Power;
uniform 	vec2 _Starfield1Tiling;
uniform 	vec2 _Starfield1Offset;
uniform 	float _Starfield1Power;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Clouds_Minimize_2;
UNITY_LOCATION(1) uniform mediump sampler2D _StarfieldTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.yx) + vec2(1.0, 1.0);
    u_xlat4 = u_xlat0.y * vs_TEXCOORD0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _ColorMaskPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4 = u_xlat4 * 3.5999999;
    u_xlat4 = log2(u_xlat4);
    u_xlat4 = u_xlat4 * 14.9700003;
    u_xlat4 = exp2(u_xlat4);
    u_xlat4 = u_xlat4 * _Float1;
    u_xlat8.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.0299999993, 0.0);
    u_xlat8.xy = _Time.yy * vec2(0.0299999993, 0.0500000007) + u_xlat8.xy;
    u_xlat16_1.xyz = texture(_T_VFX_Clouds_Minimize_2, u_xlat8.xy).xyz;
    u_xlat8.x = u_xlat4 * u_xlat16_1.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.x = u_xlat8.x * 1.87;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.25;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.xyz = (-_ColorClouds2.xyz) + _ColorClouds1.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + _ColorClouds2.xyz;
    u_xlat2.xyz = (-_Color_BackgroundSpace_1.xyz) + _Color_BackgroundSpace_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + _Color_BackgroundSpace_1.xyz;
    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(u_xlat4) * u_xlat0.xzw + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Starfield2Tiling.x, _Starfield2Tiling.y) + _Starfield2Offset.xy;
    u_xlat1.xy = _Time.yy * _Starfield2Panning.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_StarfieldTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = log2(u_xlat16_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starfield2Power, _Starfield2Power, _Starfield2Power));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xy = vs_TEXCOORD0.xy * _Starfield1Tiling.xy + vec2(_Starfield1Offset.x, _Starfield1Offset.y);
    u_xlat16_2.xyz = texture(_StarfieldTexture, u_xlat2.xy).xyz;
    u_xlat2.xyz = log2(u_xlat16_2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Starfield1Power);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _StarfieldColor.xyz;
    u_xlat0.xyz = vec3(vec3(_StarfieldBrightness, _StarfieldBrightness, _StarfieldBrightness)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _Color_BackgroundSpace_1;
uniform 	vec4 _Color_BackgroundSpace_2;
uniform 	float _ColorMaskPower;
uniform 	vec4 _ColorClouds2;
uniform 	vec4 _ColorClouds1;
uniform 	float _Float1;
uniform 	float _StarfieldBrightness;
uniform 	vec4 _StarfieldColor;
uniform 	vec2 _Starfield2Panning;
uniform 	vec2 _Starfield2Tiling;
uniform 	vec2 _Starfield2Offset;
uniform 	float _Starfield2Power;
uniform 	vec2 _Starfield1Tiling;
uniform 	vec2 _Starfield1Offset;
uniform 	float _Starfield1Power;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Clouds_Minimize_2;
UNITY_LOCATION(1) uniform mediump sampler2D _StarfieldTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.yx) + vec2(1.0, 1.0);
    u_xlat4 = u_xlat0.y * vs_TEXCOORD0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _ColorMaskPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4 = u_xlat4 * 3.5999999;
    u_xlat4 = log2(u_xlat4);
    u_xlat4 = u_xlat4 * 14.9700003;
    u_xlat4 = exp2(u_xlat4);
    u_xlat4 = u_xlat4 * _Float1;
    u_xlat8.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.0299999993, 0.0);
    u_xlat8.xy = _Time.yy * vec2(0.0299999993, 0.0500000007) + u_xlat8.xy;
    u_xlat16_1.xyz = texture(_T_VFX_Clouds_Minimize_2, u_xlat8.xy).xyz;
    u_xlat8.x = u_xlat4 * u_xlat16_1.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.x = u_xlat8.x * 1.87;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.25;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.xyz = (-_ColorClouds2.xyz) + _ColorClouds1.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + _ColorClouds2.xyz;
    u_xlat2.xyz = (-_Color_BackgroundSpace_1.xyz) + _Color_BackgroundSpace_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + _Color_BackgroundSpace_1.xyz;
    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(u_xlat4) * u_xlat0.xzw + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Starfield2Tiling.x, _Starfield2Tiling.y) + _Starfield2Offset.xy;
    u_xlat1.xy = _Time.yy * _Starfield2Panning.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_StarfieldTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = log2(u_xlat16_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starfield2Power, _Starfield2Power, _Starfield2Power));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xy = vs_TEXCOORD0.xy * _Starfield1Tiling.xy + vec2(_Starfield1Offset.x, _Starfield1Offset.y);
    u_xlat16_2.xyz = texture(_StarfieldTexture, u_xlat2.xy).xyz;
    u_xlat2.xyz = log2(u_xlat16_2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Starfield1Power);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _StarfieldColor.xyz;
    u_xlat0.xyz = vec3(vec3(_StarfieldBrightness, _StarfieldBrightness, _StarfieldBrightness)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}