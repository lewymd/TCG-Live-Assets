//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/EnergySphere_EnergyWisp" {
Properties {
_WispColor ("Wisp Color ", Color) = (1,1,1,0)
_T_EnergySpheres_WispMask ("T_EnergySpheres_WispMask", 2D) = "white" { }
_PannerSpeed ("Panner Speed", Vector) = (0,0,0,0)
_WispBrightness ("Wisp Brightness", Float) = 1
_WispOpacity ("Wisp Opacity", Float) = 1
_GlowOpacity ("Glow Opacity", Float) = 1
_GlowColor ("Glow Color", Color) = (0,0,0,0)
_GlowBrightness ("Glow Brightness", Float) = 1
_T_VFX_Clouds_Minimize ("T_VFX_Clouds_Minimize", 2D) = "white" { }
_T_VFX_Direction_RG_Clouds ("T_VFX_Direction_RG_Clouds", 2D) = "white" { }
_DistortionAmount ("Distortion Amount", Float) = 0.05
_DistortionTiling ("Distortion Tiling", Vector) = (1,1,0,0)
_DistortionOffset ("Distortion Offset", Vector) = (0,0,0,0)
_DistortionPanning ("Distortion Panning", Vector) = (0,-0.1,0,0)
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
  GpuProgramID 41578
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WispColor;
uniform 	float _WispBrightness;
uniform 	vec4 _GlowColor;
uniform 	float _GlowBrightness;
uniform 	float _WispOpacity;
uniform 	vec2 _PannerSpeed;
uniform 	vec2 _DistortionPanning;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _DistortionOffset;
uniform 	float _DistortionAmount;
uniform 	float _GlowOpacity;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Direction_RG_Clouds;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Clouds_Minimize;
UNITY_LOCATION(2) uniform mediump sampler2D _T_EnergySpheres_WispMask;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat6;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.97000003;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_DistortionTiling.x, _DistortionTiling.y) + _DistortionOffset.xy;
    u_xlat3.xy = _Time.yy * _DistortionPanning.xy + u_xlat3.xy;
    u_xlat16_3.xy = texture(_T_VFX_Direction_RG_Clouds, u_xlat3.xy).xy;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(2.0, 1.0, 2.0, 0.25);
    u_xlat3.xy = u_xlat16_3.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat1.zw;
    u_xlat16_9 = texture(_T_VFX_Clouds_Minimize, u_xlat1.xy).x;
    u_xlat3.xy = _Time.yy * vec2(_PannerSpeed.x, _PannerSpeed.y) + u_xlat3.xy;
    u_xlat16_3.x = texture(_T_EnergySpheres_WispMask, u_xlat3.xy).x;
    u_xlat6 = vs_TEXCOORD0.y * 3.0;
    u_xlat3.x = u_xlat16_3.x * u_xlat6;
    u_xlat6 = u_xlat16_9 * u_xlat16_9;
    u_xlat6 = u_xlat6 * u_xlat16_9;
    u_xlat9 = u_xlat16_9 + 0.25;
    u_xlat6 = u_xlat6 * 3.0 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat6 * u_xlat3.x;
    u_xlat9 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * 1.90999997;
    u_xlat9 = exp2(u_xlat9);
    u_xlat9 = u_xlat9 * vs_COLOR0.y;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat6 = u_xlat6 * _GlowOpacity;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat1.x;
    u_xlat3.x = u_xlat3.x * vs_COLOR0.x;
    u_xlat3.x = u_xlat3.x * _WispOpacity;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 + u_xlat0.x;
    u_xlat0.w = min(u_xlat0.x, 1.0);
    u_xlat1.xyz = vs_COLOR0.yyy * _GlowColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_GlowBrightness);
    u_xlat2.xyz = vs_COLOR0.xxx * _WispColor.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(_WispBrightness) + u_xlat1.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WispColor;
uniform 	float _WispBrightness;
uniform 	vec4 _GlowColor;
uniform 	float _GlowBrightness;
uniform 	float _WispOpacity;
uniform 	vec2 _PannerSpeed;
uniform 	vec2 _DistortionPanning;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _DistortionOffset;
uniform 	float _DistortionAmount;
uniform 	float _GlowOpacity;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Direction_RG_Clouds;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Clouds_Minimize;
UNITY_LOCATION(2) uniform mediump sampler2D _T_EnergySpheres_WispMask;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat6;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.97000003;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_DistortionTiling.x, _DistortionTiling.y) + _DistortionOffset.xy;
    u_xlat3.xy = _Time.yy * _DistortionPanning.xy + u_xlat3.xy;
    u_xlat16_3.xy = texture(_T_VFX_Direction_RG_Clouds, u_xlat3.xy).xy;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(2.0, 1.0, 2.0, 0.25);
    u_xlat3.xy = u_xlat16_3.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat1.zw;
    u_xlat16_9 = texture(_T_VFX_Clouds_Minimize, u_xlat1.xy).x;
    u_xlat3.xy = _Time.yy * vec2(_PannerSpeed.x, _PannerSpeed.y) + u_xlat3.xy;
    u_xlat16_3.x = texture(_T_EnergySpheres_WispMask, u_xlat3.xy).x;
    u_xlat6 = vs_TEXCOORD0.y * 3.0;
    u_xlat3.x = u_xlat16_3.x * u_xlat6;
    u_xlat6 = u_xlat16_9 * u_xlat16_9;
    u_xlat6 = u_xlat6 * u_xlat16_9;
    u_xlat9 = u_xlat16_9 + 0.25;
    u_xlat6 = u_xlat6 * 3.0 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat6 * u_xlat3.x;
    u_xlat9 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * 1.90999997;
    u_xlat9 = exp2(u_xlat9);
    u_xlat9 = u_xlat9 * vs_COLOR0.y;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat6 = u_xlat6 * _GlowOpacity;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat1.x;
    u_xlat3.x = u_xlat3.x * vs_COLOR0.x;
    u_xlat3.x = u_xlat3.x * _WispOpacity;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 + u_xlat0.x;
    u_xlat0.w = min(u_xlat0.x, 1.0);
    u_xlat1.xyz = vs_COLOR0.yyy * _GlowColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_GlowBrightness);
    u_xlat2.xyz = vs_COLOR0.xxx * _WispColor.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(_WispBrightness) + u_xlat1.xyz;
    SV_Target0 = u_xlat0;
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