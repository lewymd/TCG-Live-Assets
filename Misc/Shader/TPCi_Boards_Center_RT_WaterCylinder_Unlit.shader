//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_WaterCylinder_Unlit" {
Properties {
_Bias ("Bias", Float) = 0
_Color0 ("Color 0", Color) = (0.3131897,0.7914842,0.9622642,0)
_Color1 ("Color 1", Color) = (0.2065237,0.2307375,0.4811321,0)
_Scale ("Scale", Float) = 1
_Power ("Power", Float) = 5
_normalstiling ("normals tiling", Vector) = (4,2,0,0)
_Texture0 ("Texture 0", 2D) = "white" { }
_normalstiling2 ("normals tiling 2", Vector) = (2,1,0,0)
_NormalsPanner2 ("Normals Panner 2", Vector) = (0.05,-0.01,0,0)
_NormalsPanner ("Normals Panner", Vector) = (0.05,0,0,0)
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 5717
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
uniform 	vec2 _NormalsPanner;
uniform 	vec2 _normalstiling;
uniform 	vec2 _NormalsPanner2;
uniform 	vec2 _normalstiling2;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _Bias;
uniform 	float _Scale;
uniform 	float _Power;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bvec3 u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bvec3 u_xlatb11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
float u_xlat17;
vec2 u_xlat32;
float u_xlat33;
vec2 u_xlat35;
float u_xlat48;
bool u_xlatb48;
float u_xlat49;
float u_xlat50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat2.xyz = vec3(u_xlat48) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_normalstiling.x, _normalstiling.y);
    u_xlat3.xy = _Time.yy * _NormalsPanner.xy + u_xlat3.xy;
    u_xlat35.xy = vs_TEXCOORD0.xy * vec2(_normalstiling2.x, _normalstiling2.y);
    u_xlat35.xy = _Time.yy * _NormalsPanner2.xy + u_xlat35.xy;
    u_xlat16_4.xyz = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat35.xy).xyz;
    u_xlat16_5.xy = u_xlat16_3.xy + u_xlat16_4.xy;
    u_xlat16_5.z = u_xlat16_3.z * u_xlat16_4.z;
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_53) + vec3(0.214041099, 0.214041099, 0.0);
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat3.x = vs_TEXCOORD1.x;
    u_xlat3.y = vs_TEXCOORD2.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat4.x = vs_TEXCOORD1.y;
    u_xlat4.y = vs_TEXCOORD2.y;
    u_xlat4.z = vs_TEXCOORD3.y;
    u_xlat4.xyz = u_xlat16_5.yyy * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx + u_xlat4.xyz;
    u_xlat4.x = vs_TEXCOORD1.z;
    u_xlat4.y = vs_TEXCOORD2.z;
    u_xlat4.z = vs_TEXCOORD3.z;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat16_5.zzz + u_xlat3.xyz;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Power;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = _Scale * u_xlat49 + _Bias;
    u_xlat49 = (-u_xlat49) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat3.xyz + _Color0.xyz;
    u_xlat49 = dot(u_xlat16_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat50 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat4.xyz = vec3(u_xlat50) * u_xlat4.xyz;
    u_xlat16_5.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat4.xyz * (-u_xlat16_5.xxx) + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb50 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb50){
        u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat50 = inversesqrt(u_xlat50);
        u_xlat6.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
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
        u_xlat50 = min(u_xlat7.y, u_xlat7.x);
        u_xlat50 = min(u_xlat7.z, u_xlat50);
        u_xlat7.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat50) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, 0.978000164);
    u_xlat16_53 = u_xlat16_6.w + -1.0;
    u_xlat16_53 = unity_SpecCube0_HDR.w * u_xlat16_53 + 1.0;
    u_xlat16_53 = log2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * unity_SpecCube0_HDR.y;
    u_xlat16_53 = exp2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_6.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb50 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb50){
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb50 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb50){
            u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat50 = inversesqrt(u_xlat50);
            u_xlat7.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
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
            u_xlat50 = min(u_xlat8.y, u_xlat8.x);
            u_xlat50 = min(u_xlat8.z, u_xlat50);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat50) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, 0.978000164);
        u_xlat16_5.x = u_xlat16_7.w + -1.0;
        u_xlat16_5.x = unity_SpecCube1_HDR.w * u_xlat16_5.x + 1.0;
        u_xlat16_5.x = log2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.y;
        u_xlat16_5.x = exp2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.x;
        u_xlat16_5.xyz = u_xlat16_7.xyz * u_xlat16_5.xxx;
        u_xlat0.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_5.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat16_5.xyz = vec3(u_xlat49) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat48) + _WorldSpaceLightPos0.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat0.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat48 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat17 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat0.x + u_xlat0.x;
    u_xlat16_53 = u_xlat0.x * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.100000024 + -0.5;
    u_xlat16_58 = (-u_xlat1.x) + 1.0;
    u_xlat16_60 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_60;
    u_xlat16_58 = u_xlat16_53 * u_xlat16_58 + 1.0;
    u_xlat16_60 = -abs(u_xlat48) + 1.0;
    u_xlat16_13.x = u_xlat16_60 * u_xlat16_60;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_13.x;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_60 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_58;
    u_xlat16.x = u_xlat1.x * u_xlat16_53;
    u_xlat32.x = abs(u_xlat48) * 0.99000001 + 0.0100000044;
    u_xlat33 = u_xlat1.x * 0.99000001 + 0.0100000044;
    u_xlat48 = abs(u_xlat48) * u_xlat33;
    u_xlat32.x = u_xlat1.x * u_xlat32.x + u_xlat48;
    u_xlat32.x = u_xlat32.x + 9.99999975e-06;
    u_xlat48 = u_xlat17 * u_xlat17;
    u_xlat48 = u_xlat48 * -0.999899983 + 1.0;
    u_xlat32.y = u_xlat48 * u_xlat48 + 1.00000001e-07;
    u_xlat32.xy = vec2(0.5, 3.18310158e-05) / u_xlat32.xy;
    u_xlat32.x = u_xlat32.y * u_xlat32.x;
    u_xlat32.x = u_xlat1.x * u_xlat32.x;
    u_xlat32.x = u_xlat32.x * 3.14159274;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_53!=0.0);
#else
    u_xlatb48 = u_xlat16_53!=0.0;
#endif
    u_xlat48 = u_xlatb48 ? 1.0 : float(0.0);
    u_xlat32.x = u_xlat48 * u_xlat32.x;
    u_xlat16_13.xyz = u_xlat16.xxx * _LightColor0.xyz;
    u_xlat16.xyz = u_xlat32.xxx * _LightColor0.xyz;
    u_xlat16_53 = (-u_xlat0.x) + 1.0;
    u_xlat16_58 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_58;
    u_xlat16_14.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(u_xlat16_53) + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16.xyz * u_xlat16_15.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.999899983, 0.999899983, 0.999899983);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_10.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat3.xyz * vec3(0.160377398, 0.160377398, 0.160377398) + u_xlat0.xyz;
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
uniform 	vec2 _NormalsPanner;
uniform 	vec2 _normalstiling;
uniform 	vec2 _NormalsPanner2;
uniform 	vec2 _normalstiling2;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _Bias;
uniform 	float _Scale;
uniform 	float _Power;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bvec3 u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bvec3 u_xlatb11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
float u_xlat17;
vec2 u_xlat32;
float u_xlat33;
vec2 u_xlat35;
float u_xlat48;
bool u_xlatb48;
float u_xlat49;
float u_xlat50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat2.xyz = vec3(u_xlat48) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_normalstiling.x, _normalstiling.y);
    u_xlat3.xy = _Time.yy * _NormalsPanner.xy + u_xlat3.xy;
    u_xlat35.xy = vs_TEXCOORD0.xy * vec2(_normalstiling2.x, _normalstiling2.y);
    u_xlat35.xy = _Time.yy * _NormalsPanner2.xy + u_xlat35.xy;
    u_xlat16_4.xyz = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_Texture0, u_xlat35.xy).xyz;
    u_xlat16_5.xy = u_xlat16_3.xy + u_xlat16_4.xy;
    u_xlat16_5.z = u_xlat16_3.z * u_xlat16_4.z;
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_53) + vec3(0.214041099, 0.214041099, 0.0);
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat3.x = vs_TEXCOORD1.x;
    u_xlat3.y = vs_TEXCOORD2.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat4.x = vs_TEXCOORD1.y;
    u_xlat4.y = vs_TEXCOORD2.y;
    u_xlat4.z = vs_TEXCOORD3.y;
    u_xlat4.xyz = u_xlat16_5.yyy * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx + u_xlat4.xyz;
    u_xlat4.x = vs_TEXCOORD1.z;
    u_xlat4.y = vs_TEXCOORD2.z;
    u_xlat4.z = vs_TEXCOORD3.z;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat16_5.zzz + u_xlat3.xyz;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Power;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = _Scale * u_xlat49 + _Bias;
    u_xlat49 = (-u_xlat49) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat3.xyz + _Color0.xyz;
    u_xlat49 = dot(u_xlat16_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat4.z = dot(vs_TEXCOORD3.xyz, u_xlat16_5.xyz);
    u_xlat50 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat4.xyz = vec3(u_xlat50) * u_xlat4.xyz;
    u_xlat16_5.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat4.xyz * (-u_xlat16_5.xxx) + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb50 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb50){
        u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat50 = inversesqrt(u_xlat50);
        u_xlat6.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
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
        u_xlat50 = min(u_xlat7.y, u_xlat7.x);
        u_xlat50 = min(u_xlat7.z, u_xlat50);
        u_xlat7.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat50) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, 0.978000164);
    u_xlat16_53 = u_xlat16_6.w + -1.0;
    u_xlat16_53 = unity_SpecCube0_HDR.w * u_xlat16_53 + 1.0;
    u_xlat16_53 = log2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * unity_SpecCube0_HDR.y;
    u_xlat16_53 = exp2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_6.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb50 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb50){
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb50 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb50){
            u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat50 = inversesqrt(u_xlat50);
            u_xlat7.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
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
            u_xlat50 = min(u_xlat8.y, u_xlat8.x);
            u_xlat50 = min(u_xlat8.z, u_xlat50);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat50) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, 0.978000164);
        u_xlat16_5.x = u_xlat16_7.w + -1.0;
        u_xlat16_5.x = unity_SpecCube1_HDR.w * u_xlat16_5.x + 1.0;
        u_xlat16_5.x = log2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.y;
        u_xlat16_5.x = exp2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.x;
        u_xlat16_5.xyz = u_xlat16_7.xyz * u_xlat16_5.xxx;
        u_xlat0.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_5.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat16_5.xyz = vec3(u_xlat49) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat48) + _WorldSpaceLightPos0.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat0.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat48 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat17 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat0.x + u_xlat0.x;
    u_xlat16_53 = u_xlat0.x * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.100000024 + -0.5;
    u_xlat16_58 = (-u_xlat1.x) + 1.0;
    u_xlat16_60 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_60;
    u_xlat16_58 = u_xlat16_53 * u_xlat16_58 + 1.0;
    u_xlat16_60 = -abs(u_xlat48) + 1.0;
    u_xlat16_13.x = u_xlat16_60 * u_xlat16_60;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_13.x;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_60 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_58;
    u_xlat16.x = u_xlat1.x * u_xlat16_53;
    u_xlat32.x = abs(u_xlat48) * 0.99000001 + 0.0100000044;
    u_xlat33 = u_xlat1.x * 0.99000001 + 0.0100000044;
    u_xlat48 = abs(u_xlat48) * u_xlat33;
    u_xlat32.x = u_xlat1.x * u_xlat32.x + u_xlat48;
    u_xlat32.x = u_xlat32.x + 9.99999975e-06;
    u_xlat48 = u_xlat17 * u_xlat17;
    u_xlat48 = u_xlat48 * -0.999899983 + 1.0;
    u_xlat32.y = u_xlat48 * u_xlat48 + 1.00000001e-07;
    u_xlat32.xy = vec2(0.5, 3.18310158e-05) / u_xlat32.xy;
    u_xlat32.x = u_xlat32.y * u_xlat32.x;
    u_xlat32.x = u_xlat1.x * u_xlat32.x;
    u_xlat32.x = u_xlat32.x * 3.14159274;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_53!=0.0);
#else
    u_xlatb48 = u_xlat16_53!=0.0;
#endif
    u_xlat48 = u_xlatb48 ? 1.0 : float(0.0);
    u_xlat32.x = u_xlat48 * u_xlat32.x;
    u_xlat16_13.xyz = u_xlat16.xxx * _LightColor0.xyz;
    u_xlat16.xyz = u_xlat32.xxx * _LightColor0.xyz;
    u_xlat16_53 = (-u_xlat0.x) + 1.0;
    u_xlat16_58 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_58;
    u_xlat16_14.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(u_xlat16_53) + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16.xyz * u_xlat16_15.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.999899983, 0.999899983, 0.999899983);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_10.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat3.xyz * vec3(0.160377398, 0.160377398, 0.160377398) + u_xlat0.xyz;
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
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 72005
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec2 _NormalsPanner;
uniform 	vec2 _normalstiling;
uniform 	vec2 _NormalsPanner2;
uniform 	vec2 _normalstiling2;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _Bias;
uniform 	float _Scale;
uniform 	float _Power;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_normalstiling.x, _normalstiling.y);
    u_xlat1.xy = _Time.yy * _NormalsPanner.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_normalstiling2.x, _normalstiling2.y);
    u_xlat2.xy = _Time.yy * _NormalsPanner2.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy + u_xlat16_2.xy;
    u_xlat16_3.z = u_xlat16_1.z * u_xlat16_2.z;
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + vec3(0.214041099, 0.214041099, 0.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat1.x = vs_TEXCOORD1.y;
    u_xlat1.y = vs_TEXCOORD2.y;
    u_xlat1.z = vs_TEXCOORD3.y;
    u_xlat1.xyz = u_xlat16_3.yyy * u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.x;
    u_xlat2.y = vs_TEXCOORD2.x;
    u_xlat2.z = vs_TEXCOORD3.x;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Power;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = _Scale * u_xlat0.x + _Bias;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + _Color0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat15 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = (-u_xlat15) + 1.0;
    SV_Target0.w = u_xlat15;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.160377398, 0.160377398, 0.160377398);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target1.xyz = u_xlat16_4.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = 0.899999976;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat0.xyz;
    SV_Target2.w = 1.0;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec2 _NormalsPanner;
uniform 	vec2 _normalstiling;
uniform 	vec2 _NormalsPanner2;
uniform 	vec2 _normalstiling2;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _Bias;
uniform 	float _Scale;
uniform 	float _Power;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_normalstiling.x, _normalstiling.y);
    u_xlat1.xy = _Time.yy * _NormalsPanner.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_normalstiling2.x, _normalstiling2.y);
    u_xlat2.xy = _Time.yy * _NormalsPanner2.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy + u_xlat16_2.xy;
    u_xlat16_3.z = u_xlat16_1.z * u_xlat16_2.z;
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + vec3(0.214041099, 0.214041099, 0.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat1.x = vs_TEXCOORD1.y;
    u_xlat1.y = vs_TEXCOORD2.y;
    u_xlat1.z = vs_TEXCOORD3.y;
    u_xlat1.xyz = u_xlat16_3.yyy * u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.x;
    u_xlat2.y = vs_TEXCOORD2.x;
    u_xlat2.z = vs_TEXCOORD3.x;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Power;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = _Scale * u_xlat0.x + _Bias;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + _Color0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat15 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = (-u_xlat15) + 1.0;
    SV_Target0.w = u_xlat15;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.160377398, 0.160377398, 0.160377398);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target1.xyz = u_xlat16_4.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = 0.899999976;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat0.xyz;
    SV_Target2.w = 1.0;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec2 _NormalsPanner;
uniform 	vec2 _normalstiling;
uniform 	vec2 _NormalsPanner2;
uniform 	vec2 _normalstiling2;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _Bias;
uniform 	float _Scale;
uniform 	float _Power;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_normalstiling.x, _normalstiling.y);
    u_xlat1.xy = _Time.yy * _NormalsPanner.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_normalstiling2.x, _normalstiling2.y);
    u_xlat2.xy = _Time.yy * _NormalsPanner2.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy + u_xlat16_2.xy;
    u_xlat16_3.z = u_xlat16_1.z * u_xlat16_2.z;
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + vec3(0.214041099, 0.214041099, 0.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat1.x = vs_TEXCOORD1.y;
    u_xlat1.y = vs_TEXCOORD2.y;
    u_xlat1.z = vs_TEXCOORD3.y;
    u_xlat1.xyz = u_xlat16_3.yyy * u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.x;
    u_xlat2.y = vs_TEXCOORD2.x;
    u_xlat2.z = vs_TEXCOORD3.x;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Power;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = _Scale * u_xlat0.x + _Bias;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + _Color0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat15 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = (-u_xlat15) + 1.0;
    SV_Target0.w = u_xlat15;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.160377398, 0.160377398, 0.160377398);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target1.xyz = u_xlat16_4.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = 0.899999976;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat0.xyz;
    SV_Target2.w = 1.0;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec2 _NormalsPanner;
uniform 	vec2 _normalstiling;
uniform 	vec2 _NormalsPanner2;
uniform 	vec2 _normalstiling2;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _Bias;
uniform 	float _Scale;
uniform 	float _Power;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_normalstiling.x, _normalstiling.y);
    u_xlat1.xy = _Time.yy * _NormalsPanner.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_Texture0, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_normalstiling2.x, _normalstiling2.y);
    u_xlat2.xy = _Time.yy * _NormalsPanner2.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy + u_xlat16_2.xy;
    u_xlat16_3.z = u_xlat16_1.z * u_xlat16_2.z;
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + vec3(0.214041099, 0.214041099, 0.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat1.x = vs_TEXCOORD1.y;
    u_xlat1.y = vs_TEXCOORD2.y;
    u_xlat1.z = vs_TEXCOORD3.y;
    u_xlat1.xyz = u_xlat16_3.yyy * u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.x;
    u_xlat2.y = vs_TEXCOORD2.x;
    u_xlat2.z = vs_TEXCOORD3.x;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Power;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = _Scale * u_xlat0.x + _Bias;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + _Color0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.863999963, 0.863999963, 0.863999963);
    u_xlat15 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = (-u_xlat15) + 1.0;
    SV_Target0.w = u_xlat15;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.160377398, 0.160377398, 0.160377398);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target1.xyz = u_xlat16_4.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = 0.899999976;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat0.xyz;
    SV_Target2.w = 1.0;
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