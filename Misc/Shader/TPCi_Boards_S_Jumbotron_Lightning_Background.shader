//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/S_Jumbotron_Lightning_Background" {
Properties {
_T_VFX_Lightning_N ("T_VFX_Lightning_N", 2D) = "bump" { }
_T_VFX_Lightning_D ("T_VFX_Lightning_D", 2D) = "white" { }
_T_VFX_Lightning_H ("T_VFX_Lightning_H", 2D) = "white" { }
_Texture0 ("Texture 0", 2D) = "black" { }
_TextureSample3 ("Texture Sample 3", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 44393
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
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
uniform 	vec4 _T_VFX_Lightning_N_ST;
uniform 	vec4 _Texture0_ST;
uniform 	vec4 _T_VFX_Lightning_H_ST;
uniform 	vec4 _T_VFX_Lightning_D_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Lightning_H;
UNITY_LOCATION(2) uniform mediump sampler2D _T_VFX_Lightning_N;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_Lightning_D;
UNITY_LOCATION(4) uniform mediump sampler2D _TextureSample3;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
int u_xlati1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec2 u_xlat16_14;
vec2 u_xlat17;
mediump float u_xlat16_17;
float u_xlat24;
bool u_xlatb24;
float u_xlat26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Texture0_ST.xy + _Texture0_ST.zw;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat24 = dFdx(u_xlat16_0.x);
    u_xlat1.x = dFdy(u_xlat16_0.x);
    u_xlat0.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00999999978, 0.00999999978, 0.00999999978) + vec3(0.0262412205, 0.0273208898, 0.0528606512);
    u_xlat2.z = vs_TEXCOORD1.w;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat9.xyz = u_xlat2.xyz * vec3(100.0, 100.0, 100.0);
    u_xlat2.xyz = dFdx(u_xlat9.xyz);
    u_xlat9.xyz = dFdy(u_xlat9.xyz);
    u_xlat3.y = vs_TEXCOORD2.z;
    u_xlat3.z = vs_TEXCOORD3.z;
    u_xlat3.x = vs_TEXCOORD1.z;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = u_xlat3.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat9.xyz * u_xlat3.zxy;
    u_xlat1.xyz = u_xlat3.yzx * u_xlat9.yzx + (-u_xlat5.xyz);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat24 = dot(u_xlat1.yzx, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<abs(u_xlat24); u_xlati1 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati1 = int((0.0<abs(u_xlat24)) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlat1.x = float((-u_xlati1));
    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.w = (-u_xlat1.y);
    u_xlat1.xyz = abs(vec3(u_xlat24)) * u_xlat3.xyz + (-u_xlat1.xwz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat2.z = u_xlat24 * 1.5;
    u_xlat3.x = vs_TEXCOORD1.x;
    u_xlat3.y = vs_TEXCOORD2.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat4.x = vs_TEXCOORD1.y;
    u_xlat4.y = vs_TEXCOORD2.y;
    u_xlat4.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat16_2.xy = u_xlat3.xy * vec2(1.5, 1.5) + vec2(0.215860501, 0.215860501);
    u_xlat2.xy = u_xlat16_2.xy;
    u_xlat16_6 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_6 = inversesqrt(u_xlat16_6);
    u_xlat1.xy = vs_TEXCOORD0.xy * _T_VFX_Lightning_N_ST.xy + _T_VFX_Lightning_N_ST.zw;
    u_xlat16_1.xy = texture(_T_VFX_Lightning_N, u_xlat1.xy).xy;
    u_xlat16_14.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat2.xy * vec2(u_xlat16_6) + (-u_xlat16_14.xy);
    u_xlat17.xy = vs_TEXCOORD0.xy * _T_VFX_Lightning_H_ST.xy + _T_VFX_Lightning_H_ST.zw;
    u_xlat16_2.xyz = texture(_T_VFX_Lightning_H, u_xlat17.xy).xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * vec3(1.73611116, 1.73611116, 1.73611116);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_2.x>=0.569999993);
#else
    u_xlatb24 = u_xlat16_2.x>=0.569999993;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat10.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat16_14.xy;
    u_xlat17.xy = u_xlat1.xy * vec2(0.0500000007, 0.0500000007) + vs_TEXCOORD0.xy;
    u_xlat16_17 = texture(_Texture0, u_xlat17.xy).y;
    u_xlat3.xyz = vec3(u_xlat16_17) * vec3(0.249231011, 0.300000012, 0.189227179);
    u_xlat17.xy = vs_TEXCOORD0.xy * _T_VFX_Lightning_D_ST.xy + _T_VFX_Lightning_D_ST.zw;
    u_xlat16_4.xyz = texture(_T_VFX_Lightning_D, u_xlat17.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_4.xyz);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat16_17 = texture(_Texture0, u_xlat1.xy).z;
    u_xlat16_1.xyw = texture(_TextureSample3, u_xlat1.xy).xyz;
    u_xlat17.x = u_xlat16_17 + -0.0900000036;
    u_xlat17.x = u_xlat17.x * 1.09890115;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat17.x * -2.0 + 3.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = (-u_xlat26) * u_xlat17.x + 1.0;
    u_xlat17.x = max(u_xlat17.x, 9.99999975e-06);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat17.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_1.xyw * u_xlat2.xyz + vec3(-0.460000008, -0.460000008, -0.460000008);
    u_xlat2.xyz = vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_1.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xyw + u_xlat16_1.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.85185194, 1.85185194, 1.85185194);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat7.xyz = u_xlat4.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.258182913, 0.361306906, 0.473531514);
    u_xlat3.xyz = u_xlat5.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) * vec3(0.0761853904, 0.250158399, 0.417885214) + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0761853904, 0.250158399, 0.417885214);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
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
uniform 	vec4 _T_VFX_Lightning_N_ST;
uniform 	vec4 _Texture0_ST;
uniform 	vec4 _T_VFX_Lightning_H_ST;
uniform 	vec4 _T_VFX_Lightning_D_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Lightning_H;
UNITY_LOCATION(2) uniform mediump sampler2D _T_VFX_Lightning_N;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_Lightning_D;
UNITY_LOCATION(4) uniform mediump sampler2D _TextureSample3;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
int u_xlati1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec2 u_xlat16_14;
vec2 u_xlat17;
mediump float u_xlat16_17;
float u_xlat24;
bool u_xlatb24;
float u_xlat26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Texture0_ST.xy + _Texture0_ST.zw;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat24 = dFdx(u_xlat16_0.x);
    u_xlat1.x = dFdy(u_xlat16_0.x);
    u_xlat0.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00999999978, 0.00999999978, 0.00999999978) + vec3(0.0262412205, 0.0273208898, 0.0528606512);
    u_xlat2.z = vs_TEXCOORD1.w;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat9.xyz = u_xlat2.xyz * vec3(100.0, 100.0, 100.0);
    u_xlat2.xyz = dFdx(u_xlat9.xyz);
    u_xlat9.xyz = dFdy(u_xlat9.xyz);
    u_xlat3.y = vs_TEXCOORD2.z;
    u_xlat3.z = vs_TEXCOORD3.z;
    u_xlat3.x = vs_TEXCOORD1.z;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = u_xlat3.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat9.xyz * u_xlat3.zxy;
    u_xlat1.xyz = u_xlat3.yzx * u_xlat9.yzx + (-u_xlat5.xyz);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat24 = dot(u_xlat1.yzx, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<abs(u_xlat24); u_xlati1 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati1 = int((0.0<abs(u_xlat24)) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlat1.x = float((-u_xlati1));
    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.w = (-u_xlat1.y);
    u_xlat1.xyz = abs(vec3(u_xlat24)) * u_xlat3.xyz + (-u_xlat1.xwz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat2.z = u_xlat24 * 1.5;
    u_xlat3.x = vs_TEXCOORD1.x;
    u_xlat3.y = vs_TEXCOORD2.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat4.x = vs_TEXCOORD1.y;
    u_xlat4.y = vs_TEXCOORD2.y;
    u_xlat4.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat16_2.xy = u_xlat3.xy * vec2(1.5, 1.5) + vec2(0.215860501, 0.215860501);
    u_xlat2.xy = u_xlat16_2.xy;
    u_xlat16_6 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_6 = inversesqrt(u_xlat16_6);
    u_xlat1.xy = vs_TEXCOORD0.xy * _T_VFX_Lightning_N_ST.xy + _T_VFX_Lightning_N_ST.zw;
    u_xlat16_1.xy = texture(_T_VFX_Lightning_N, u_xlat1.xy).xy;
    u_xlat16_14.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat2.xy * vec2(u_xlat16_6) + (-u_xlat16_14.xy);
    u_xlat17.xy = vs_TEXCOORD0.xy * _T_VFX_Lightning_H_ST.xy + _T_VFX_Lightning_H_ST.zw;
    u_xlat16_2.xyz = texture(_T_VFX_Lightning_H, u_xlat17.xy).xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * vec3(1.73611116, 1.73611116, 1.73611116);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_2.x>=0.569999993);
#else
    u_xlatb24 = u_xlat16_2.x>=0.569999993;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat10.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat16_14.xy;
    u_xlat17.xy = u_xlat1.xy * vec2(0.0500000007, 0.0500000007) + vs_TEXCOORD0.xy;
    u_xlat16_17 = texture(_Texture0, u_xlat17.xy).y;
    u_xlat3.xyz = vec3(u_xlat16_17) * vec3(0.249231011, 0.300000012, 0.189227179);
    u_xlat17.xy = vs_TEXCOORD0.xy * _T_VFX_Lightning_D_ST.xy + _T_VFX_Lightning_D_ST.zw;
    u_xlat16_4.xyz = texture(_T_VFX_Lightning_D, u_xlat17.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_4.xyz);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat16_17 = texture(_Texture0, u_xlat1.xy).z;
    u_xlat16_1.xyw = texture(_TextureSample3, u_xlat1.xy).xyz;
    u_xlat17.x = u_xlat16_17 + -0.0900000036;
    u_xlat17.x = u_xlat17.x * 1.09890115;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat17.x * -2.0 + 3.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = (-u_xlat26) * u_xlat17.x + 1.0;
    u_xlat17.x = max(u_xlat17.x, 9.99999975e-06);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat17.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_1.xyw * u_xlat2.xyz + vec3(-0.460000008, -0.460000008, -0.460000008);
    u_xlat2.xyz = vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_1.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xyw + u_xlat16_1.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.85185194, 1.85185194, 1.85185194);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat7.xyz = u_xlat4.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.258182913, 0.361306906, 0.473531514);
    u_xlat3.xyz = u_xlat5.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) * vec3(0.0761853904, 0.250158399, 0.417885214) + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0761853904, 0.250158399, 0.417885214);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  Blend One One, One One
  ZWrite Off
  GpuProgramID 81547
Program "vp" {
SubProgram "gles3 " {
Keywords { "POINT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD0.y = u_xlat3.x;
    vs_TEXCOORD0.x = u_xlat2.z;
    vs_TEXCOORD0.z = u_xlat1.y;
    vs_TEXCOORD1.x = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat2.y;
    vs_TEXCOORD1.z = u_xlat1.z;
    vs_TEXCOORD2.z = u_xlat1.x;
    vs_TEXCOORD1.y = u_xlat3.y;
    vs_TEXCOORD2.y = u_xlat3.z;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
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
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD0.y = u_xlat2.x;
    vs_TEXCOORD0.x = u_xlat1.z;
    vs_TEXCOORD0.z = u_xlat0.y;
    vs_TEXCOORD1.x = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat1.y;
    vs_TEXCOORD1.z = u_xlat0.z;
    vs_TEXCOORD2.z = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat2.y;
    vs_TEXCOORD2.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD0.y = u_xlat3.x;
    vs_TEXCOORD0.x = u_xlat2.z;
    vs_TEXCOORD0.z = u_xlat1.y;
    vs_TEXCOORD1.x = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat2.y;
    vs_TEXCOORD1.z = u_xlat1.z;
    vs_TEXCOORD2.z = u_xlat1.x;
    vs_TEXCOORD1.y = u_xlat3.y;
    vs_TEXCOORD2.y = u_xlat3.z;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD0.y = u_xlat3.x;
    vs_TEXCOORD0.x = u_xlat2.z;
    vs_TEXCOORD0.z = u_xlat1.y;
    vs_TEXCOORD1.x = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat2.y;
    vs_TEXCOORD1.z = u_xlat1.z;
    vs_TEXCOORD2.z = u_xlat1.x;
    vs_TEXCOORD1.y = u_xlat3.y;
    vs_TEXCOORD2.y = u_xlat3.z;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD0.y = u_xlat3.x;
    vs_TEXCOORD0.x = u_xlat2.z;
    vs_TEXCOORD0.z = u_xlat1.y;
    vs_TEXCOORD1.x = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat2.y;
    vs_TEXCOORD1.z = u_xlat1.z;
    vs_TEXCOORD2.z = u_xlat1.x;
    vs_TEXCOORD1.y = u_xlat3.y;
    vs_TEXCOORD2.y = u_xlat3.z;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD4.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}