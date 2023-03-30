//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Fighting/S_Jumbotron_Fighting_Mesh" {
Properties {
_AlbedoDiffuse ("Albedo / Diffuse", 2D) = "white" { }
_Normal ("Normal", 2D) = "bump" { }
_Smoothness ("Smoothness", Range(-2, 2)) = 0.07310528
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 16813
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
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
bvec3 u_xlatb11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
float u_xlat15;
float u_xlat16;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_28;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat5.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_4.x = dot((-u_xlat2.xyz), u_xlat5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat5.xyz * (-u_xlat16_4.xxx) + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
        u_xlat7.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat7;
            hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
            hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
            hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
            u_xlat7 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat7.y, u_xlat7.x);
        u_xlat47 = min(u_xlat7.z, u_xlat47);
        u_xlat7.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat47) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_49 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_49 = u_xlat46 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_49);
    u_xlat16_10 = u_xlat16_6.w + -1.0;
    u_xlat16_10 = unity_SpecCube0_HDR.w * u_xlat16_10 + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.y;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.x;
    u_xlat16_25.xyz = u_xlat16_6.xyz * vec3(u_xlat16_10);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat7.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
            u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat8;
                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat8.x : u_xlat9.x;
                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat8.y : u_xlat9.y;
                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat8.z : u_xlat9.z;
                u_xlat8 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat8.y, u_xlat8.x);
            u_xlat47 = min(u_xlat8.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_49);
        u_xlat16_12.x = u_xlat16_4.w + -1.0;
        u_xlat16_12.x = unity_SpecCube1_HDR.w * u_xlat16_12.x + 1.0;
        u_xlat16_12.x = log2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.y;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.x;
        u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xxx;
        u_xlat0.xyz = vec3(u_xlat16_10) * u_xlat16_6.xyz + (-u_xlat16_12.xyz);
        u_xlat25.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_12.xyz;
        u_xlat16_25.xyz = u_xlat25.xyz;
    }
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat5.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat0.x + u_xlat0.x;
    u_xlat16_10 = u_xlat0.x * u_xlat16_10;
    u_xlat16_10 = u_xlat16_10 * u_xlat46 + -0.5;
    u_xlat16_57 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_10 * u_xlat16_57 + 1.0;
    u_xlat16_13 = -abs(u_xlat45) + 1.0;
    u_xlat16_28.x = u_xlat16_13 * u_xlat16_13;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_28.x;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_13 + 1.0;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_57;
    u_xlat15 = u_xlat1.x * u_xlat16_10;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_10 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat45) * _LightColor0.xyz;
    u_xlat16_57 = (-u_xlat0.x) + 1.0;
    u_xlat16_14 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_14;
    u_xlat16_57 = u_xlat16_57 * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat0.xyw = u_xlat16_12.xyz * u_xlat16_28.xyz + u_xlat0.xyw;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat30);
    u_xlat16_10 = u_xlat16_10 + -0.0399999991;
    u_xlat16_10 = u_xlat16_13 * u_xlat16_10 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(u_xlat16_10) + u_xlat0.xyw;
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
float u_xlat15;
float u_xlat16;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_56;
mediump float u_xlat16_58;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_6.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat4.xyz * (-u_xlat16_6.xxx) + (-u_xlat2.xyz);
    u_xlat4.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat5.xyz = vec3(u_xlat47) * u_xlat16_6.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat5.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat5.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat8.y, u_xlat8.x);
        u_xlat47 = min(u_xlat8.z, u_xlat47);
        u_xlat8.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat47) + u_xlat8.xyz;
    } else {
        u_xlat5.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_51 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_51 = u_xlat46 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * 6.0;
    u_xlat16_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat16_51);
    u_xlat16_52 = u_xlat16_5.w + -1.0;
    u_xlat16_52 = unity_SpecCube0_HDR.w * u_xlat16_52 + 1.0;
    u_xlat16_52 = log2(u_xlat16_52);
    u_xlat16_52 = u_xlat16_52 * unity_SpecCube0_HDR.y;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_52 = u_xlat16_52 * unity_SpecCube0_HDR.x;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(u_xlat16_52);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat8.xyz = vec3(u_xlat47) * u_xlat16_6.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat9.y, u_xlat9.x);
            u_xlat47 = min(u_xlat9.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_51);
        u_xlat16_56 = u_xlat16_6.w + -1.0;
        u_xlat16_56 = unity_SpecCube1_HDR.w * u_xlat16_56 + 1.0;
        u_xlat16_56 = log2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.y;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56);
        u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat16_5.xyz + (-u_xlat16_13.xyz);
        u_xlat11.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_13.xyz;
        u_xlat16_11.xyz = u_xlat11.xyz;
    }
    u_xlat16_13.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat0.x + u_xlat0.x;
    u_xlat16_52 = u_xlat0.x * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat46 + -0.5;
    u_xlat16_56 = (-u_xlat1.x) + 1.0;
    u_xlat16_58 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_52 * u_xlat16_56 + 1.0;
    u_xlat16_58 = -abs(u_xlat45) + 1.0;
    u_xlat16_14 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_14;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_58 + 1.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat15 = u_xlat1.x * u_xlat16_52;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_52 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = _LightColor0.xyz * vec3(u_xlat15) + u_xlat16_7.xyz;
    u_xlat1.xyz = vec3(u_xlat45) * _LightColor0.xyz;
    u_xlat16_56 = (-u_xlat0.x) + 1.0;
    u_xlat16_14 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_14;
    u_xlat16_56 = u_xlat16_56 * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * vec3(u_xlat16_56);
    u_xlat0.xyw = u_xlat16_13.xyz * u_xlat16_7.xyz + u_xlat0.xyw;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat30);
    u_xlat16_52 = u_xlat16_52 + -0.0399999991;
    u_xlat16_52 = u_xlat16_58 * u_xlat16_52 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_52) + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
UNITY_LOCATION(4) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
float u_xlat16;
mediump float u_xlat16_21;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_56;
mediump float u_xlat16_58;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = (-u_xlat46) + u_xlat47;
    u_xlat46 = unity_ShadowFadeCenterAndType.w * u_xlat47 + u_xlat46;
    u_xlat46 = u_xlat46 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat5.xyz = vs_TEXCOORD2.www * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD1.www + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD3.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat47 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_49 = (-_LightShadowData.x) + 1.0;
    u_xlat16_49 = u_xlat47 * u_xlat16_49 + _LightShadowData.x;
    u_xlat16_6.x = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat46 * u_xlat16_6.x + u_xlat16_49;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat5.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_4.x = dot((-u_xlat2.xyz), u_xlat5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat5.xyz * (-u_xlat16_4.xxx) + (-u_xlat2.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_49) * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat7.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat8.y, u_xlat8.x);
        u_xlat47 = min(u_xlat8.z, u_xlat47);
        u_xlat8.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat47) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_49 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_49 = u_xlat46 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * 6.0;
    u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat16_49);
    u_xlat16_51 = u_xlat16_7.w + -1.0;
    u_xlat16_51 = unity_SpecCube0_HDR.w * u_xlat16_51 + 1.0;
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.y;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.x;
    u_xlat16_11.xyz = u_xlat16_7.xyz * vec3(u_xlat16_51);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat8.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat9.y, u_xlat9.x);
            u_xlat47 = min(u_xlat9.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_49);
        u_xlat16_56 = u_xlat16_4.w + -1.0;
        u_xlat16_56 = unity_SpecCube1_HDR.w * u_xlat16_56 + 1.0;
        u_xlat16_56 = log2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.y;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(u_xlat16_56);
        u_xlat0.xyz = vec3(u_xlat16_51) * u_xlat16_7.xyz + (-u_xlat16_13.xyz);
        u_xlat11.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_13.xyz;
        u_xlat16_11.xyz = u_xlat11.xyz;
    }
    u_xlat16_13.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat5.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat0.x + u_xlat0.x;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat46 + -0.5;
    u_xlat16_56 = (-u_xlat1.x) + 1.0;
    u_xlat16_58 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_51 * u_xlat16_56 + 1.0;
    u_xlat16_58 = -abs(u_xlat45) + 1.0;
    u_xlat16_14.x = u_xlat16_58 * u_xlat16_58;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_14.x;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_58 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_56;
    u_xlat15 = u_xlat1.x * u_xlat16_51;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_51 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat15) * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(u_xlat45);
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat0.xyw = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat0.xyw;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat30);
    u_xlat16_51 = u_xlat16_51 + -0.0399999991;
    u_xlat16_51 = u_xlat16_58 * u_xlat16_51 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_51) + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
UNITY_LOCATION(4) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bvec3 u_xlatb11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bvec3 u_xlatb13;
mediump vec3 u_xlat16_14;
float u_xlat15;
float u_xlat16;
mediump float u_xlat16_21;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = (-u_xlat46) + u_xlat47;
    u_xlat46 = unity_ShadowFadeCenterAndType.w * u_xlat47 + u_xlat46;
    u_xlat46 = u_xlat46 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat5.xyz = vs_TEXCOORD2.www * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD1.www + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD3.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat47 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_49 = (-_LightShadowData.x) + 1.0;
    u_xlat16_49 = u_xlat47 * u_xlat16_49 + _LightShadowData.x;
    u_xlat16_6.x = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat46 * u_xlat16_6.x + u_xlat16_49;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat5.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_4.x = dot((-u_xlat2.xyz), u_xlat5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat5.xyz * (-u_xlat16_4.xxx) + (-u_xlat2.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_49) * _LightColor0.xyz;
    u_xlat5.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat5);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat5);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat5);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
        u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat9;
            hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
            hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
            hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
            u_xlat9 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat9.y, u_xlat9.x);
        u_xlat47 = min(u_xlat9.z, u_xlat47);
        u_xlat9.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_49 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_49 = u_xlat46 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * 6.0;
    u_xlat16_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat16_49);
    u_xlat16_51 = u_xlat16_8.w + -1.0;
    u_xlat16_51 = unity_SpecCube0_HDR.w * u_xlat16_51 + 1.0;
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.y;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.x;
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(u_xlat16_51);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat9.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb13.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb13.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb13.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb13.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat10.y, u_xlat10.x);
            u_xlat47 = min(u_xlat10.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_49);
        u_xlat16_52 = u_xlat16_4.w + -1.0;
        u_xlat16_52 = unity_SpecCube1_HDR.w * u_xlat16_52 + 1.0;
        u_xlat16_52 = log2(u_xlat16_52);
        u_xlat16_52 = u_xlat16_52 * unity_SpecCube1_HDR.y;
        u_xlat16_52 = exp2(u_xlat16_52);
        u_xlat16_52 = u_xlat16_52 * unity_SpecCube1_HDR.x;
        u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(u_xlat16_52);
        u_xlat0.xyz = vec3(u_xlat16_51) * u_xlat16_8.xyz + (-u_xlat16_14.xyz);
        u_xlat12.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_14.xyz;
        u_xlat16_12.xyz = u_xlat12.xyz;
    }
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat5.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat0.x + u_xlat0.x;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat46 + -0.5;
    u_xlat16_52 = (-u_xlat1.x) + 1.0;
    u_xlat16_57 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_57;
    u_xlat16_52 = u_xlat16_51 * u_xlat16_52 + 1.0;
    u_xlat16_57 = -abs(u_xlat45) + 1.0;
    u_xlat16_59 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_59;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_57 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat15 = u_xlat1.x * u_xlat16_51;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_51 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat15) + u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(u_xlat45);
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat0.xyw = u_xlat16_14.xyz * u_xlat16_7.xyz + u_xlat0.xyw;
    u_xlat16_6.xyz = u_xlat16_12.xyz * vec3(u_xlat30);
    u_xlat16_51 = u_xlat16_51 + -0.0399999991;
    u_xlat16_51 = u_xlat16_57 * u_xlat16_51 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_51) + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
bvec3 u_xlatb11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
float u_xlat15;
float u_xlat16;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_28;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat5.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_4.x = dot((-u_xlat2.xyz), u_xlat5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat5.xyz * (-u_xlat16_4.xxx) + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat6.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
        u_xlat7.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat7;
            hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
            hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
            hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
            u_xlat7 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat7.y, u_xlat7.x);
        u_xlat47 = min(u_xlat7.z, u_xlat47);
        u_xlat7.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat47) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_49 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_49 = u_xlat46 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_49);
    u_xlat16_10 = u_xlat16_6.w + -1.0;
    u_xlat16_10 = unity_SpecCube0_HDR.w * u_xlat16_10 + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.y;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.x;
    u_xlat16_25.xyz = u_xlat16_6.xyz * vec3(u_xlat16_10);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat7.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
            u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat8;
                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat8.x : u_xlat9.x;
                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat8.y : u_xlat9.y;
                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat8.z : u_xlat9.z;
                u_xlat8 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat8.y, u_xlat8.x);
            u_xlat47 = min(u_xlat8.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_49);
        u_xlat16_12.x = u_xlat16_4.w + -1.0;
        u_xlat16_12.x = unity_SpecCube1_HDR.w * u_xlat16_12.x + 1.0;
        u_xlat16_12.x = log2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.y;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.x;
        u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xxx;
        u_xlat0.xyz = vec3(u_xlat16_10) * u_xlat16_6.xyz + (-u_xlat16_12.xyz);
        u_xlat25.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_12.xyz;
        u_xlat16_25.xyz = u_xlat25.xyz;
    }
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat5.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat0.x + u_xlat0.x;
    u_xlat16_10 = u_xlat0.x * u_xlat16_10;
    u_xlat16_10 = u_xlat16_10 * u_xlat46 + -0.5;
    u_xlat16_57 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_10 * u_xlat16_57 + 1.0;
    u_xlat16_13 = -abs(u_xlat45) + 1.0;
    u_xlat16_28.x = u_xlat16_13 * u_xlat16_13;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_28.x;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_13 + 1.0;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_57;
    u_xlat15 = u_xlat1.x * u_xlat16_10;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_10 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat45) * _LightColor0.xyz;
    u_xlat16_57 = (-u_xlat0.x) + 1.0;
    u_xlat16_14 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_14;
    u_xlat16_57 = u_xlat16_57 * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat0.xyw = u_xlat16_12.xyz * u_xlat16_28.xyz + u_xlat0.xyw;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat30);
    u_xlat16_10 = u_xlat16_10 + -0.0399999991;
    u_xlat16_10 = u_xlat16_13 * u_xlat16_10 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(u_xlat16_10) + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.wwzw + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
float u_xlat15;
float u_xlat16;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_56;
mediump float u_xlat16_58;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_6.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat4.xyz * (-u_xlat16_6.xxx) + (-u_xlat2.xyz);
    u_xlat4.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat5.xyz = vec3(u_xlat47) * u_xlat16_6.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat5.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat5.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat8.y, u_xlat8.x);
        u_xlat47 = min(u_xlat8.z, u_xlat47);
        u_xlat8.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat47) + u_xlat8.xyz;
    } else {
        u_xlat5.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_51 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_51 = u_xlat46 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * 6.0;
    u_xlat16_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat16_51);
    u_xlat16_52 = u_xlat16_5.w + -1.0;
    u_xlat16_52 = unity_SpecCube0_HDR.w * u_xlat16_52 + 1.0;
    u_xlat16_52 = log2(u_xlat16_52);
    u_xlat16_52 = u_xlat16_52 * unity_SpecCube0_HDR.y;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_52 = u_xlat16_52 * unity_SpecCube0_HDR.x;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(u_xlat16_52);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat8.xyz = vec3(u_xlat47) * u_xlat16_6.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat9.y, u_xlat9.x);
            u_xlat47 = min(u_xlat9.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_51);
        u_xlat16_56 = u_xlat16_6.w + -1.0;
        u_xlat16_56 = unity_SpecCube1_HDR.w * u_xlat16_56 + 1.0;
        u_xlat16_56 = log2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.y;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56);
        u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat16_5.xyz + (-u_xlat16_13.xyz);
        u_xlat11.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_13.xyz;
        u_xlat16_11.xyz = u_xlat11.xyz;
    }
    u_xlat16_13.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat0.x + u_xlat0.x;
    u_xlat16_52 = u_xlat0.x * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat46 + -0.5;
    u_xlat16_56 = (-u_xlat1.x) + 1.0;
    u_xlat16_58 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_52 * u_xlat16_56 + 1.0;
    u_xlat16_58 = -abs(u_xlat45) + 1.0;
    u_xlat16_14 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_14;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_58 + 1.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat15 = u_xlat1.x * u_xlat16_52;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_52 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = _LightColor0.xyz * vec3(u_xlat15) + u_xlat16_7.xyz;
    u_xlat1.xyz = vec3(u_xlat45) * _LightColor0.xyz;
    u_xlat16_56 = (-u_xlat0.x) + 1.0;
    u_xlat16_14 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_14;
    u_xlat16_56 = u_xlat16_56 * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * vec3(u_xlat16_56);
    u_xlat0.xyw = u_xlat16_13.xyz * u_xlat16_7.xyz + u_xlat0.xyw;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat30);
    u_xlat16_52 = u_xlat16_52 + -0.0399999991;
    u_xlat16_52 = u_xlat16_58 * u_xlat16_52 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_52) + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
UNITY_LOCATION(4) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
float u_xlat16;
mediump float u_xlat16_21;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_56;
mediump float u_xlat16_58;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = (-u_xlat46) + u_xlat47;
    u_xlat46 = unity_ShadowFadeCenterAndType.w * u_xlat47 + u_xlat46;
    u_xlat46 = u_xlat46 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat5.xyz = vs_TEXCOORD2.www * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD1.www + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD3.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat47 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_49 = (-_LightShadowData.x) + 1.0;
    u_xlat16_49 = u_xlat47 * u_xlat16_49 + _LightShadowData.x;
    u_xlat16_6.x = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat46 * u_xlat16_6.x + u_xlat16_49;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat5.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_4.x = dot((-u_xlat2.xyz), u_xlat5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat5.xyz * (-u_xlat16_4.xxx) + (-u_xlat2.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_49) * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat7.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat8.y, u_xlat8.x);
        u_xlat47 = min(u_xlat8.z, u_xlat47);
        u_xlat8.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat47) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_49 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_49 = u_xlat46 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * 6.0;
    u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat16_49);
    u_xlat16_51 = u_xlat16_7.w + -1.0;
    u_xlat16_51 = unity_SpecCube0_HDR.w * u_xlat16_51 + 1.0;
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.y;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.x;
    u_xlat16_11.xyz = u_xlat16_7.xyz * vec3(u_xlat16_51);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat8.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat9.y, u_xlat9.x);
            u_xlat47 = min(u_xlat9.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_49);
        u_xlat16_56 = u_xlat16_4.w + -1.0;
        u_xlat16_56 = unity_SpecCube1_HDR.w * u_xlat16_56 + 1.0;
        u_xlat16_56 = log2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.y;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(u_xlat16_56);
        u_xlat0.xyz = vec3(u_xlat16_51) * u_xlat16_7.xyz + (-u_xlat16_13.xyz);
        u_xlat11.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_13.xyz;
        u_xlat16_11.xyz = u_xlat11.xyz;
    }
    u_xlat16_13.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat5.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat0.x + u_xlat0.x;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat46 + -0.5;
    u_xlat16_56 = (-u_xlat1.x) + 1.0;
    u_xlat16_58 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat16_56 = u_xlat16_51 * u_xlat16_56 + 1.0;
    u_xlat16_58 = -abs(u_xlat45) + 1.0;
    u_xlat16_14.x = u_xlat16_58 * u_xlat16_58;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_14.x;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_58 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_56;
    u_xlat15 = u_xlat1.x * u_xlat16_51;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_51 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat15) * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(u_xlat45);
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat0.xyw = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat0.xyw;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat30);
    u_xlat16_51 = u_xlat16_51 + -0.0399999991;
    u_xlat16_51 = u_xlat16_58 * u_xlat16_51 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_51) + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.wwzw + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
UNITY_LOCATION(4) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bvec3 u_xlatb11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bvec3 u_xlatb13;
mediump vec3 u_xlat16_14;
float u_xlat15;
float u_xlat16;
mediump float u_xlat16_21;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
float u_xlat47;
bool u_xlatb47;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = (-u_xlat46) + u_xlat47;
    u_xlat46 = unity_ShadowFadeCenterAndType.w * u_xlat47 + u_xlat46;
    u_xlat46 = u_xlat46 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat5.xyz = vs_TEXCOORD2.www * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD1.www + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD3.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat47 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_49 = (-_LightShadowData.x) + 1.0;
    u_xlat16_49 = u_xlat47 * u_xlat16_49 + _LightShadowData.x;
    u_xlat16_6.x = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat46 * u_xlat16_6.x + u_xlat16_49;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat5.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat5.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat5.xyz = vec3(u_xlat46) * u_xlat5.xyz;
    u_xlat46 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_4.x = dot((-u_xlat2.xyz), u_xlat5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat5.xyz * (-u_xlat16_4.xxx) + (-u_xlat2.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_49) * _LightColor0.xyz;
    u_xlat5.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat5);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat5);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat5);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb47 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat47 = inversesqrt(u_xlat47);
        u_xlat8.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
        u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat9;
            hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
            hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
            hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
            u_xlat9 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat9.y, u_xlat9.x);
        u_xlat47 = min(u_xlat9.z, u_xlat47);
        u_xlat9.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat47) + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_49 = (-u_xlat46) * 0.699999988 + 1.70000005;
    u_xlat16_49 = u_xlat46 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * 6.0;
    u_xlat16_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat16_49);
    u_xlat16_51 = u_xlat16_8.w + -1.0;
    u_xlat16_51 = unity_SpecCube0_HDR.w * u_xlat16_51 + 1.0;
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.y;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * unity_SpecCube0_HDR.x;
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(u_xlat16_51);
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb47){
#ifdef UNITY_ADRENO_ES3
        u_xlatb47 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat9.xyz = vec3(u_xlat47) * u_xlat16_4.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb13.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb13.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb13.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb13.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat10.y, u_xlat10.x);
            u_xlat47 = min(u_xlat10.z, u_xlat47);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat47) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_49);
        u_xlat16_52 = u_xlat16_4.w + -1.0;
        u_xlat16_52 = unity_SpecCube1_HDR.w * u_xlat16_52 + 1.0;
        u_xlat16_52 = log2(u_xlat16_52);
        u_xlat16_52 = u_xlat16_52 * unity_SpecCube1_HDR.y;
        u_xlat16_52 = exp2(u_xlat16_52);
        u_xlat16_52 = u_xlat16_52 * unity_SpecCube1_HDR.x;
        u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(u_xlat16_52);
        u_xlat0.xyz = vec3(u_xlat16_51) * u_xlat16_8.xyz + (-u_xlat16_14.xyz);
        u_xlat12.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_14.xyz;
        u_xlat16_12.xyz = u_xlat12.xyz;
    }
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat5.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat0.x + u_xlat0.x;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat46 + -0.5;
    u_xlat16_52 = (-u_xlat1.x) + 1.0;
    u_xlat16_57 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_57;
    u_xlat16_52 = u_xlat16_51 * u_xlat16_52 + 1.0;
    u_xlat16_57 = -abs(u_xlat45) + 1.0;
    u_xlat16_59 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_59;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_57 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat15 = u_xlat1.x * u_xlat16_51;
    u_xlat30 = u_xlat46 * u_xlat46;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_51 = _Smoothness * u_xlat16_3.w + 0.0400000215;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat15) + u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(u_xlat45);
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21;
    u_xlat16_6.x = u_xlat16_6.x * 0.959999979 + 0.0399999991;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat0.xyw = u_xlat16_14.xyz * u_xlat16_7.xyz + u_xlat0.xyw;
    u_xlat16_6.xyz = u_xlat16_12.xyz * vec3(u_xlat30);
    u_xlat16_51 = u_xlat16_51 + -0.0399999991;
    u_xlat16_51 = u_xlat16_57 * u_xlat16_51 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_51) + u_xlat0.xyw;
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
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Blend One One, One One
  ZWrite Off
  GpuProgramID 121081
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat8;
vec3 u_xlat10;
mediump float u_xlat16_15;
float u_xlat16;
float u_xlat18;
float u_xlat24;
float u_xlat26;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat10.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat10.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_1 = texture(_AlbedoDiffuse, u_xlat10.xy);
    u_xlat16 = (-_Smoothness) * u_xlat16_1.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat10.x = u_xlat16 * u_xlat16;
    u_xlat10.x = max(u_xlat10.x, 0.00200000009);
    u_xlat18 = u_xlat10.x * u_xlat10.x;
    u_xlat26 = u_xlat24 * u_xlat18 + (-u_xlat24);
    u_xlat24 = u_xlat26 * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24 + 1.00000001e-07;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat24 = u_xlat18 / u_xlat24;
    u_xlat18 = (-u_xlat10.x) + 1.0;
    u_xlat26 = abs(u_xlat2.x) * u_xlat18 + u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat18 + u_xlat10.x;
    u_xlat10.x = u_xlat10.x * abs(u_xlat2.x);
    u_xlat16_29 = -abs(u_xlat2.x) + 1.0;
    u_xlat2.x = u_xlat0.x * u_xlat26 + u_xlat10.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 0.5 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat2.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = texture(_LightTexture0, u_xlat2.xx).x;
    u_xlat16_6.xyz = u_xlat2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz;
    u_xlat16_30 = (-u_xlat8) + 1.0;
    u_xlat16_7 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * 0.959999979 + 0.0399999991;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_30);
    u_xlat16_30 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_30;
    u_xlat16_30 = u_xlat8 + u_xlat8;
    u_xlat16_30 = u_xlat8 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16 + -0.5;
    u_xlat16_29 = u_xlat16_30 * u_xlat16_29 + 1.0;
    u_xlat16_7 = (-u_xlat0.x) + 1.0;
    u_xlat16_15 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_15;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7 + 1.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * u_xlat16_29;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat8;
mediump float u_xlat16_11;
float u_xlat12;
float u_xlat14;
mediump float u_xlat16_17;
float u_xlat18;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat20 = dot(u_xlat0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_1 = texture(_AlbedoDiffuse, u_xlat2.xy);
    u_xlat12 = (-_Smoothness) * u_xlat16_1.w + 1.0;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat2.x = u_xlat12 * u_xlat12;
    u_xlat2.x = max(u_xlat2.x, 0.00200000009);
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat14 = u_xlat20 * u_xlat8 + (-u_xlat20);
    u_xlat14 = u_xlat14 * u_xlat20 + 1.0;
    u_xlat14 = u_xlat14 * u_xlat14 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat8 = u_xlat8 / u_xlat14;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat20 = abs(u_xlat18) * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat0.x * u_xlat14 + u_xlat2.x;
    u_xlat2.x = abs(u_xlat18) * u_xlat2.x;
    u_xlat16_22 = -abs(u_xlat18) + 1.0;
    u_xlat18 = u_xlat0.x * u_xlat20 + u_xlat2.x;
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat18 = u_xlat8 * u_xlat18;
    u_xlat18 = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = vec3(u_xlat18) * _LightColor0.xyz;
    u_xlat16_5.x = (-u_xlat6) + 1.0;
    u_xlat16_11 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_11;
    u_xlat16_5.x = u_xlat16_5.x * 0.959999979 + 0.0399999991;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_5.x = u_xlat6 + u_xlat6;
    u_xlat16_5.x = u_xlat6 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat12 + -0.5;
    u_xlat16_11 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11;
    u_xlat16_22 = u_xlat16_5.x * u_xlat16_22 + 1.0;
    u_xlat16_11 = (-u_xlat0.x) + 1.0;
    u_xlat16_17 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_17;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_11 + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_5.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_15;
float u_xlat16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
mediump float u_xlat16_26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = vs_TEXCOORD4.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat24 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = u_xlat24 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat24) + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat5.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat9.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat9.xy);
    u_xlat16 = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat9.x = u_xlat16 * u_xlat16;
    u_xlat9.x = max(u_xlat9.x, 0.00200000009);
    u_xlat17 = u_xlat9.x * u_xlat9.x;
    u_xlat25 = u_xlat24 * u_xlat17 + (-u_xlat24);
    u_xlat24 = u_xlat25 * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24 + 1.00000001e-07;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat24 = u_xlat17 / u_xlat24;
    u_xlat17 = (-u_xlat9.x) + 1.0;
    u_xlat25 = abs(u_xlat1.x) * u_xlat17 + u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat17 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * abs(u_xlat1.x);
    u_xlat16_26 = -abs(u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat0.x * u_xlat25 + u_xlat9.x;
    u_xlat1.x = u_xlat1.x + 9.99999975e-06;
    u_xlat1.x = 0.5 / u_xlat1.x;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(u_xlat24);
    u_xlat16_30 = (-u_xlat8) + 1.0;
    u_xlat16_7 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * 0.959999979 + 0.0399999991;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_30);
    u_xlat16_30 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_30;
    u_xlat16_30 = u_xlat8 + u_xlat8;
    u_xlat16_30 = u_xlat8 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16 + -0.5;
    u_xlat16_26 = u_xlat16_30 * u_xlat16_26 + 1.0;
    u_xlat16_7 = (-u_xlat0.x) + 1.0;
    u_xlat16_15 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_15;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7 + 1.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * u_xlat16_26;
    u_xlat16_2.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform highp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat8;
vec3 u_xlat10;
mediump float u_xlat16_15;
float u_xlat16;
float u_xlat18;
float u_xlat24;
float u_xlat26;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat10.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat10.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_1 = texture(_AlbedoDiffuse, u_xlat10.xy);
    u_xlat16 = (-_Smoothness) * u_xlat16_1.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat10.x = u_xlat16 * u_xlat16;
    u_xlat10.x = max(u_xlat10.x, 0.00200000009);
    u_xlat18 = u_xlat10.x * u_xlat10.x;
    u_xlat26 = u_xlat24 * u_xlat18 + (-u_xlat24);
    u_xlat24 = u_xlat26 * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24 + 1.00000001e-07;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat24 = u_xlat18 / u_xlat24;
    u_xlat18 = (-u_xlat10.x) + 1.0;
    u_xlat26 = abs(u_xlat2.x) * u_xlat18 + u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat18 + u_xlat10.x;
    u_xlat10.x = u_xlat10.x * abs(u_xlat2.x);
    u_xlat16_29 = -abs(u_xlat2.x) + 1.0;
    u_xlat2.x = u_xlat0.x * u_xlat26 + u_xlat10.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 0.5 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat2.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = texture(_LightTexture0, u_xlat2.xyz).w;
    u_xlat10.x = texture(_LightTextureB0, vec2(u_xlat26)).x;
    u_xlat2.x = u_xlat2.x * u_xlat10.x;
    u_xlat16_6.xyz = u_xlat2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz;
    u_xlat16_30 = (-u_xlat8) + 1.0;
    u_xlat16_7 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * 0.959999979 + 0.0399999991;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_30);
    u_xlat16_30 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_30;
    u_xlat16_30 = u_xlat8 + u_xlat8;
    u_xlat16_30 = u_xlat8 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16 + -0.5;
    u_xlat16_29 = u_xlat16_30 * u_xlat16_29 + 1.0;
    u_xlat16_7 = (-u_xlat0.x) + 1.0;
    u_xlat16_15 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_15;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7 + 1.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * u_xlat16_29;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
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
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat9;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat16;
float u_xlat21;
float u_xlat23;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21) + _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat23 = dot(u_xlat0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_1 = texture(_AlbedoDiffuse, u_xlat2.xy);
    u_xlat14 = (-_Smoothness) * u_xlat16_1.w + 1.0;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat2.x = u_xlat14 * u_xlat14;
    u_xlat2.x = max(u_xlat2.x, 0.00200000009);
    u_xlat9 = u_xlat2.x * u_xlat2.x;
    u_xlat16 = u_xlat23 * u_xlat9 + (-u_xlat23);
    u_xlat16 = u_xlat16 * u_xlat23 + 1.0;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat9 = u_xlat9 * 0.318309873;
    u_xlat9 = u_xlat9 / u_xlat16;
    u_xlat16 = (-u_xlat2.x) + 1.0;
    u_xlat23 = abs(u_xlat21) * u_xlat16 + u_xlat2.x;
    u_xlat2.x = u_xlat0.x * u_xlat16 + u_xlat2.x;
    u_xlat2.x = abs(u_xlat21) * u_xlat2.x;
    u_xlat16_25 = -abs(u_xlat21) + 1.0;
    u_xlat21 = u_xlat0.x * u_xlat23 + u_xlat2.x;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat21 = u_xlat9 * u_xlat21;
    u_xlat21 = u_xlat0.x * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat2.xy = vs_TEXCOORD4.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat2.x = texture(_LightTexture0, u_xlat2.xy).w;
    u_xlat16_5.xyz = u_xlat2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat16_26 = (-u_xlat7) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat7 + u_xlat7;
    u_xlat16_26 = u_xlat7 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat14 + -0.5;
    u_xlat16_6 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_26 * u_xlat16_25 + 1.0;
    u_xlat16_6 = (-u_xlat0.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat0.x = u_xlat0.x * u_xlat16_25;
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SPOT" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = vs_TEXCOORD4.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat21 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = u_xlat21 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0 = vs_TEXCOORD4.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD4.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    vec3 txVec0 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat7.x = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + _LightShadowData.x;
    u_xlat16_9 = (-u_xlat0.x) + 1.0;
    u_xlat7.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat7.x = (-u_xlat14) + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat14;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat7.x * u_xlat16_9 + u_xlat0.x;
    u_xlat16_2.x = u_xlat16_9 * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_4.xyz = texture(_Normal, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat8 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat0.x);
    u_xlat16_23 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat16_2.xyz * u_xlat0.xxx;
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat16_23 * u_xlat16_23;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_23 = u_xlat16_26 * u_xlat16_23 + 1.0;
    u_xlat16_6 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat7.x = u_xlat1.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SHADOWS_SOFT" "SPOT" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = vs_TEXCOORD4.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat21 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = u_xlat21 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0 = vs_TEXCOORD4.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD4.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xyz = u_xlat0.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xyz = u_xlat0.xyz + _ShadowOffsets[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat7.x = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + _LightShadowData.x;
    u_xlat16_9 = (-u_xlat0.x) + 1.0;
    u_xlat7.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat7.x = (-u_xlat14) + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat14;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat7.x * u_xlat16_9 + u_xlat0.x;
    u_xlat16_2.x = u_xlat16_9 * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_4.xyz = texture(_Normal, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat8 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat0.x);
    u_xlat16_23 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat16_2.xyz * u_xlat0.xxx;
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat16_23 * u_xlat16_23;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_23 = u_xlat16_26 * u_xlat16_23 + 1.0;
    u_xlat16_6 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat7.x = u_xlat1.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat8;
vec3 u_xlat10;
float u_xlat11;
mediump float u_xlat16_14;
mediump float u_xlat16_15;
float u_xlat16;
float u_xlat19;
float u_xlat24;
float u_xlat26;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat24) + _WorldSpaceLightPos0.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat26 = max(u_xlat26, 0.00100000005);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat3.xyz = vec3(u_xlat26) * u_xlat3.xyz;
    u_xlat26 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(_WorldSpaceLightPos0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat3.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_1 = texture(_AlbedoDiffuse, u_xlat3.xy);
    u_xlat16 = (-_Smoothness) * u_xlat16_1.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat3.x = u_xlat16 * u_xlat16;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat11 = u_xlat3.x * u_xlat3.x;
    u_xlat19 = u_xlat26 * u_xlat11 + (-u_xlat26);
    u_xlat26 = u_xlat19 * u_xlat26 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26 + 1.00000001e-07;
    u_xlat11 = u_xlat11 * 0.318309873;
    u_xlat26 = u_xlat11 / u_xlat26;
    u_xlat11 = (-u_xlat3.x) + 1.0;
    u_xlat19 = abs(u_xlat24) * u_xlat11 + u_xlat3.x;
    u_xlat3.x = u_xlat0.x * u_xlat11 + u_xlat3.x;
    u_xlat3.x = abs(u_xlat24) * u_xlat3.x;
    u_xlat16_29 = -abs(u_xlat24) + 1.0;
    u_xlat24 = u_xlat0.x * u_xlat19 + u_xlat3.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat26 * u_xlat24;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat10.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat2.x) + u_xlat10.x;
    u_xlat2.x = unity_ShadowFadeCenterAndType.w * u_xlat10.x + u_xlat2.x;
    u_xlat2.x = u_xlat2.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    vec3 txVec0 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat10.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_6.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_6.x = u_xlat10.x * u_xlat16_6.x + _LightShadowData.x;
    u_xlat16_14 = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.x = u_xlat2.x * u_xlat16_14 + u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz;
    u_xlat16_30 = (-u_xlat8) + 1.0;
    u_xlat16_7 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7;
    u_xlat16_30 = u_xlat16_30 * 0.959999979 + 0.0399999991;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_30);
    u_xlat16_30 = u_xlat8 + u_xlat8;
    u_xlat16_30 = u_xlat8 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16 + -0.5;
    u_xlat16_7 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
    u_xlat16_29 = u_xlat16_30 * u_xlat16_29 + 1.0;
    u_xlat16_7 = (-u_xlat0.x) + 1.0;
    u_xlat16_15 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_15;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7 + 1.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * u_xlat16_29;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
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
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat16;
float u_xlat21;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD4.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy).w;
    u_xlat7.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD4.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD4.zzz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
    u_xlat7.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_1.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_1.x = u_xlat7.x * u_xlat16_1.x + _LightShadowData.x;
    u_xlat16_8 = (-u_xlat16_1.x) + 1.0;
    u_xlat7.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat7.x = (-u_xlat14) + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat14;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat7.x * u_xlat16_8 + u_xlat16_1.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat3.xyz * u_xlat0.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_4 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_4.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat23 = u_xlat14 * u_xlat14;
    u_xlat24 = u_xlat21 * u_xlat23 + (-u_xlat21);
    u_xlat21 = u_xlat24 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat21 = u_xlat23 / u_xlat21;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat9 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat16 = (-u_xlat14) + 1.0;
    u_xlat23 = abs(u_xlat2.x) * u_xlat16 + u_xlat14;
    u_xlat14 = u_xlat9 * u_xlat16 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat2.x);
    u_xlat16_22 = -abs(u_xlat2.x) + 1.0;
    u_xlat14 = u_xlat9 * u_xlat23 + u_xlat14;
    u_xlat14 = u_xlat14 + 9.99999975e-06;
    u_xlat14 = 0.5 / u_xlat14;
    u_xlat14 = u_xlat21 * u_xlat14;
    u_xlat14 = u_xlat9 * u_xlat14;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 0.0);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(u_xlat14);
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat0.x + u_xlat0.x;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_6 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_6;
    u_xlat16_22 = u_xlat16_26 * u_xlat16_22 + 1.0;
    u_xlat16_6 = (-u_xlat9) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_26;
    u_xlat0.x = u_xlat9 * u_xlat16_22;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat2.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp samplerCube _ShadowMapTexture;
UNITY_LOCATION(4) uniform highp samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat16;
float u_xlat21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-_LightPositionRange.xyz);
    u_xlat21 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat21 = max(abs(u_xlat0.z), u_xlat21);
    u_xlat21 = u_xlat21 + (-_LightProjectionParams.z);
    u_xlat21 = max(u_xlat21, 9.99999975e-06);
    u_xlat21 = u_xlat21 * _LightProjectionParams.w;
    u_xlat21 = _LightProjectionParams.y / u_xlat21;
    u_xlat21 = u_xlat21 + (-_LightProjectionParams.x);
    vec4 txVec0 = vec4(u_xlat0.xyz,u_xlat21);
    u_xlat0.x = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat16_1.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x + _LightShadowData.x;
    u_xlat16_8 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat7.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat16_8 + u_xlat16_1.x;
    u_xlat2.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xx).x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat16_1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_4.xyz = texture(_Normal, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat2.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat9 = u_xlat14 * u_xlat14;
    u_xlat16 = u_xlat21 * u_xlat9 + (-u_xlat21);
    u_xlat21 = u_xlat16 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat9 = u_xlat9 * 0.318309873;
    u_xlat21 = u_xlat9 / u_xlat21;
    u_xlat9 = (-u_xlat14) + 1.0;
    u_xlat16 = abs(u_xlat0.x) * u_xlat9 + u_xlat14;
    u_xlat14 = u_xlat2.x * u_xlat9 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat0.x);
    u_xlat16_22 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat16 + u_xlat14;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat16_1.xyz * u_xlat0.xxx;
    u_xlat16_26 = (-u_xlat23) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_26;
    u_xlat16_26 = u_xlat23 + u_xlat23;
    u_xlat16_26 = u_xlat23 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_22 = u_xlat16_26 * u_xlat16_22 + 1.0;
    u_xlat16_6 = (-u_xlat2.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_26;
    u_xlat7.x = u_xlat2.x * u_xlat16_22;
    u_xlat16_1.xyz = u_xlat7.xxx * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp samplerCube _ShadowMapTexture;
UNITY_LOCATION(4) uniform highp samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-_LightPositionRange.xyz);
    u_xlat21 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat21 = max(abs(u_xlat0.z), u_xlat21);
    u_xlat21 = u_xlat21 + (-_LightProjectionParams.z);
    u_xlat21 = max(u_xlat21, 9.99999975e-06);
    u_xlat21 = u_xlat21 * _LightProjectionParams.w;
    u_xlat21 = _LightProjectionParams.y / u_xlat21;
    u_xlat21 = u_xlat21 + (-_LightProjectionParams.x);
    u_xlat1.xyz = u_xlat0.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    vec4 txVec0 = vec4(u_xlat1.xyz,u_xlat21);
    u_xlat1.x = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat2.xyz = u_xlat0.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    vec4 txVec1 = vec4(u_xlat2.xyz,u_xlat21);
    u_xlat1.y = texture(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat2.xyz = u_xlat0.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat0.xyz = u_xlat0.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    vec4 txVec2 = vec4(u_xlat0.xyz,u_xlat21);
    u_xlat1.w = texture(hlslcc_zcmp_ShadowMapTexture, txVec2);
    vec4 txVec3 = vec4(u_xlat2.xyz,u_xlat21);
    u_xlat1.z = texture(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _LightShadowData.x;
    u_xlat16_10 = (-u_xlat16_3.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat7.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat0.x * u_xlat16_10 + u_xlat16_3.x;
    u_xlat1.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xx).x;
    u_xlat0.x = u_xlat16_3.x * u_xlat0.x;
    u_xlat16_3.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_4.xyz = texture(_Normal, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_2 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_2.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat8 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat0.x);
    u_xlat16_24 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat16_3.xyz * u_xlat0.xxx;
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_24 = u_xlat16_26 * u_xlat16_24 + 1.0;
    u_xlat16_6 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat7.x = u_xlat1.x * u_xlat16_24;
    u_xlat16_3.xyz = u_xlat7.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform highp samplerCube _LightTexture0;
UNITY_LOCATION(4) uniform highp samplerCube _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz).w;
    u_xlat7.x = texture(_LightTextureB0, vec2(u_xlat21)).x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = vs_TEXCOORD4.xyz + (-_LightPositionRange.xyz);
    u_xlat1.x = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat1.x = max(abs(u_xlat7.z), u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_LightProjectionParams.z);
    u_xlat1.x = max(u_xlat1.x, 9.99999975e-06);
    u_xlat1.x = u_xlat1.x * _LightProjectionParams.w;
    u_xlat1.x = _LightProjectionParams.y / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_LightProjectionParams.x);
    vec4 txVec0 = vec4(u_xlat7.xyz,u_xlat1.x);
    u_xlat7.x = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_2.x + _LightShadowData.x;
    u_xlat16_9 = (-u_xlat16_2.x) + 1.0;
    u_xlat7.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat7.x = (-u_xlat14) + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat14;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat7.x * u_xlat16_9 + u_xlat16_2.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_4.xyz = texture(_Normal, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_3 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_3.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat8 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat0.x);
    u_xlat16_23 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat16_2.xyz * u_xlat0.xxx;
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat16_23 * u_xlat16_23;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_23 = u_xlat16_26 * u_xlat16_23 + 1.0;
    u_xlat16_6 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat7.x = u_xlat1.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
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
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
UNITY_LOCATION(2) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform highp samplerCube _LightTexture0;
UNITY_LOCATION(4) uniform highp samplerCube _ShadowMapTexture;
UNITY_LOCATION(5) uniform highp samplerCubeShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-_LightPositionRange.xyz);
    u_xlat21 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat21 = max(abs(u_xlat0.z), u_xlat21);
    u_xlat21 = u_xlat21 + (-_LightProjectionParams.z);
    u_xlat21 = max(u_xlat21, 9.99999975e-06);
    u_xlat21 = u_xlat21 * _LightProjectionParams.w;
    u_xlat21 = _LightProjectionParams.y / u_xlat21;
    u_xlat21 = u_xlat21 + (-_LightProjectionParams.x);
    u_xlat1.xyz = u_xlat0.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    vec4 txVec0 = vec4(u_xlat1.xyz,u_xlat21);
    u_xlat1.x = texture(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat2.xyz = u_xlat0.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    vec4 txVec1 = vec4(u_xlat2.xyz,u_xlat21);
    u_xlat1.y = texture(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat2.xyz = u_xlat0.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat0.xyz = u_xlat0.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    vec4 txVec2 = vec4(u_xlat0.xyz,u_xlat21);
    u_xlat1.w = texture(hlslcc_zcmp_ShadowMapTexture, txVec2);
    vec4 txVec3 = vec4(u_xlat2.xyz,u_xlat21);
    u_xlat1.z = texture(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _LightShadowData.x;
    u_xlat16_10 = (-u_xlat16_3.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD4.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat7.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat0.x * u_xlat16_10 + u_xlat16_3.x;
    u_xlat1.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = texture(_LightTexture0, u_xlat1.xyz).w;
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_3.x * u_xlat0.x;
    u_xlat16_3.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_4.xyz = texture(_Normal, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_2 = texture(_AlbedoDiffuse, u_xlat7.xy);
    u_xlat7.x = (-_Smoothness) * u_xlat16_2.w + 1.0;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat8 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat14;
    u_xlat14 = u_xlat14 * abs(u_xlat0.x);
    u_xlat16_24 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat16_3.xyz * u_xlat0.xxx;
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_26);
    u_xlat16_26 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7.x + -0.5;
    u_xlat16_24 = u_xlat16_26 * u_xlat16_24 + 1.0;
    u_xlat16_6 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat7.x = u_xlat1.x * u_xlat16_24;
    u_xlat16_3.xyz = u_xlat7.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + u_xlat0.xzw;
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
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SHADOWS_SOFT" "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
}
}
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 150715
Program "vp" {
SubProgram "gles3 " {
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
out highp vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_0 = texture(_AlbedoDiffuse, u_xlat0.xy);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.x = u_xlat16_0.w * _Smoothness;
    SV_Target1.w = u_xlat0.x;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat0.xyz;
    SV_Target2.w = 1.0;
    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_0 = texture(_AlbedoDiffuse, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.x = u_xlat16_0.w * _Smoothness;
    SV_Target1.w = u_xlat0.x;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target1.xyz = vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_2.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_2.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat3.xyz;
    SV_Target2.w = 1.0;
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
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
out highp vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_0 = texture(_AlbedoDiffuse, u_xlat0.xy);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.x = u_xlat16_0.w * _Smoothness;
    SV_Target1.w = u_xlat0.x;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat0.xyz;
    SV_Target2.w = 1.0;
    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _AlbedoDiffuse_ST;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoDiffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlbedoDiffuse_ST.xy + _AlbedoDiffuse_ST.zw;
    u_xlat16_0 = texture(_AlbedoDiffuse, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.x = u_xlat16_0.w * _Smoothness;
    SV_Target1.w = u_xlat0.x;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target1.xyz = vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_2.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_2.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat3.xyz;
    SV_Target2.w = 1.0;
    u_xlat0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
}
}
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 248280
Program "vp" {
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
Fallback "Diffuse"
CustomEditor "ASEMaterialInspector"
}