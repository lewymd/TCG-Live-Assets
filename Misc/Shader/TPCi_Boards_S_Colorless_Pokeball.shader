//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/S_Colorless_Pokeball" {
Properties {
_TextureSample0 ("Texture Sample 0", 2D) = "white" { }
_Exterior_Color ("Exterior_Color", Color) = (1,1,1,0)
_BrushedMetal_1 ("BrushedMetal_1", Color) = (0.8207547,0.5303934,0.810912,1)
_Texture0 ("Texture 0", 2D) = "white" { }
_Panner1speed ("Panner 1 speed", Vector) = (-0.05,0,0,0)
_Panner2speed ("Panner 2 speed", Vector) = (0.05,0,0,0)
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  Offset 1, 1
  GpuProgramID 6149
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
out highp vec4 vs_TEXCOORD6;
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
uniform 	vec4 _Time;
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
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
vec2 u_xlat22;
float u_xlat23;
float u_xlat33;
float u_xlat34;
bool u_xlatb34;
mediump float u_xlat16_39;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat2.xy = _Time.yy * _Panner1speed.xy + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat2.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat2.xy;
    u_xlat16_4.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat34 = dot(u_xlat5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat2.zw).xyz;
    u_xlat4.xyz = (-u_xlat3.xyz) + _BrushedMetal_1.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _Exterior_Color.xyz;
    u_xlat2.xyz = vs_COLOR0.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_6.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_6.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb34 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb34){
        u_xlat34 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat3.xyz = vec3(u_xlat34) * u_xlat16_6.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat34 = min(u_xlat4.y, u_xlat4.x);
        u_xlat34 = min(u_xlat4.z, u_xlat34);
        u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 0.0);
    u_xlat16_39 = u_xlat16_3.w + -1.0;
    u_xlat16_39 = unity_SpecCube0_HDR.w * u_xlat16_39 + 1.0;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * unity_SpecCube0_HDR.y;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb34 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb34){
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb34 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb34){
            u_xlat34 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat34 = inversesqrt(u_xlat34);
            u_xlat4.xyz = vec3(u_xlat34) * u_xlat16_6.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat4.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat5.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat5.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat5.z : u_xlat7.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat34 = min(u_xlat5.y, u_xlat5.x);
            u_xlat34 = min(u_xlat5.z, u_xlat34);
            u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat34) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 0.0);
        u_xlat16_6.x = u_xlat16_4.w + -1.0;
        u_xlat16_6.x = unity_SpecCube1_HDR.w * u_xlat16_6.x + 1.0;
        u_xlat16_6.x = log2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.y;
        u_xlat16_6.x = exp2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.x;
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
        u_xlat3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz + (-u_xlat16_6.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat34 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * vs_TEXCOORD1.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_39 = (-u_xlat1.x) + 1.0;
    u_xlat16_41 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * -0.5 + 1.0;
    u_xlat16_41 = -abs(u_xlat33) + 1.0;
    u_xlat16_10.x = u_xlat16_41 * u_xlat16_41;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_10.x;
    u_xlat16_10.xy = vec2(u_xlat16_41) * vec2(-0.5, 0.959999979) + vec2(1.0, 0.0399999991);
    u_xlat16_39 = u_xlat16_39 * u_xlat16_10.x;
    u_xlat11.x = u_xlat1.x * u_xlat16_39;
    u_xlat22.x = abs(u_xlat33) * 0.998000026 + 0.00200000009;
    u_xlat23 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat33 = abs(u_xlat33) * u_xlat23;
    u_xlat22.x = u_xlat1.x * u_xlat22.x + u_xlat33;
    u_xlat22.x = u_xlat22.x + 9.99999975e-06;
    u_xlat33 = u_xlat12 * u_xlat12;
    u_xlat33 = u_xlat33 * -0.999996006 + 1.0;
    u_xlat22.y = u_xlat33 * u_xlat33 + 1.00000001e-07;
    u_xlat22.xy = vec2(0.5, 1.2732396e-06) / u_xlat22.xy;
    u_xlat22.x = u_xlat22.y * u_xlat22.x;
    u_xlat22.x = u_xlat1.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 3.14159274;
    u_xlat16_10.xzw = u_xlat11.xxx * _LightColor0.xyz;
    u_xlat11.xyz = u_xlat22.xxx * _LightColor0.xyz;
    u_xlat16_39 = (-u_xlat0.x) + 1.0;
    u_xlat16_41 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat11.xyz * vec3(u_xlat16_39);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_10.xzw + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(0.999995947, 0.999995947, 0.999995947);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_10.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
out highp vec4 vs_TEXCOORD6;
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
uniform 	vec4 _Time;
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
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
float u_xlat13;
vec2 u_xlat24;
float u_xlat25;
float u_xlat36;
float u_xlat37;
bool u_xlatb37;
mediump float u_xlat16_42;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat2.xy = _Time.yy * _Panner1speed.xy + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat2.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat2.xy;
    u_xlat16_4.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat37 = dot(u_xlat5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat2.zw).xyz;
    u_xlat4.xyz = (-u_xlat3.xyz) + _BrushedMetal_1.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _Exterior_Color.xyz;
    u_xlat2.xyz = vs_COLOR0.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_6.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_6.xxx) + (-u_xlat1.xyz);
    u_xlat3.xyz = vs_TEXCOORD1.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb37){
        u_xlat37 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_6.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat37 = min(u_xlat4.y, u_xlat4.x);
        u_xlat37 = min(u_xlat4.z, u_xlat37);
        u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat37) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 0.0);
    u_xlat16_42 = u_xlat16_3.w + -1.0;
    u_xlat16_42 = unity_SpecCube0_HDR.w * u_xlat16_42 + 1.0;
    u_xlat16_42 = log2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.y;
    u_xlat16_42 = exp2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_3.xyz * vec3(u_xlat16_42);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb37 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb37){
#ifdef UNITY_ADRENO_ES3
        u_xlatb37 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb37 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb37){
            u_xlat37 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat37 = inversesqrt(u_xlat37);
            u_xlat4.xyz = vec3(u_xlat37) * u_xlat16_6.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat4.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat5.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat5.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat5.z : u_xlat8.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat37 = min(u_xlat5.y, u_xlat5.x);
            u_xlat37 = min(u_xlat5.z, u_xlat37);
            u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat37) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 0.0);
        u_xlat16_6.x = u_xlat16_4.w + -1.0;
        u_xlat16_6.x = unity_SpecCube1_HDR.w * u_xlat16_6.x + 1.0;
        u_xlat16_6.x = log2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.y;
        u_xlat16_6.x = exp2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.x;
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
        u_xlat3.xyz = vec3(u_xlat16_42) * u_xlat16_3.xyz + (-u_xlat16_6.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_6.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_42 = (-u_xlat1.x) + 1.0;
    u_xlat16_43 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * -0.5 + 1.0;
    u_xlat16_43 = -abs(u_xlat36) + 1.0;
    u_xlat16_45 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_45;
    u_xlat16_11.xy = vec2(u_xlat16_43) * vec2(-0.5, 0.959999979) + vec2(1.0, 0.0399999991);
    u_xlat16_42 = u_xlat16_42 * u_xlat16_11.x;
    u_xlat12.x = u_xlat1.x * u_xlat16_42;
    u_xlat24.x = abs(u_xlat36) * 0.998000026 + 0.00200000009;
    u_xlat25 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat36 = abs(u_xlat36) * u_xlat25;
    u_xlat24.x = u_xlat1.x * u_xlat24.x + u_xlat36;
    u_xlat24.x = u_xlat24.x + 9.99999975e-06;
    u_xlat36 = u_xlat13 * u_xlat13;
    u_xlat36 = u_xlat36 * -0.999996006 + 1.0;
    u_xlat24.y = u_xlat36 * u_xlat36 + 1.00000001e-07;
    u_xlat24.xy = vec2(0.5, 1.2732396e-06) / u_xlat24.xy;
    u_xlat24.x = u_xlat24.y * u_xlat24.x;
    u_xlat24.x = u_xlat1.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 3.14159274;
    u_xlat16_7.xyz = _LightColor0.xyz * u_xlat12.xxx + u_xlat16_7.xyz;
    u_xlat12.xyz = u_xlat24.xxx * _LightColor0.xyz;
    u_xlat16_42 = (-u_xlat0.x) + 1.0;
    u_xlat16_43 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_42);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(0.999995947, 0.999995947, 0.999995947);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_11.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
out highp vec4 vs_TEXCOORD6;
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
uniform 	vec4 _Time;
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
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
vec2 u_xlat22;
float u_xlat23;
float u_xlat33;
float u_xlat34;
bool u_xlatb34;
mediump float u_xlat16_39;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat2.xy = _Time.yy * _Panner1speed.xy + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat2.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat2.xy;
    u_xlat16_4.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat34 = dot(u_xlat5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat2.zw).xyz;
    u_xlat4.xyz = (-u_xlat3.xyz) + _BrushedMetal_1.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _Exterior_Color.xyz;
    u_xlat2.xyz = vs_COLOR0.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_6.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_6.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb34 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb34){
        u_xlat34 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat3.xyz = vec3(u_xlat34) * u_xlat16_6.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat34 = min(u_xlat4.y, u_xlat4.x);
        u_xlat34 = min(u_xlat4.z, u_xlat34);
        u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 0.0);
    u_xlat16_39 = u_xlat16_3.w + -1.0;
    u_xlat16_39 = unity_SpecCube0_HDR.w * u_xlat16_39 + 1.0;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * unity_SpecCube0_HDR.y;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb34 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb34){
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb34 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb34){
            u_xlat34 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat34 = inversesqrt(u_xlat34);
            u_xlat4.xyz = vec3(u_xlat34) * u_xlat16_6.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat4.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat5.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat5.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat5.z : u_xlat7.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat34 = min(u_xlat5.y, u_xlat5.x);
            u_xlat34 = min(u_xlat5.z, u_xlat34);
            u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat34) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 0.0);
        u_xlat16_6.x = u_xlat16_4.w + -1.0;
        u_xlat16_6.x = unity_SpecCube1_HDR.w * u_xlat16_6.x + 1.0;
        u_xlat16_6.x = log2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.y;
        u_xlat16_6.x = exp2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.x;
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
        u_xlat3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz + (-u_xlat16_6.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat34 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * vs_TEXCOORD1.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_39 = (-u_xlat1.x) + 1.0;
    u_xlat16_41 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * -0.5 + 1.0;
    u_xlat16_41 = -abs(u_xlat33) + 1.0;
    u_xlat16_10.x = u_xlat16_41 * u_xlat16_41;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_10.x;
    u_xlat16_10.xy = vec2(u_xlat16_41) * vec2(-0.5, 0.959999979) + vec2(1.0, 0.0399999991);
    u_xlat16_39 = u_xlat16_39 * u_xlat16_10.x;
    u_xlat11.x = u_xlat1.x * u_xlat16_39;
    u_xlat22.x = abs(u_xlat33) * 0.998000026 + 0.00200000009;
    u_xlat23 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat33 = abs(u_xlat33) * u_xlat23;
    u_xlat22.x = u_xlat1.x * u_xlat22.x + u_xlat33;
    u_xlat22.x = u_xlat22.x + 9.99999975e-06;
    u_xlat33 = u_xlat12 * u_xlat12;
    u_xlat33 = u_xlat33 * -0.999996006 + 1.0;
    u_xlat22.y = u_xlat33 * u_xlat33 + 1.00000001e-07;
    u_xlat22.xy = vec2(0.5, 1.2732396e-06) / u_xlat22.xy;
    u_xlat22.x = u_xlat22.y * u_xlat22.x;
    u_xlat22.x = u_xlat1.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 3.14159274;
    u_xlat16_10.xzw = u_xlat11.xxx * _LightColor0.xyz;
    u_xlat11.xyz = u_xlat22.xxx * _LightColor0.xyz;
    u_xlat16_39 = (-u_xlat0.x) + 1.0;
    u_xlat16_41 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_41;
    u_xlat16_39 = u_xlat16_39 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat11.xyz * vec3(u_xlat16_39);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_10.xzw + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(0.999995947, 0.999995947, 0.999995947);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_10.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
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
uniform 	vec4 _Time;
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
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
float u_xlat13;
vec2 u_xlat24;
float u_xlat25;
float u_xlat36;
float u_xlat37;
bool u_xlatb37;
mediump float u_xlat16_42;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat2.xy = _Time.yy * _Panner1speed.xy + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat2.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat2.xy;
    u_xlat16_4.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat37 = dot(u_xlat5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat2.zw).xyz;
    u_xlat4.xyz = (-u_xlat3.xyz) + _BrushedMetal_1.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _Exterior_Color.xyz;
    u_xlat2.xyz = vs_COLOR0.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_6.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_6.xxx) + (-u_xlat1.xyz);
    u_xlat3.xyz = vs_TEXCOORD1.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb37){
        u_xlat37 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_6.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat37 = min(u_xlat4.y, u_xlat4.x);
        u_xlat37 = min(u_xlat4.z, u_xlat37);
        u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat37) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 0.0);
    u_xlat16_42 = u_xlat16_3.w + -1.0;
    u_xlat16_42 = unity_SpecCube0_HDR.w * u_xlat16_42 + 1.0;
    u_xlat16_42 = log2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.y;
    u_xlat16_42 = exp2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_3.xyz * vec3(u_xlat16_42);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb37 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb37){
#ifdef UNITY_ADRENO_ES3
        u_xlatb37 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb37 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb37){
            u_xlat37 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat37 = inversesqrt(u_xlat37);
            u_xlat4.xyz = vec3(u_xlat37) * u_xlat16_6.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat4.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat5.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat5.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat5.z : u_xlat8.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat37 = min(u_xlat5.y, u_xlat5.x);
            u_xlat37 = min(u_xlat5.z, u_xlat37);
            u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat37) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 0.0);
        u_xlat16_6.x = u_xlat16_4.w + -1.0;
        u_xlat16_6.x = unity_SpecCube1_HDR.w * u_xlat16_6.x + 1.0;
        u_xlat16_6.x = log2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.y;
        u_xlat16_6.x = exp2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.x;
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
        u_xlat3.xyz = vec3(u_xlat16_42) * u_xlat16_3.xyz + (-u_xlat16_6.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_6.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_42 = (-u_xlat1.x) + 1.0;
    u_xlat16_43 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * -0.5 + 1.0;
    u_xlat16_43 = -abs(u_xlat36) + 1.0;
    u_xlat16_45 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_45;
    u_xlat16_11.xy = vec2(u_xlat16_43) * vec2(-0.5, 0.959999979) + vec2(1.0, 0.0399999991);
    u_xlat16_42 = u_xlat16_42 * u_xlat16_11.x;
    u_xlat12.x = u_xlat1.x * u_xlat16_42;
    u_xlat24.x = abs(u_xlat36) * 0.998000026 + 0.00200000009;
    u_xlat25 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat36 = abs(u_xlat36) * u_xlat25;
    u_xlat24.x = u_xlat1.x * u_xlat24.x + u_xlat36;
    u_xlat24.x = u_xlat24.x + 9.99999975e-06;
    u_xlat36 = u_xlat13 * u_xlat13;
    u_xlat36 = u_xlat36 * -0.999996006 + 1.0;
    u_xlat24.y = u_xlat36 * u_xlat36 + 1.00000001e-07;
    u_xlat24.xy = vec2(0.5, 1.2732396e-06) / u_xlat24.xy;
    u_xlat24.x = u_xlat24.y * u_xlat24.x;
    u_xlat24.x = u_xlat1.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 3.14159274;
    u_xlat16_7.xyz = _LightColor0.xyz * u_xlat12.xxx + u_xlat16_7.xyz;
    u_xlat12.xyz = u_xlat24.xxx * _LightColor0.xyz;
    u_xlat16_42 = (-u_xlat0.x) + 1.0;
    u_xlat16_43 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_43;
    u_xlat16_42 = u_xlat16_42 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_42);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(0.999995947, 0.999995947, 0.999995947);
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_11.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
  Offset 1, 1
  GpuProgramID 105168
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_12;
float u_xlat14;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat21 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat2.xyz);
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
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat16_25 = (-u_xlat22) + 1.0;
    u_xlat7.x = u_xlat21 * u_xlat21;
    u_xlat7.x = u_xlat7.x * -0.999996006 + 1.0;
    u_xlat0.y = u_xlat7.x * u_xlat7.x + 1.00000001e-07;
    u_xlat14 = abs(u_xlat0.x) * 0.998000026 + 0.00200000009;
    u_xlat21 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat21 = u_xlat21 * abs(u_xlat0.x);
    u_xlat16_5.x = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat14 + u_xlat21;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.xy = vec2(0.5, 1.2732396e-06) / u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = texture(_LightTexture0, u_xlat7.xx).x;
    u_xlat16_12.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_6 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_25);
    u_xlat16_25 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_5.x * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * -0.5 + 1.0;
    u_xlat16_5.x = (-u_xlat1.x) + 1.0;
    u_xlat16_6 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x * -0.5 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_5.x;
    u_xlat21 = u_xlat1.x * u_xlat16_25;
    u_xlat16_5.xyz = vec3(u_xlat21) * u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_11;
float u_xlat12;
float u_xlat18;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat18 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_22 = (-u_xlat1.x) + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * -0.999996006 + 1.0;
    u_xlat0.w = u_xlat18 * u_xlat18 + 1.00000001e-07;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat12 = abs(u_xlat0.x) * 0.998000026 + 0.00200000009;
    u_xlat1.x = u_xlat6 * 0.998000026 + 0.00200000009;
    u_xlat1.x = abs(u_xlat0.x) * u_xlat1.x;
    u_xlat16_5.x = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat6 * u_xlat12 + u_xlat1.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.xw = vec2(0.5, 1.2732396e-06) / u_xlat0.xw;
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.xzw = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat16_11 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11;
    u_xlat16_22 = u_xlat16_22 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_22);
    u_xlat16_22 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_5.x * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * -0.5 + 1.0;
    u_xlat16_5.x = (-u_xlat6) + 1.0;
    u_xlat16_11 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_11;
    u_xlat16_5.x = u_xlat16_5.x * -0.5 + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat6 = u_xlat6 * u_xlat16_22;
    u_xlat16_5.xyz = vec3(u_xlat6) * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xzw;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat21 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
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
    u_xlat16_25 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_25 = u_xlat21 * u_xlat16_25;
    u_xlat16_25 = u_xlat0.x * u_xlat16_25;
    u_xlat16_5.xyz = vec3(u_xlat16_25) * _LightColor0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat2.xyz);
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
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat16_25 = (-u_xlat22) + 1.0;
    u_xlat7 = u_xlat21 * u_xlat21;
    u_xlat7 = u_xlat7 * -0.999996006 + 1.0;
    u_xlat0.y = u_xlat7 * u_xlat7 + 1.00000001e-07;
    u_xlat14 = abs(u_xlat0.x) * 0.998000026 + 0.00200000009;
    u_xlat21 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat21 = u_xlat21 * abs(u_xlat0.x);
    u_xlat16_26 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat14 + u_xlat21;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.xy = vec2(0.5, 1.2732396e-06) / u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    u_xlat16_6 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_25);
    u_xlat16_25 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_26 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * -0.5 + 1.0;
    u_xlat16_26 = (-u_xlat1.x) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * -0.5 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat21 = u_xlat1.x * u_xlat16_25;
    u_xlat16_5.xyz = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform highp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_12;
float u_xlat14;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat21 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat2.xyz);
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
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat16_25 = (-u_xlat22) + 1.0;
    u_xlat7.x = u_xlat21 * u_xlat21;
    u_xlat7.x = u_xlat7.x * -0.999996006 + 1.0;
    u_xlat0.y = u_xlat7.x * u_xlat7.x + 1.00000001e-07;
    u_xlat14 = abs(u_xlat0.x) * 0.998000026 + 0.00200000009;
    u_xlat21 = u_xlat1.x * 0.998000026 + 0.00200000009;
    u_xlat21 = u_xlat21 * abs(u_xlat0.x);
    u_xlat16_5.x = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat14 + u_xlat21;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.xy = vec2(0.5, 1.2732396e-06) / u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = texture(_LightTexture0, u_xlat7.xyz).w;
    u_xlat14 = texture(_LightTextureB0, vec2(u_xlat8)).x;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat16_12.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_6 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_25);
    u_xlat16_25 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_5.x * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * -0.5 + 1.0;
    u_xlat16_5.x = (-u_xlat1.x) + 1.0;
    u_xlat16_6 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x * -0.5 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_5.x;
    u_xlat21 = u_xlat1.x * u_xlat16_25;
    u_xlat16_5.xyz = vec3(u_xlat21) * u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat21 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat21) + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_25 = (-u_xlat1.x) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * -0.999996006 + 1.0;
    u_xlat0.w = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat7 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat14.x = abs(u_xlat0.x) * 0.998000026 + 0.00200000009;
    u_xlat1.x = u_xlat7 * 0.998000026 + 0.00200000009;
    u_xlat1.x = abs(u_xlat0.x) * u_xlat1.x;
    u_xlat16_5.x = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat7 * u_xlat14.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.xw = vec2(0.5, 1.2732396e-06) / u_xlat0.xw;
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat14.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat14.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat14.xy;
    u_xlat14.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat14.xy;
    u_xlat14.xy = u_xlat14.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat14.x = texture(_LightTexture0, u_xlat14.xy).w;
    u_xlat16_12.xyz = u_xlat14.xxx * _LightColor0.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_6 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6;
    u_xlat16_25 = u_xlat16_25 * 0.959999979 + 0.0399999991;
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat16_25);
    u_xlat16_25 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_5.x * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * -0.5 + 1.0;
    u_xlat16_5.x = (-u_xlat7) + 1.0;
    u_xlat16_6 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x * -0.5 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_5.x;
    u_xlat7 = u_xlat7 * u_xlat16_25;
    u_xlat16_5.xyz = vec3(u_xlat7) * u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xzw;
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
}
}
 Pass {
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  Offset 1, 1
  GpuProgramID 144292
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
out highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat12 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 1.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3.w = 1.0;
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
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat18 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.xyz = u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 1.0);
    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1;
    u_xlat1.xyz = vs_TEXCOORD1.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + vs_TEXCOORD5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat16_4.xyz));
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
out highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat12 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 1.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3.w = 1.0;
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
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec2 _Panner1speed;
uniform 	vec2 _Panner2speed;
uniform 	vec4 _BrushedMetal_1;
uniform 	vec4 _Exterior_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(0.25, 0.0);
    u_xlat0.xy = _Time.yy * vec2(_Panner2speed.x, _Panner2speed.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.600000024, 1.0, 1.0, 4.0);
    u_xlat1.xy = _Time.yy * _Panner1speed.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_TextureSample0, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat18 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _BrushedMetal_1.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _Exterior_Color.xyz;
    u_xlat0.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.xyz = u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 1.0);
    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1;
    u_xlat1.xyz = vs_TEXCOORD1.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + vs_TEXCOORD5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target3.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat0.xyz;
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
}
CustomEditor "ASEMaterialInspector"
}