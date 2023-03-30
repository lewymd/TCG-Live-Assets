//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/Moves/Lightning_Scroll" {
Properties {
_LightningTexture ("Lightning Texture", 2D) = "white" { }
_Lightning1Tiling ("Lightning 1 Tiling", Vector) = (1,1,0,0)
_Lightning1Offset ("Lightning 1 Offset", Vector) = (0,1,0,0)
_Lightning1Panner ("Lightning 1 Panner", Vector) = (0,0.25,0,0)
_Brightness ("Brightness", Float) = 1
_Color ("Color", Color) = (1,1,1,0)
_T_VFX_Shared_RenderClouds_Minimize_N ("T_VFX_Shared_RenderClouds_Minimize_N", 2D) = "white" { }
_DistortionAmount ("Distortion Amount", Float) = 0.05
_DistortionTiling ("Distortion Tiling", Vector) = (1,1,0,0)
_DistortionOffset ("Distortion Offset", Vector) = (0,0,0,0)
_DistortionPanner ("Distortion Panner", Vector) = (0,0,0,0)
_TextureSample0 ("Texture Sample 0", 2D) = "white" { }
_desat ("desat", Range(0, 1)) = 0.5647059
_tex4coord ("", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
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
  Cull Off
  GpuProgramID 38681
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
uniform 	vec4 _TextureSample0_ST;
uniform 	vec4 _Color;
uniform 	float _Brightness;
uniform 	vec2 _Lightning1Panner;
uniform 	vec2 _DistortionPanner;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _DistortionOffset;
uniform 	float _DistortionAmount;
uniform 	vec2 _Lightning1Tiling;
uniform 	vec2 _Lightning1Offset;
uniform 	float _desat;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize_N;
UNITY_LOCATION(1) uniform mediump sampler2D _LightningTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_DistortionTiling.x, _DistortionTiling.y) + _DistortionOffset.xy;
    u_xlat0.xy = _Time.yy * _DistortionPanner.xy + u_xlat0.xy;
    u_xlat16_0.xy = texture(_T_VFX_Shared_RenderClouds_Minimize_N, u_xlat0.xy).xy;
    u_xlat6 = vs_TEXCOORD0.y * _Lightning1Tiling.y;
    u_xlat1.y = _Lightning1Offset.xxxy.w * vs_TEXCOORD1.z + u_xlat6;
    u_xlat1.x = vs_TEXCOORD0.x * _Lightning1Tiling.x + _Lightning1Offset.xxxy.z;
    u_xlat0.xy = u_xlat16_0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat1.xy;
    u_xlat0.xy = _Time.yy * vec2(_Lightning1Panner.x, _Lightning1Panner.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_LightningTexture, u_xlat0.xy).xyz;
    u_xlat9 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat9);
    u_xlat3.xyz = vec3(_desat) * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat1.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_Brightness);
    u_xlat2.xy = vs_TEXCOORD0.xy * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
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
uniform 	vec4 _TextureSample0_ST;
uniform 	vec4 _Color;
uniform 	float _Brightness;
uniform 	vec2 _Lightning1Panner;
uniform 	vec2 _DistortionPanner;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _DistortionOffset;
uniform 	float _DistortionAmount;
uniform 	vec2 _Lightning1Tiling;
uniform 	vec2 _Lightning1Offset;
uniform 	float _desat;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize_N;
UNITY_LOCATION(1) uniform mediump sampler2D _LightningTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_DistortionTiling.x, _DistortionTiling.y) + _DistortionOffset.xy;
    u_xlat0.xy = _Time.yy * _DistortionPanner.xy + u_xlat0.xy;
    u_xlat16_0.xy = texture(_T_VFX_Shared_RenderClouds_Minimize_N, u_xlat0.xy).xy;
    u_xlat6 = vs_TEXCOORD0.y * _Lightning1Tiling.y;
    u_xlat1.y = _Lightning1Offset.xxxy.w * vs_TEXCOORD1.z + u_xlat6;
    u_xlat1.x = vs_TEXCOORD0.x * _Lightning1Tiling.x + _Lightning1Offset.xxxy.z;
    u_xlat0.xy = u_xlat16_0.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat1.xy;
    u_xlat0.xy = _Time.yy * vec2(_Lightning1Panner.x, _Lightning1Panner.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_LightningTexture, u_xlat0.xy).xyz;
    u_xlat9 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat9);
    u_xlat3.xyz = vec3(_desat) * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat1.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_Brightness);
    u_xlat2.xy = vs_TEXCOORD0.xy * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
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