//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards_Fire_BurnDissolve_NewLayout" {
Properties {
_Cutoff ("Mask Clip Value", Float) = 0.5
_T_VFX_Fire_Gradient_BurnExpansion ("T_VFX_Fire_Gradient_BurnExpansion", 2D) = "white" { }
_T_VFX_Shared_RenderClouds_Minimize ("T_VFX_Shared_RenderClouds_Minimize", 2D) = "white" { }
_DefaultTexture ("Default Texture", 2D) = "white" { }
_T_Jumbotron_Fireboard_D ("T_Jumbotron_Fireboard_D", 2D) = "white" { }
_T_Jumbotron_Fireboard_N ("T_Jumbotron_Fireboard_N", 2D) = "bump" { }
_T_VFX_Shared_RenderClouds ("T_VFX_Shared_RenderClouds", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
_tex4coord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "TransparentCutout" }
  ZWrite Off
  GpuProgramID 38611
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
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
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
uniform 	vec4 _T_Jumbotron_Fireboard_N_ST;
uniform 	vec4 _DefaultTexture_ST;
uniform 	vec4 _T_Jumbotron_Fireboard_D_ST;
uniform 	vec4 _T_VFX_Fire_Gradient_BurnExpansion_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _T_Jumbotron_Fireboard_D;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Fire_Gradient_BurnExpansion;
UNITY_LOCATION(2) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize;
UNITY_LOCATION(3) uniform mediump sampler2D _DefaultTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_RenderClouds;
UNITY_LOCATION(5) uniform mediump sampler2D _T_Jumbotron_Fireboard_N;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat6;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _T_VFX_Fire_Gradient_BurnExpansion_ST.xy + _T_VFX_Fire_Gradient_BurnExpansion_ST.zw;
    u_xlat16_0.xyz = texture(_T_VFX_Fire_Gradient_BurnExpansion, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(1.0, 0.5, 4.0, 2.0);
    u_xlat1 = _Time.yyyy * vec4(0.0500000007, -0.100000001, 0.0, 0.150000006) + u_xlat1;
    u_xlat16_2.xyz = texture(_T_VFX_Shared_RenderClouds_Minimize, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_T_VFX_Shared_RenderClouds, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat2.xyz + (-vs_TEXCOORD1.zzz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(50.0, 50.0, 50.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(8.47999954, 8.47999954, 8.47999954);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.74000001, 1.74000001, 1.74000001);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = u_xlat2.xyz * vec3(91.8399963, 10.5097466, 0.0335300639);
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat3.xyz = min(vec3(u_xlat15), vec3(1.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat15 = min(u_xlat0.x, 1.0);
    u_xlat15 = u_xlat15 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<0.0);
#else
    u_xlatb15 = u_xlat15<0.0;
#endif
    if(u_xlatb15){discard;}
    u_xlat3.xy = vs_TEXCOORD0.xy * _T_Jumbotron_Fireboard_D_ST.xy + _T_Jumbotron_Fireboard_D_ST.zw;
    u_xlat16_3 = texture(_T_Jumbotron_Fireboard_D, u_xlat3.xy);
    u_xlat15 = u_xlat16_3.w + -0.0299999993;
    u_xlat15 = u_xlat15 * 1.03092778;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(45.5900002, 24.3483009, 0.386928439) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(91.8399963, 10.5097466, 0.0335300639) + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DefaultTexture_ST.xy + _DefaultTexture_ST.zw;
    u_xlat16_2.xyz = texture(_DefaultTexture, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _T_Jumbotron_Fireboard_N_ST.xy + _T_Jumbotron_Fireboard_N_ST.zw;
    u_xlat16_15 = texture(_T_Jumbotron_Fireboard_N, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat16_15 * 2.0 + -1.0;
    u_xlat15 = u_xlat16_4 + vs_TEXCOORD0.y;
    u_xlat15 = u_xlat15 + -0.0941634327;
    u_xlat15 = u_xlat15 * 1.10395193;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat15)) + vec2(1.0, 1.05499995);
    u_xlat15 = log2(u_xlat1.x);
    u_xlat15 = u_xlat15 * 2.20000005;
    u_xlat15 = exp2(u_xlat15);
    u_xlat6.xy = u_xlat1.xy * vec2(0.0773993805, 0.947867334);
    u_xlat11 = log2(u_xlat6.y);
    u_xlat11 = u_xlat11 * 2.4000001;
    u_xlat11 = exp2(u_xlat11);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat1.x<1.0);
#else
    u_xlatb16 = u_xlat1.x<1.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0404499993>=u_xlat1.x);
#else
    u_xlatb1 = 0.0404499993>=u_xlat1.x;
#endif
    u_xlat15 = (u_xlatb16) ? u_xlat11 : u_xlat15;
    u_xlat15 = (u_xlatb1) ? u_xlat6.x : u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * vec3(0.0432035811, 0.0176327098, 0.0067964741) + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
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
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
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
uniform 	vec4 _T_Jumbotron_Fireboard_N_ST;
uniform 	vec4 _DefaultTexture_ST;
uniform 	vec4 _T_Jumbotron_Fireboard_D_ST;
uniform 	vec4 _T_VFX_Fire_Gradient_BurnExpansion_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _T_Jumbotron_Fireboard_D;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Fire_Gradient_BurnExpansion;
UNITY_LOCATION(2) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize;
UNITY_LOCATION(3) uniform mediump sampler2D _DefaultTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_RenderClouds;
UNITY_LOCATION(5) uniform mediump sampler2D _T_Jumbotron_Fireboard_N;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat6;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _T_VFX_Fire_Gradient_BurnExpansion_ST.xy + _T_VFX_Fire_Gradient_BurnExpansion_ST.zw;
    u_xlat16_0.xyz = texture(_T_VFX_Fire_Gradient_BurnExpansion, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(1.0, 0.5, 4.0, 2.0);
    u_xlat1 = _Time.yyyy * vec4(0.0500000007, -0.100000001, 0.0, 0.150000006) + u_xlat1;
    u_xlat16_2.xyz = texture(_T_VFX_Shared_RenderClouds_Minimize, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_T_VFX_Shared_RenderClouds, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat2.xyz + (-vs_TEXCOORD1.zzz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(50.0, 50.0, 50.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(8.47999954, 8.47999954, 8.47999954);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.74000001, 1.74000001, 1.74000001);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat3.xyz = u_xlat2.xyz * vec3(91.8399963, 10.5097466, 0.0335300639);
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat3.xyz = min(vec3(u_xlat15), vec3(1.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat15 = min(u_xlat0.x, 1.0);
    u_xlat15 = u_xlat15 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<0.0);
#else
    u_xlatb15 = u_xlat15<0.0;
#endif
    if(u_xlatb15){discard;}
    u_xlat3.xy = vs_TEXCOORD0.xy * _T_Jumbotron_Fireboard_D_ST.xy + _T_Jumbotron_Fireboard_D_ST.zw;
    u_xlat16_3 = texture(_T_Jumbotron_Fireboard_D, u_xlat3.xy);
    u_xlat15 = u_xlat16_3.w + -0.0299999993;
    u_xlat15 = u_xlat15 * 1.03092778;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(45.5900002, 24.3483009, 0.386928439) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(91.8399963, 10.5097466, 0.0335300639) + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DefaultTexture_ST.xy + _DefaultTexture_ST.zw;
    u_xlat16_2.xyz = texture(_DefaultTexture, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _T_Jumbotron_Fireboard_N_ST.xy + _T_Jumbotron_Fireboard_N_ST.zw;
    u_xlat16_15 = texture(_T_Jumbotron_Fireboard_N, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat16_15 * 2.0 + -1.0;
    u_xlat15 = u_xlat16_4 + vs_TEXCOORD0.y;
    u_xlat15 = u_xlat15 + -0.0941634327;
    u_xlat15 = u_xlat15 * 1.10395193;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat15)) + vec2(1.0, 1.05499995);
    u_xlat15 = log2(u_xlat1.x);
    u_xlat15 = u_xlat15 * 2.20000005;
    u_xlat15 = exp2(u_xlat15);
    u_xlat6.xy = u_xlat1.xy * vec2(0.0773993805, 0.947867334);
    u_xlat11 = log2(u_xlat6.y);
    u_xlat11 = u_xlat11 * 2.4000001;
    u_xlat11 = exp2(u_xlat11);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat1.x<1.0);
#else
    u_xlatb16 = u_xlat1.x<1.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0404499993>=u_xlat1.x);
#else
    u_xlatb1 = 0.0404499993>=u_xlat1.x;
#endif
    u_xlat15 = (u_xlatb16) ? u_xlat11 : u_xlat15;
    u_xlat15 = (u_xlatb1) ? u_xlat6.x : u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * vec3(0.0432035811, 0.0176327098, 0.0067964741) + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
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