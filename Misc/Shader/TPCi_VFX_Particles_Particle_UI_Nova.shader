//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_UI_Nova" {
Properties {
_T_VFX_Shared_Spectrum ("T_VFX_Shared_Spectrum", 2D) = "white" { }
_TextureSample1 ("Texture Sample 1", 2D) = "white" { }
_Brightness ("Brightness", Float) = 6
_Noise1 ("Noise 1", 2D) = "white" { }
_CardMask ("Card Mask", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
_tex4coord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
  Blend One One, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 24277
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
uniform 	float _Brightness;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler602;
UNITY_LOCATION(2) uniform mediump sampler2D _Noise1;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_Shared_Spectrum;
UNITY_LOCATION(4) uniform mediump sampler2D _CardMask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb13;
float u_xlat14;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat5.x = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5.x * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5.x * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5.x * u_xlat9 + -0.330299497;
    u_xlat5.x = u_xlat5.x * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb13 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5.x + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb5 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5.x + u_xlat1.x;
    u_xlat5.x = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5.x<(-u_xlat5.x));
#else
    u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
#endif
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
#else
    u_xlatb9 = u_xlat9>=(-u_xlat9);
#endif
    u_xlatb5 = u_xlatb9 && u_xlatb5;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.159154937;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.xy = _Time.yy * vec2(0.075000003, 0.0500000007) + u_xlat1.xx;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_4.xyz = texture(_CardMask, u_xlat0.zw).xyz;
    u_xlat4.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.z = u_xlat0.x + (-_Time.y);
    u_xlat1.xz = u_xlat1.xz * vec2(1.0, 0.25);
    u_xlat16_2.xyz = texture(_TextureSample1, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-0.50999999, -0.50999999, -0.50999999);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.04081631, 2.04081631, 2.04081631);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat1.xz = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_1.xz = texture(_Sampler602, u_xlat1.xz).xy;
    u_xlat1.w = _Time.y * -3.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.yw * vec2(2.0, 0.100000001) + u_xlat16_1.xz;
    u_xlat16_1.xyz = texture(_Noise1, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + vec3(-0.300000012, -0.300000012, -0.300000012);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.42857146, 1.42857146, 1.42857146);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz * u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.x = u_xlat1.x * u_xlat3.x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat14 * 1.13;
    u_xlat3.x = u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat14;
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat2.x = u_xlat1.x * u_xlat3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat2.y = 0.0;
    u_xlat16_2.xyz = texture(_T_VFX_Shared_Spectrum, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyw = u_xlat1.yzx * vs_COLOR0.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Brightness);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyz = u_xlat1.wxy * u_xlat0.xyz;
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
uniform 	float _Brightness;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler602;
UNITY_LOCATION(2) uniform mediump sampler2D _Noise1;
UNITY_LOCATION(3) uniform mediump sampler2D _T_VFX_Shared_Spectrum;
UNITY_LOCATION(4) uniform mediump sampler2D _CardMask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb13;
float u_xlat14;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat5.x = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5.x * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5.x * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5.x * u_xlat9 + -0.330299497;
    u_xlat5.x = u_xlat5.x * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb13 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5.x + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb5 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5.x + u_xlat1.x;
    u_xlat5.x = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5.x<(-u_xlat5.x));
#else
    u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
#endif
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
#else
    u_xlatb9 = u_xlat9>=(-u_xlat9);
#endif
    u_xlatb5 = u_xlatb9 && u_xlatb5;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.159154937;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.xy = _Time.yy * vec2(0.075000003, 0.0500000007) + u_xlat1.xx;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_4.xyz = texture(_CardMask, u_xlat0.zw).xyz;
    u_xlat4.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.z = u_xlat0.x + (-_Time.y);
    u_xlat1.xz = u_xlat1.xz * vec2(1.0, 0.25);
    u_xlat16_2.xyz = texture(_TextureSample1, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-0.50999999, -0.50999999, -0.50999999);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.04081631, 2.04081631, 2.04081631);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat1.xz = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_1.xz = texture(_Sampler602, u_xlat1.xz).xy;
    u_xlat1.w = _Time.y * -3.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.yw * vec2(2.0, 0.100000001) + u_xlat16_1.xz;
    u_xlat16_1.xyz = texture(_Noise1, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + vec3(-0.300000012, -0.300000012, -0.300000012);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.42857146, 1.42857146, 1.42857146);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz * u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.x = u_xlat1.x * u_xlat3.x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat14 * 1.13;
    u_xlat3.x = u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat14;
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat2.x = u_xlat1.x * u_xlat3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat2.y = 0.0;
    u_xlat16_2.xyz = texture(_T_VFX_Shared_Spectrum, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyw = u_xlat1.yzx * vs_COLOR0.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Brightness);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyz = u_xlat1.wxy * u_xlat0.xyz;
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