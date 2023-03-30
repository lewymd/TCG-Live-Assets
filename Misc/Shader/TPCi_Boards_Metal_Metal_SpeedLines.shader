//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Metal/Metal_SpeedLines" {
Properties {
_Texture0 ("Texture 0", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
 GrabPass {
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 1036
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ProjectionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
float u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(2.0, 0.100000001, 1.0, 0.100000001);
    u_xlat0 = _Time.yyyy * vec4(0.0, 1.5, 0.0, 1.0) + u_xlat0;
    u_xlat16_6 = texture(_Texture0, u_xlat0.zw).x;
    u_xlat16_0 = texture(_Texture0, u_xlat0.xy).y;
    u_xlat3 = u_xlat16_6 * 1.5;
    u_xlat6 = u_xlat16_0 * 3.0 + u_xlat16_6;
    u_xlat1.xyz = vec3(u_xlat16_0) * vec3(0.604914188, 0.957614005, 0.737946212);
    u_xlat2.xyz = (-vec3(u_xlat16_0)) * vec3(0.604914188, 0.957614005, 0.737946212) + vec3(0.201176301, 1.0, 0.833106279);
    u_xlat0.xyw = vec3(u_xlat3) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vs_COLOR0.xyz;
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat4 = u_xlat1.x * 0.5;
    u_xlat7 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat2.y = u_xlat7 * _ProjectionParams.x + u_xlat4;
    u_xlat2.x = vs_TEXCOORD3.x;
    u_xlat1.xy = u_xlat2.xy / u_xlat1.xx;
    u_xlat7 = u_xlat6 * vs_COLOR0.w;
    u_xlat1.xy = vec2(u_xlat7) * vec2(0.100000001, 0.100000001) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat0.x = u_xlat0.x * 6.07000017;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 5.55000019;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ProjectionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
float u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(2.0, 0.100000001, 1.0, 0.100000001);
    u_xlat0 = _Time.yyyy * vec4(0.0, 1.5, 0.0, 1.0) + u_xlat0;
    u_xlat16_6 = texture(_Texture0, u_xlat0.zw).x;
    u_xlat16_0 = texture(_Texture0, u_xlat0.xy).y;
    u_xlat3 = u_xlat16_6 * 1.5;
    u_xlat6 = u_xlat16_0 * 3.0 + u_xlat16_6;
    u_xlat1.xyz = vec3(u_xlat16_0) * vec3(0.604914188, 0.957614005, 0.737946212);
    u_xlat2.xyz = (-vec3(u_xlat16_0)) * vec3(0.604914188, 0.957614005, 0.737946212) + vec3(0.201176301, 1.0, 0.833106279);
    u_xlat0.xyw = vec3(u_xlat3) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vs_COLOR0.xyz;
    u_xlat1.x = vs_TEXCOORD3.w + 9.99999996e-12;
    u_xlat4 = u_xlat1.x * 0.5;
    u_xlat7 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat2.y = u_xlat7 * _ProjectionParams.x + u_xlat4;
    u_xlat2.x = vs_TEXCOORD3.x;
    u_xlat1.xy = u_xlat2.xy / u_xlat1.xx;
    u_xlat7 = u_xlat6 * vs_COLOR0.w;
    u_xlat1.xy = vec2(u_xlat7) * vec2(0.100000001, 0.100000001) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat0.x = u_xlat0.x * 6.07000017;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 5.55000019;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
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