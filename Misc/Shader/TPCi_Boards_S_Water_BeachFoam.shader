//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/S_Water_BeachFoam" {
Properties {
_FoamRGBMask ("Foam RGB Mask", 2D) = "white" { }
_FoamTendrilsTiling ("Foam Tendrils Tiling", Vector) = (2,0.5,0,0)
_FoamTendrilsTiling2 ("Foam Tendrils Tiling 2", Vector) = (2,0.5,0,0)
_FoamEdgeTiling2 ("Foam Edge Tiling 2", Vector) = (2,0.5,0,0)
_FoamEdgeTiling ("Foam Edge Tiling", Vector) = (2,0.5,0,0)
_FoamEdgeOffset ("Foam Edge Offset", Vector) = (0,0,0,0)
_FoamEdgeOffset2 ("Foam Edge Offset 2", Vector) = (0,0,0,0)
_FoamTendrilsOffset ("Foam Tendrils Offset", Vector) = (0,0,0,0)
_FoamTendrilsOffset2 ("Foam Tendrils Offset 2", Vector) = (0,0,0,0)
_FoamEdgeColorTop ("Foam Edge Color Top", Color) = (1,1,1,0)
_FoamEdgeColorBottom ("Foam Edge Color Bottom", Color) = (0.764151,0.764151,0.764151,0)
_WaterPatternBlur ("Water Pattern Blur", 2D) = "white" { }
_DistortionTexture ("Distortion Texture", 2D) = "bump" { }
_DistortionPanner ("Distortion Panner", Vector) = (0,0,0,0)
_DistortionTiling ("Distortion Tiling", Vector) = (1,1,0,0)
_DistortionAmount ("Distortion Amount", Float) = 0.1
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 49971
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
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
uniform 	vec4 _FoamEdgeColorBottom;
uniform 	vec2 _FoamEdgeTiling2;
uniform 	vec2 _FoamEdgeOffset2;
uniform 	float _DistortionAmount;
uniform 	vec2 _DistortionPanner;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _FoamTendrilsTiling2;
uniform 	vec2 _FoamTendrilsOffset2;
uniform 	vec4 _FoamEdgeColorTop;
uniform 	vec2 _FoamEdgeTiling;
uniform 	vec2 _FoamEdgeOffset;
uniform 	vec2 _FoamTendrilsTiling;
uniform 	vec2 _FoamTendrilsOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FoamRGBMask;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternBlur;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _FoamTendrilsTiling.xy + vec2(_FoamTendrilsOffset.x, _FoamTendrilsOffset.y);
    u_xlat0.xy = _Time.yy * vec2(0.0, 0.0250000004) + u_xlat0.xy;
    u_xlat16_0 = texture(_WaterPatternBlur, u_xlat0.xy).y;
    u_xlat3.x = sin(_Time.y);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat6 = u_xlat3.x * 0.0199999996 + _FoamEdgeOffset.xxxy.w;
    u_xlat3.x = u_xlat3.x * 0.0199999996 + _FoamEdgeOffset2.xxxy.w;
    u_xlat1.y = vs_TEXCOORD0.y * _FoamEdgeTiling2.y + u_xlat3.x;
    u_xlat2.y = vs_TEXCOORD0.y * _FoamEdgeTiling.y + u_xlat6;
    u_xlat3.xy = vs_TEXCOORD0.xy * _DistortionTiling.xy;
    u_xlat3.xy = _Time.yy * vec2(_DistortionPanner.x, _DistortionPanner.y) + u_xlat3.xy;
    u_xlat16_3.xy = texture(_DistortionTexture, u_xlat3.xy).xy;
    u_xlat2.x = vs_TEXCOORD0.x * _FoamEdgeTiling.x + _FoamEdgeOffset.xxxy.z;
    u_xlat7.xy = vec2(_DistortionAmount) * u_xlat16_3.xy + u_xlat2.xy;
    u_xlat16_7.xy = texture(_FoamRGBMask, u_xlat7.xy).xz;
    u_xlat9 = u_xlat16_7.y + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat16_0 * u_xlat9 + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = vs_TEXCOORD0.x * _FoamEdgeTiling2.x + _FoamEdgeOffset2.xxxy.z;
    u_xlat3.xy = vec2(_DistortionAmount) * u_xlat16_3.xy + u_xlat1.xy;
    u_xlat16_3.xy = texture(_FoamRGBMask, u_xlat3.xy).xz;
    u_xlat6 = u_xlat16_3.y + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_FoamTendrilsTiling2.x, _FoamTendrilsTiling2.y) + _FoamTendrilsOffset2.xy;
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.0149999997) + u_xlat1.xy;
    u_xlat16_9 = texture(_WaterPatternBlur, u_xlat1.xy).y;
    u_xlat3.x = u_xlat6 * u_xlat16_9 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat3.xxx * _FoamEdgeColorBottom.xyz;
    u_xlat2.xyz = (-_FoamEdgeColorBottom.xyz) * u_xlat3.xxx + _FoamEdgeColorTop.xyz;
    u_xlat3.x = u_xlat3.x + u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xzw * vs_COLOR0.xyz;
    u_xlat0.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = vs_TEXCOORD0.y + -0.0700000003;
    u_xlat3.x = u_xlat3.x * 1.80999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
uniform 	vec4 _FoamEdgeColorBottom;
uniform 	vec2 _FoamEdgeTiling2;
uniform 	vec2 _FoamEdgeOffset2;
uniform 	float _DistortionAmount;
uniform 	vec2 _DistortionPanner;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _FoamTendrilsTiling2;
uniform 	vec2 _FoamTendrilsOffset2;
uniform 	vec4 _FoamEdgeColorTop;
uniform 	vec2 _FoamEdgeTiling;
uniform 	vec2 _FoamEdgeOffset;
uniform 	vec2 _FoamTendrilsTiling;
uniform 	vec2 _FoamTendrilsOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FoamRGBMask;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternBlur;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _FoamTendrilsTiling.xy + vec2(_FoamTendrilsOffset.x, _FoamTendrilsOffset.y);
    u_xlat0.xy = _Time.yy * vec2(0.0, 0.0250000004) + u_xlat0.xy;
    u_xlat16_0 = texture(_WaterPatternBlur, u_xlat0.xy).y;
    u_xlat3.x = sin(_Time.y);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat6 = u_xlat3.x * 0.0199999996 + _FoamEdgeOffset.xxxy.w;
    u_xlat3.x = u_xlat3.x * 0.0199999996 + _FoamEdgeOffset2.xxxy.w;
    u_xlat1.y = vs_TEXCOORD0.y * _FoamEdgeTiling2.y + u_xlat3.x;
    u_xlat2.y = vs_TEXCOORD0.y * _FoamEdgeTiling.y + u_xlat6;
    u_xlat3.xy = vs_TEXCOORD0.xy * _DistortionTiling.xy;
    u_xlat3.xy = _Time.yy * vec2(_DistortionPanner.x, _DistortionPanner.y) + u_xlat3.xy;
    u_xlat16_3.xy = texture(_DistortionTexture, u_xlat3.xy).xy;
    u_xlat2.x = vs_TEXCOORD0.x * _FoamEdgeTiling.x + _FoamEdgeOffset.xxxy.z;
    u_xlat7.xy = vec2(_DistortionAmount) * u_xlat16_3.xy + u_xlat2.xy;
    u_xlat16_7.xy = texture(_FoamRGBMask, u_xlat7.xy).xz;
    u_xlat9 = u_xlat16_7.y + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat16_0 * u_xlat9 + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = vs_TEXCOORD0.x * _FoamEdgeTiling2.x + _FoamEdgeOffset2.xxxy.z;
    u_xlat3.xy = vec2(_DistortionAmount) * u_xlat16_3.xy + u_xlat1.xy;
    u_xlat16_3.xy = texture(_FoamRGBMask, u_xlat3.xy).xz;
    u_xlat6 = u_xlat16_3.y + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_FoamTendrilsTiling2.x, _FoamTendrilsTiling2.y) + _FoamTendrilsOffset2.xy;
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.0149999997) + u_xlat1.xy;
    u_xlat16_9 = texture(_WaterPatternBlur, u_xlat1.xy).y;
    u_xlat3.x = u_xlat6 * u_xlat16_9 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat3.xxx * _FoamEdgeColorBottom.xyz;
    u_xlat2.xyz = (-_FoamEdgeColorBottom.xyz) * u_xlat3.xxx + _FoamEdgeColorTop.xyz;
    u_xlat3.x = u_xlat3.x + u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xzw * vs_COLOR0.xyz;
    u_xlat0.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = vs_TEXCOORD0.y + -0.0700000003;
    u_xlat3.x = u_xlat3.x * 1.80999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
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