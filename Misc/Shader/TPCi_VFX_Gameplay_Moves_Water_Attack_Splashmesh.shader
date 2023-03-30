//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/Moves/Water_Attack_Splashmesh" {
Properties {
_Water_Texture_Offset ("Water_Texture_Offset", Vector) = (0,0,0,0)
_Water_Texture_Tiling ("Water_Texture_Tiling", Vector) = (1,1,0,0)
_Texture0 ("Texture 0", 2D) = "white" { }
_DissolveTexture ("Dissolve Texture", 2D) = "white" { }
_DissolveTextureTiling ("Dissolve Texture Tiling", Vector) = (3,1,0,0)
_WaterDistortion ("Water Distortion", 2D) = "bump" { }
_WaterDistortionTiling ("Water Distortion Tiling", Vector) = (1,1,0,0)
_WaterDistortionAmount ("Water Distortion Amount", Float) = 0.05
_WaterDistortionPanSpeed ("Water Distortion Pan Speed", Vector) = (0,0.1,0,0)
_texcoord ("", 2D) = "white" { }
_tex4coord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 7805
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
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec2 _WaterDistortionPanSpeed;
uniform 	vec2 _WaterDistortionTiling;
uniform 	float _WaterDistortionAmount;
uniform 	vec2 _Water_Texture_Tiling;
uniform 	vec2 _Water_Texture_Offset;
uniform 	vec2 _DissolveTextureTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _WaterDistortion;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_DissolveTextureTiling.x, _DissolveTextureTiling.y);
    u_xlat0.xy = _Time.yy * vec2(0.0, -0.0500000007) + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTexture, u_xlat0.xy).x;
    u_xlat3.x = vs_TEXCOORD0.y + -0.829999983;
    u_xlat3.x = u_xlat3.x * 14.1099997;
    u_xlat0.x = u_xlat3.x * u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD1.z);
    u_xlat0.x = u_xlat0.x * 6.66666651;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_WaterDistortionTiling.x, _WaterDistortionTiling.y);
    u_xlat3.xy = _Time.yy * _WaterDistortionPanSpeed.xy + u_xlat3.xy;
    u_xlat16_3.xy = texture(_WaterDistortion, u_xlat3.xy).xy;
    u_xlat16_1.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = vs_TEXCOORD0.y * _Water_Texture_Tiling.xxyx.z;
    u_xlat2.y = _Water_Texture_Offset.y * vs_TEXCOORD1.w + u_xlat3.x;
    u_xlat2.x = vs_TEXCOORD0.x * _Water_Texture_Tiling.xxyx.y + _Water_Texture_Offset.x;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_WaterDistortionAmount) + u_xlat2.xy;
    u_xlat16_1 = texture(_Texture0, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec2 _WaterDistortionPanSpeed;
uniform 	vec2 _WaterDistortionTiling;
uniform 	float _WaterDistortionAmount;
uniform 	vec2 _Water_Texture_Tiling;
uniform 	vec2 _Water_Texture_Offset;
uniform 	vec2 _DissolveTextureTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _WaterDistortion;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_DissolveTextureTiling.x, _DissolveTextureTiling.y);
    u_xlat0.xy = _Time.yy * vec2(0.0, -0.0500000007) + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTexture, u_xlat0.xy).x;
    u_xlat3.x = vs_TEXCOORD0.y + -0.829999983;
    u_xlat3.x = u_xlat3.x * 14.1099997;
    u_xlat0.x = u_xlat3.x * u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD1.z);
    u_xlat0.x = u_xlat0.x * 6.66666651;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_WaterDistortionTiling.x, _WaterDistortionTiling.y);
    u_xlat3.xy = _Time.yy * _WaterDistortionPanSpeed.xy + u_xlat3.xy;
    u_xlat16_3.xy = texture(_WaterDistortion, u_xlat3.xy).xy;
    u_xlat16_1.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = vs_TEXCOORD0.y * _Water_Texture_Tiling.xxyx.z;
    u_xlat2.y = _Water_Texture_Offset.y * vs_TEXCOORD1.w + u_xlat3.x;
    u_xlat2.x = vs_TEXCOORD0.x * _Water_Texture_Tiling.xxyx.y + _Water_Texture_Offset.x;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_WaterDistortionAmount) + u_xlat2.xy;
    u_xlat16_1 = texture(_Texture0, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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