//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_Colorless_Skymesh" {
Properties {
_SpectrumTiling ("Spectrum Tiling", Vector) = (3,1,0,0)
_Spectrum2Tiling ("Spectrum 2 Tiling", Vector) = (3,1,0,0)
_SpectrumOffset ("Spectrum Offset", Vector) = (0,0,0,0)
_Spectrum2Offset ("Spectrum 2 Offset", Vector) = (0,0,0,0)
_SpectrumPanning ("Spectrum Panning", Vector) = (0,0,0,0)
_Spectrum2Panning ("Spectrum 2 Panning", Vector) = (0,0,0,0)
_OverallFadeScalar ("Overall Fade Scalar", Range(0, 1)) = 0.714
_FadeColor ("Fade Color", Color) = (0.6415094,0.6415094,0.6415094,0)
_FadeLerpOffset ("Fade Lerp Offset", Vector) = (0,-0.3,0,0)
_FadeLerpPower ("Fade Lerp Power", Float) = 1.26
_FadeAdd ("Fade Add", Float) = 0.26
_OverallBrightness ("Overall Brightness", Range(0, 1)) = 1
_SpectrumTexture ("Spectrum Texture", 2D) = "white" { }
_SpectrumRotation ("Spectrum Rotation", Float) = 0
_Spectrum2Rotation ("Spectrum 2 Rotation", Float) = 0
_Spectrum1and2Lerp ("Spectrum 1 and 2 Lerp", Range(0, 1)) = 0
_TextureSample1 ("Texture Sample 1", 2D) = "white" { }
_T_VFX_LightShaft ("T_VFX_LightShaft", 2D) = "white" { }
_StripsTiling ("Strips Tiling", Vector) = (2,-1,0,0)
_StripsOffset ("Strips Offset", Vector) = (0,0,0,0)
_GlowTiling ("Glow Tiling", Vector) = (0.5,-1,0,0)
_GlowOffset ("Glow Offset", Vector) = (0.3,0,0,0)
_OverallGlowAmount ("Overall Glow Amount", Float) = 1
_GlowPower ("Glow Power", Float) = 3
_StripsAmount ("Strips Amount", Float) = 1
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 6241
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
uniform 	float _StripsAmount;
uniform 	vec2 _StripsTiling;
uniform 	vec2 _StripsOffset;
uniform 	vec2 _GlowTiling;
uniform 	vec2 _GlowOffset;
uniform 	float _GlowPower;
uniform 	float _OverallGlowAmount;
uniform 	vec2 _SpectrumPanning;
uniform 	vec2 _SpectrumTiling;
uniform 	vec2 _SpectrumOffset;
uniform 	float _SpectrumRotation;
uniform 	vec2 _Spectrum2Panning;
uniform 	vec2 _Spectrum2Tiling;
uniform 	vec2 _Spectrum2Offset;
uniform 	float _Spectrum2Rotation;
uniform 	float _Spectrum1and2Lerp;
uniform 	vec4 _FadeColor;
uniform 	float _OverallFadeScalar;
uniform 	float _FadeAdd;
uniform 	vec2 _FadeLerpOffset;
uniform 	float _FadeLerpPower;
uniform 	float _OverallBrightness;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_LightShaft;
UNITY_LOCATION(1) uniform mediump sampler2D _SpectrumTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureSample1;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_Spectrum2Tiling.x, _Spectrum2Tiling.y) + _Spectrum2Offset.xy;
    u_xlat0.xy = _Time.yy * _Spectrum2Panning.xy + u_xlat0.xy;
    u_xlat10 = _Spectrum2Rotation * 0.0174532924;
    u_xlat1.x = sin(u_xlat10);
    u_xlat2.x = cos(u_xlat10);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat16_0.xyz = texture(_SpectrumTexture, u_xlat1.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_SpectrumTiling.x, _SpectrumTiling.y) + _SpectrumOffset.xy;
    u_xlat1.xy = _Time.yy * _SpectrumPanning.xy + u_xlat1.xy;
    u_xlat15 = _SpectrumRotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat15);
    u_xlat3.x = cos(u_xlat15);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat16_1.xyz = texture(_SpectrumTexture, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_Spectrum1and2Lerp, _Spectrum1and2Lerp, _Spectrum1and2Lerp)) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _FadeColor.xyz;
    u_xlat15 = vs_TEXCOORD0.y + _FadeLerpOffset.xxxy.w;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _FadeLerpPower;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + _FadeAdd;
    u_xlat15 = u_xlat15 * _OverallFadeScalar;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_StripsTiling.x, _StripsTiling.y) + _StripsOffset.xy;
    u_xlat16_1.xyz = texture(_TextureSample1, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_StripsAmount);
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_GlowTiling.x, _GlowTiling.y) + _GlowOffset.xy;
    u_xlat16_2.xyz = texture(_T_VFX_LightShaft, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vs_TEXCOORD0.yyy;
    u_xlat3.xyz = log2(u_xlat2.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_GlowPower, _GlowPower, _GlowPower));
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_OverallGlowAmount, _OverallGlowAmount, _OverallGlowAmount)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_OverallBrightness, _OverallBrightness, _OverallBrightness));
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
uniform 	float _StripsAmount;
uniform 	vec2 _StripsTiling;
uniform 	vec2 _StripsOffset;
uniform 	vec2 _GlowTiling;
uniform 	vec2 _GlowOffset;
uniform 	float _GlowPower;
uniform 	float _OverallGlowAmount;
uniform 	vec2 _SpectrumPanning;
uniform 	vec2 _SpectrumTiling;
uniform 	vec2 _SpectrumOffset;
uniform 	float _SpectrumRotation;
uniform 	vec2 _Spectrum2Panning;
uniform 	vec2 _Spectrum2Tiling;
uniform 	vec2 _Spectrum2Offset;
uniform 	float _Spectrum2Rotation;
uniform 	float _Spectrum1and2Lerp;
uniform 	vec4 _FadeColor;
uniform 	float _OverallFadeScalar;
uniform 	float _FadeAdd;
uniform 	vec2 _FadeLerpOffset;
uniform 	float _FadeLerpPower;
uniform 	float _OverallBrightness;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_LightShaft;
UNITY_LOCATION(1) uniform mediump sampler2D _SpectrumTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureSample1;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_Spectrum2Tiling.x, _Spectrum2Tiling.y) + _Spectrum2Offset.xy;
    u_xlat0.xy = _Time.yy * _Spectrum2Panning.xy + u_xlat0.xy;
    u_xlat10 = _Spectrum2Rotation * 0.0174532924;
    u_xlat1.x = sin(u_xlat10);
    u_xlat2.x = cos(u_xlat10);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat16_0.xyz = texture(_SpectrumTexture, u_xlat1.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_SpectrumTiling.x, _SpectrumTiling.y) + _SpectrumOffset.xy;
    u_xlat1.xy = _Time.yy * _SpectrumPanning.xy + u_xlat1.xy;
    u_xlat15 = _SpectrumRotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat15);
    u_xlat3.x = cos(u_xlat15);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat16_1.xyz = texture(_SpectrumTexture, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_Spectrum1and2Lerp, _Spectrum1and2Lerp, _Spectrum1and2Lerp)) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _FadeColor.xyz;
    u_xlat15 = vs_TEXCOORD0.y + _FadeLerpOffset.xxxy.w;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _FadeLerpPower;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat15 = u_xlat15 + _FadeAdd;
    u_xlat15 = u_xlat15 * _OverallFadeScalar;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_StripsTiling.x, _StripsTiling.y) + _StripsOffset.xy;
    u_xlat16_1.xyz = texture(_TextureSample1, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_StripsAmount);
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_GlowTiling.x, _GlowTiling.y) + _GlowOffset.xy;
    u_xlat16_2.xyz = texture(_T_VFX_LightShaft, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vs_TEXCOORD0.yyy;
    u_xlat3.xyz = log2(u_xlat2.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_GlowPower, _GlowPower, _GlowPower));
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_OverallGlowAmount, _OverallGlowAmount, _OverallGlowAmount)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_OverallBrightness, _OverallBrightness, _OverallBrightness));
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