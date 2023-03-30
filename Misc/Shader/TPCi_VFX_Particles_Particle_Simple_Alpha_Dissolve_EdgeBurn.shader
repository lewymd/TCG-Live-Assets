//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Simple_Alpha_Dissolve_EdgeBurn" {
Properties {
_Cutoff ("Mask Clip Value", Float) = 0.1
_AlphaTex ("Alpha Tex", 2D) = "black" { }
_DistortionTexNormalspreferred ("Distortion Tex (Normals preferred)", 2D) = "white" { }
_jiggleamount ("jiggle amount", Range(0, 1)) = 0
_DissolveTex ("Dissolve Tex", 2D) = "white" { }
_dissolvewidth ("dissolve width", Float) = 0
_DissolveAmountCustomdataonX ("Dissolve Amount (Custom data on X)", Range(0, 1)) = 0
_edgeColorTex ("edgeColor Tex", 2D) = "white" { }
_EdgeWidth ("Edge Width", Float) = 0
_Color1OnEdges ("Color 1 (On Edges)", Color) = (0,0,0,0)
_Color2OnEdges ("Color 2 (On Edges)", Color) = (0,0,0,0)
_edgeColorDistortionAmount ("edgeColor Distortion Amount", Float) = 0
_colorPower ("color Power", Range(0, 1)) = 0
_Speed ("Speed", Vector) = (1,0,0,0)
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
  GpuProgramID 2618
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
uniform 	vec4 _Color1OnEdges;
uniform 	vec4 _Color2OnEdges;
uniform 	vec4 _DistortionTexNormalspreferred_ST;
uniform 	float _edgeColorDistortionAmount;
uniform 	vec2 _Speed;
uniform 	float _colorPower;
uniform 	float _jiggleamount;
uniform 	float _DissolveAmountCustomdataonX;
uniform 	float _EdgeWidth;
uniform 	float _dissolvewidth;
uniform 	vec4 _AlphaTex_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexNormalspreferred;
UNITY_LOCATION(1) uniform mediump sampler2D _edgeColorTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_0 = texture(_AlphaTex, u_xlat0.xy).x;
    u_xlat3.xy = _Time.yy * vec2(_Speed.x, _Speed.y) + vs_TEXCOORD0.xy;
    u_xlat16_1.xy = texture(_DistortionTexNormalspreferred, u_xlat3.xy).xy;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat16_2.xy * vec2(_jiggleamount) + vs_TEXCOORD0.xy;
    u_xlat9 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.x = vs_TEXCOORD1.z + _DissolveAmountCustomdataonX;
    u_xlat4 = u_xlat1.x + (-_dissolvewidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4>=u_xlat9);
#else
    u_xlatb4 = u_xlat4>=u_xlat9;
#endif
    u_xlat4 = (u_xlatb4) ? 0.0 : vs_COLOR0.x;
    u_xlat0.x = u_xlat4 * u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.x = u_xlat1.x * _EdgeWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=u_xlat9);
#else
    u_xlatb1 = u_xlat1.x>=u_xlat9;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat9);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat9;
#endif
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
    u_xlat9 = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat9 * 2.0 + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DistortionTexNormalspreferred_ST.xy + _DistortionTexNormalspreferred_ST.zw;
    u_xlat16_1.xy = texture(_DistortionTexNormalspreferred, u_xlat1.xy).xy;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat16_2.xy * vec2(_edgeColorDistortionAmount) + u_xlat3.xy;
    u_xlat16_3 = texture(_edgeColorTex, u_xlat3.xy).x;
    u_xlat1.xyz = (-_Color1OnEdges.xyz) + _Color2OnEdges.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat1.xyz + _Color1OnEdges.xyz;
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_colorPower, _colorPower, _colorPower));
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_colorPower, _colorPower, _colorPower));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx + (-vs_COLOR0.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
uniform 	vec4 _Color1OnEdges;
uniform 	vec4 _Color2OnEdges;
uniform 	vec4 _DistortionTexNormalspreferred_ST;
uniform 	float _edgeColorDistortionAmount;
uniform 	vec2 _Speed;
uniform 	float _colorPower;
uniform 	float _jiggleamount;
uniform 	float _DissolveAmountCustomdataonX;
uniform 	float _EdgeWidth;
uniform 	float _dissolvewidth;
uniform 	vec4 _AlphaTex_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexNormalspreferred;
UNITY_LOCATION(1) uniform mediump sampler2D _edgeColorTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_0 = texture(_AlphaTex, u_xlat0.xy).x;
    u_xlat3.xy = _Time.yy * vec2(_Speed.x, _Speed.y) + vs_TEXCOORD0.xy;
    u_xlat16_1.xy = texture(_DistortionTexNormalspreferred, u_xlat3.xy).xy;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat16_2.xy * vec2(_jiggleamount) + vs_TEXCOORD0.xy;
    u_xlat9 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.x = vs_TEXCOORD1.z + _DissolveAmountCustomdataonX;
    u_xlat4 = u_xlat1.x + (-_dissolvewidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4>=u_xlat9);
#else
    u_xlatb4 = u_xlat4>=u_xlat9;
#endif
    u_xlat4 = (u_xlatb4) ? 0.0 : vs_COLOR0.x;
    u_xlat0.x = u_xlat4 * u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.x = u_xlat1.x * _EdgeWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=u_xlat9);
#else
    u_xlatb1 = u_xlat1.x>=u_xlat9;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat9);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat9;
#endif
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
    u_xlat9 = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat9 * 2.0 + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DistortionTexNormalspreferred_ST.xy + _DistortionTexNormalspreferred_ST.zw;
    u_xlat16_1.xy = texture(_DistortionTexNormalspreferred, u_xlat1.xy).xy;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat16_2.xy * vec2(_edgeColorDistortionAmount) + u_xlat3.xy;
    u_xlat16_3 = texture(_edgeColorTex, u_xlat3.xy).x;
    u_xlat1.xyz = (-_Color1OnEdges.xyz) + _Color2OnEdges.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat1.xyz + _Color1OnEdges.xyz;
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_colorPower, _colorPower, _colorPower));
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_colorPower, _colorPower, _colorPower));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx + (-vs_COLOR0.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
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