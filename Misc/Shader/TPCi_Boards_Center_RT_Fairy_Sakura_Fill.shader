//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_Fairy_Sakura_Fill" {
Properties {
_Step ("Step", Range(0, 1)) = 1
_SakuraFillTexture ("Sakura Fill Texture", 2D) = "white" { }
_emission ("emission", Float) = 0
_smoothstep_max ("smoothstep_max", Float) = 0.01
_smoothstep_min ("smoothstep_min", Float) = 0.1
_power ("power", Float) = 1
[Toggle(_USEASAPARTICLE_ON)] _UseAsAParticle ("Use As A Particle?", Float) = 0
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
  GpuProgramID 53470
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
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
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _SakuraFillTexture_ST;
uniform 	float _power;
uniform 	float _emission;
uniform 	float _Step;
uniform 	float _smoothstep_min;
uniform 	float _smoothstep_max;
UNITY_LOCATION(0) uniform mediump sampler2D _SakuraFillTexture;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_23;
float u_xlat24;
float u_xlat36;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
float u_xlat39;
mediump float u_xlat16_40;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SakuraFillTexture_ST.xy + _SakuraFillTexture_ST.zw;
    u_xlat16_2 = texture(_SakuraFillTexture, u_xlat2.xy);
    u_xlat2.xyz = log2(u_xlat16_2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_power);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat3.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat37 = (-_Step) + 1.0;
    u_xlat39 = u_xlat37 + (-_smoothstep_min);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat37 + _smoothstep_max;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat39) + u_xlat37;
    u_xlat38 = u_xlat16_2.w + (-u_xlat39);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat16_4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb38 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb38){
        u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat38 = inversesqrt(u_xlat38);
        u_xlat5.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat38 = min(u_xlat6.y, u_xlat6.x);
        u_xlat38 = min(u_xlat6.z, u_xlat38);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat38) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
    u_xlat16_40 = u_xlat16_5.w + -1.0;
    u_xlat16_40 = unity_SpecCube0_HDR.w * u_xlat16_40 + 1.0;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.y;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb38){
#ifdef UNITY_ADRENO_ES3
        u_xlatb38 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb38){
            u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat38 = inversesqrt(u_xlat38);
            u_xlat6.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat38 = min(u_xlat7.y, u_xlat7.x);
            u_xlat38 = min(u_xlat7.z, u_xlat38);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat38) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat6.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_6.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_4.xxx;
        u_xlat5.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + (-u_xlat16_4.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat38 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat0.x + u_xlat0.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_11 + 1.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_40;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_40 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_40);
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_40 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat3.xyz * vec3(vec3(_emission, _emission, _emission)) + u_xlat0.xyz;
    SV_Target0.w = u_xlat37;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
Local Keywords { "_USEASAPARTICLE_ON" }
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
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _SakuraFillTexture_ST;
uniform 	float _power;
uniform 	float _emission;
uniform 	float _Step;
uniform 	float _smoothstep_min;
uniform 	float _smoothstep_max;
UNITY_LOCATION(0) uniform mediump sampler2D _SakuraFillTexture;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_23;
float u_xlat24;
float u_xlat36;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
float u_xlat39;
mediump float u_xlat16_40;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SakuraFillTexture_ST.xy + _SakuraFillTexture_ST.zw;
    u_xlat16_2 = texture(_SakuraFillTexture, u_xlat2.xy);
    u_xlat2.xyz = log2(u_xlat16_2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_power);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat3.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat37 = (-_Step) * vs_COLOR0.w + 1.0;
    u_xlat39 = u_xlat37 + (-_smoothstep_min);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat37 + _smoothstep_max;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat39) + u_xlat37;
    u_xlat38 = u_xlat16_2.w + (-u_xlat39);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat16_4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb38 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb38){
        u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat38 = inversesqrt(u_xlat38);
        u_xlat5.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat38 = min(u_xlat6.y, u_xlat6.x);
        u_xlat38 = min(u_xlat6.z, u_xlat38);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat38) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
    u_xlat16_40 = u_xlat16_5.w + -1.0;
    u_xlat16_40 = unity_SpecCube0_HDR.w * u_xlat16_40 + 1.0;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.y;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb38){
#ifdef UNITY_ADRENO_ES3
        u_xlatb38 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb38){
            u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat38 = inversesqrt(u_xlat38);
            u_xlat6.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat38 = min(u_xlat7.y, u_xlat7.x);
            u_xlat38 = min(u_xlat7.z, u_xlat38);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat38) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat6.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_6.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_4.xxx;
        u_xlat5.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + (-u_xlat16_4.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat38 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat0.x + u_xlat0.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_11 + 1.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_40;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_40 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_40);
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_40 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat3.xyz * vec3(vec3(_emission, _emission, _emission)) + u_xlat0.xyz;
    SV_Target0.w = u_xlat37;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _SakuraFillTexture_ST;
uniform 	float _power;
uniform 	float _emission;
uniform 	float _Step;
uniform 	float _smoothstep_min;
uniform 	float _smoothstep_max;
UNITY_LOCATION(0) uniform mediump sampler2D _SakuraFillTexture;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_23;
float u_xlat24;
float u_xlat36;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
float u_xlat39;
mediump float u_xlat16_40;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SakuraFillTexture_ST.xy + _SakuraFillTexture_ST.zw;
    u_xlat16_2 = texture(_SakuraFillTexture, u_xlat2.xy);
    u_xlat2.xyz = log2(u_xlat16_2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_power);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat3.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat37 = (-_Step) + 1.0;
    u_xlat39 = u_xlat37 + (-_smoothstep_min);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat37 + _smoothstep_max;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat39) + u_xlat37;
    u_xlat38 = u_xlat16_2.w + (-u_xlat39);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat16_4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb38 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb38){
        u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat38 = inversesqrt(u_xlat38);
        u_xlat5.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat38 = min(u_xlat6.y, u_xlat6.x);
        u_xlat38 = min(u_xlat6.z, u_xlat38);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat38) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
    u_xlat16_40 = u_xlat16_5.w + -1.0;
    u_xlat16_40 = unity_SpecCube0_HDR.w * u_xlat16_40 + 1.0;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.y;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb38){
#ifdef UNITY_ADRENO_ES3
        u_xlatb38 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb38){
            u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat38 = inversesqrt(u_xlat38);
            u_xlat6.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat38 = min(u_xlat7.y, u_xlat7.x);
            u_xlat38 = min(u_xlat7.z, u_xlat38);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat38) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat6.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_6.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_4.xxx;
        u_xlat5.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + (-u_xlat16_4.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat38 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat0.x + u_xlat0.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_11 + 1.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_40;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_40 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_40);
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_40 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat3.xyz * vec3(vec3(_emission, _emission, _emission)) + u_xlat0.xyz;
    SV_Target0.w = u_xlat37;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USEASAPARTICLE_ON" }
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
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _SakuraFillTexture_ST;
uniform 	float _power;
uniform 	float _emission;
uniform 	float _Step;
uniform 	float _smoothstep_min;
uniform 	float _smoothstep_max;
UNITY_LOCATION(0) uniform mediump sampler2D _SakuraFillTexture;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_23;
float u_xlat24;
float u_xlat36;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
float u_xlat39;
mediump float u_xlat16_40;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SakuraFillTexture_ST.xy + _SakuraFillTexture_ST.zw;
    u_xlat16_2 = texture(_SakuraFillTexture, u_xlat2.xy);
    u_xlat2.xyz = log2(u_xlat16_2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_power);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat3.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat37 = (-_Step) * vs_COLOR0.w + 1.0;
    u_xlat39 = u_xlat37 + (-_smoothstep_min);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat37 + _smoothstep_max;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat39) + u_xlat37;
    u_xlat38 = u_xlat16_2.w + (-u_xlat39);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat16_4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb38 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb38){
        u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat38 = inversesqrt(u_xlat38);
        u_xlat5.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat38 = min(u_xlat6.y, u_xlat6.x);
        u_xlat38 = min(u_xlat6.z, u_xlat38);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat38) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
    u_xlat16_40 = u_xlat16_5.w + -1.0;
    u_xlat16_40 = unity_SpecCube0_HDR.w * u_xlat16_40 + 1.0;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.y;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb38){
#ifdef UNITY_ADRENO_ES3
        u_xlatb38 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb38){
            u_xlat38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat38 = inversesqrt(u_xlat38);
            u_xlat6.xyz = vec3(u_xlat38) * u_xlat16_4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat38 = min(u_xlat7.y, u_xlat7.x);
            u_xlat38 = min(u_xlat7.z, u_xlat38);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat38) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat6.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_6.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_4.xxx;
        u_xlat5.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + (-u_xlat16_4.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat38 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat0.x + u_xlat0.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_11 + 1.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_40;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_40 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_45;
    u_xlat16_40 = u_xlat16_40 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_40);
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_40 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat3.xyz * vec3(vec3(_emission, _emission, _emission)) + u_xlat0.xyz;
    SV_Target0.w = u_xlat37;
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
Local Keywords { "_USEASAPARTICLE_ON" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USEASAPARTICLE_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}