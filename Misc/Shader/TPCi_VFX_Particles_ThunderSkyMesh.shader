//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/ThunderSkyMesh" {
Properties {
_Clouds_Background ("Clouds_Background", 2D) = "white" { }
_Clouds_Background_Tiling ("Clouds_Background_Tiling", Vector) = (1,1,0,0)
_Clouds_Background_Offset ("Clouds_Background_Offset", Vector) = (0,0,0,0)
_Clouds_Background_Panning ("Clouds_Background_Panning", Vector) = (0,0,0,0)
_Clouds_Background_Emissive ("Clouds_Background_Emissive", Float) = 1
_Clouds_Background_Distortion_Tiling ("Clouds_Background_Distortion_Tiling", Vector) = (1,1,0,0)
_Clouds_Background_Distortion_Offset ("Clouds_Background_Distortion_Offset", Vector) = (0,0,0,0)
_Clouds_Background_Distortion_Panning ("Clouds_Background_Distortion_Panning", Vector) = (0,0,0,0)
_Clouds_Background_Distortion_Amount ("Clouds_Background_Distortion_Amount", Float) = 0
_Texture0 ("Texture 0", 2D) = "white" { }
_Clouds_Background_Smoothstep ("Clouds_Background_Smoothstep", Vector) = (0,1,0,0)
_Emissive_Lightning_color ("Emissive_Lightning_color", Color) = (0.9180706,0.9433962,0.1913492,0)
_Emissive_Lightning_Intensity ("Emissive_Lightning_Intensity", Float) = 1
_Emissive_Lightning_Smoothstep ("Emissive_Lightning_Smoothstep", Vector) = (0,1,0,0)
_Lightning_Flash_Mask ("Lightning_Flash_Mask", 2D) = "white" { }
_Lightning_Flash_Mask_Tiling ("Lightning_Flash_Mask_Tiling", Vector) = (0.5,0.5,0,0)
_Lightning_Flash_Mask_Offset ("Lightning_Flash_Mask_Offset", Vector) = (-0.54,0.25,0,0)
_Lightning_Flash_Mask_Panning ("Lightning_Flash_Mask_Panning", Vector) = (0.5,0,0,0)
_Lightning_Flash_Mask_2_Tiling ("Lightning_Flash_Mask_2_Tiling", Vector) = (1,1,0,0)
_Lightning_Flash_Mask_2_Offset ("Lightning_Flash_Mask_2_Offset", Vector) = (0,0,0,0)
_Lightning_Flash_Mask_2_Panning ("Lightning_Flash_Mask_2_Panning", Vector) = (0.3,0.2,0,0)
_Lightning_Flash_Mask_Opacity ("Lightning_Flash_Mask_Opacity", Float) = 0.5
_Lightning_Flash_Mask_2_Opacity ("Lightning_Flash_Mask_2_Opacity", Float) = 0.6
_Clouds_Color_Tint_1 ("Clouds_Color_Tint_1", Color) = (0.2688679,0.535322,1,0)
_Clouds_Color_Tint_2 ("Clouds_Color_Tint_2", Color) = (0,0,0,0)
_Clouds_Color_Tint_Smoothstep ("Clouds_Color_Tint_Smoothstep", Vector) = (0,1,0,0)
_Clouds_Color_Tint_Offset ("Clouds_Color_Tint_Offset", Vector) = (0,0,0,0)
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 12493
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
uniform 	vec2 _Clouds_Background_Smoothstep;
uniform 	vec2 _Clouds_Background_Distortion_Panning;
uniform 	vec2 _Clouds_Background_Distortion_Tiling;
uniform 	vec2 _Clouds_Background_Distortion_Offset;
uniform 	float _Clouds_Background_Distortion_Amount;
uniform 	vec2 _Clouds_Background_Panning;
uniform 	vec2 _Clouds_Background_Tiling;
uniform 	vec2 _Clouds_Background_Offset;
uniform 	float _Emissive_Lightning_Intensity;
uniform 	vec4 _Emissive_Lightning_color;
uniform 	float _Lightning_Flash_Mask_Opacity;
uniform 	vec2 _Lightning_Flash_Mask_Panning;
uniform 	vec2 _Lightning_Flash_Mask_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_Offset;
uniform 	vec2 _Lightning_Flash_Mask_2_Panning;
uniform 	vec2 _Lightning_Flash_Mask_2_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_2_Offset;
uniform 	float _Lightning_Flash_Mask_2_Opacity;
uniform 	vec2 _Emissive_Lightning_Smoothstep;
uniform 	float _Clouds_Background_Emissive;
uniform 	vec4 _Clouds_Color_Tint_2;
uniform 	vec4 _Clouds_Color_Tint_1;
uniform 	vec2 _Clouds_Color_Tint_Smoothstep;
uniform 	vec2 _Clouds_Color_Tint_Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds_Background;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning_Flash_Mask;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bvec3 u_xlatb7;
vec3 u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat17;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat26;
float u_xlat36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
float u_xlat39;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Clouds_Background_Distortion_Tiling.xy + vec2(_Clouds_Background_Distortion_Offset.x, _Clouds_Background_Distortion_Offset.y);
    u_xlat2.xy = _Time.yy * vec2(_Clouds_Background_Distortion_Panning.x, _Clouds_Background_Distortion_Panning.y) + u_xlat2.xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Clouds_Background_Tiling.xy + vec2(_Clouds_Background_Offset.x, _Clouds_Background_Offset.y);
    u_xlat26.xy = _Time.yy * vec2(_Clouds_Background_Panning.x, _Clouds_Background_Panning.y) + u_xlat26.xy;
    u_xlat16_2.xy = texture(_Texture0, u_xlat2.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(_Clouds_Background_Distortion_Amount) + u_xlat26.xy;
    u_xlat16_2.xyz = texture(_Clouds_Background, u_xlat2.xy).xyz;
    u_xlat37 = (-_Clouds_Background_Smoothstep.x) + _Clouds_Background_Smoothstep.y;
    u_xlat3.xyz = u_xlat16_2.xyz + (-_Clouds_Background_Smoothstep.xxx);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat4.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat37 = _Time.y + _Time.y;
    u_xlat37 = sin(u_xlat37);
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat5 = _Time.yyyy * vec4(12.0, 8.0, 48.0, 24.0);
    u_xlat5.xz = sin(u_xlat5.xz);
    u_xlat37 = u_xlat37 + u_xlat5.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat17.xz = sin((-u_xlat5.yw));
    u_xlat37 = u_xlat37 + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat6.xy = vs_TEXCOORD0.xy * _Lightning_Flash_Mask_Tiling.xy + vec2(_Lightning_Flash_Mask_Offset.x, _Lightning_Flash_Mask_Offset.y);
    u_xlat6.xy = _Time.yy * vec2(_Lightning_Flash_Mask_Panning.x, _Lightning_Flash_Mask_Panning.y) + u_xlat6.xy;
    u_xlat16_6.xyz = texture(_Lightning_Flash_Mask, u_xlat6.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_6.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat6.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * vec2(_Lightning_Flash_Mask_2_Tiling.x, _Lightning_Flash_Mask_2_Tiling.y) + _Lightning_Flash_Mask_2_Offset.xy;
    u_xlat7.xy = _Time.yy * _Lightning_Flash_Mask_2_Panning.xy + u_xlat7.xy;
    u_xlat16_7.xyz = texture(_Lightning_Flash_Mask, u_xlat7.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_7.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat7.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat38 = u_xlat5.x + 1.0;
    u_xlat38 = u_xlat38 + u_xlat5.z;
    u_xlat38 = u_xlat38 + 1.5;
    u_xlat38 = u_xlat17.z + u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat38) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity));
    u_xlat5.xyz = vec3(_Lightning_Flash_Mask_Opacity) * u_xlat5.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat38 = (-_Emissive_Lightning_Smoothstep.x) + _Emissive_Lightning_Smoothstep.y;
    u_xlat2.xyz = u_xlat16_2.xyz + (-_Emissive_Lightning_Smoothstep.xxx);
    u_xlat38 = float(1.0) / u_xlat38;
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat38 = vs_TEXCOORD0.y + _Clouds_Color_Tint_Offset.xxxy.w;
    u_xlat39 = (-_Clouds_Color_Tint_Smoothstep.x) + _Clouds_Color_Tint_Smoothstep.y;
    u_xlat38 = u_xlat38 + (-_Clouds_Color_Tint_Smoothstep.x);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat38 = u_xlat38 * u_xlat39;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat39 = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat39;
    u_xlat6.xyz = (-_Clouds_Color_Tint_2.xyz) + _Clouds_Color_Tint_1.xyz;
    u_xlat6.xyz = vec3(u_xlat38) * u_xlat6.xyz + _Clouds_Color_Tint_2.xyz;
    u_xlat37 = u_xlat37 * _Clouds_Background_Emissive;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat6.xyz * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(_Emissive_Lightning_Intensity) * _Emissive_Lightning_color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat16_9.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_9.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_9.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb37){
        u_xlat37 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_9.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec4 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat37 = min(u_xlat5.y, u_xlat5.x);
        u_xlat37 = min(u_xlat5.z, u_xlat37);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat37) + u_xlat5.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_9.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_45 = u_xlat16_3.w + -1.0;
    u_xlat16_45 = unity_SpecCube0_HDR.w * u_xlat16_45 + 1.0;
    u_xlat16_45 = log2(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * unity_SpecCube0_HDR.y;
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_3.xyz * vec3(u_xlat16_45);
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
            u_xlat37 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
            u_xlat37 = inversesqrt(u_xlat37);
            u_xlat5.xyz = vec3(u_xlat37) * u_xlat16_9.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat37 = min(u_xlat6.y, u_xlat6.x);
            u_xlat37 = min(u_xlat6.z, u_xlat37);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat37) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_9.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_9.x = u_xlat16_5.w + -1.0;
        u_xlat16_9.x = unity_SpecCube1_HDR.w * u_xlat16_9.x + 1.0;
        u_xlat16_9.x = log2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.y;
        u_xlat16_9.x = exp2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.x;
        u_xlat16_9.xyz = u_xlat16_5.xyz * u_xlat16_9.xxx;
        u_xlat3.xyz = vec3(u_xlat16_45) * u_xlat16_3.xyz + (-u_xlat16_9.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat16_9.xyz = u_xlat4.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
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
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat0.x + u_xlat0.x;
    u_xlat16_45 = u_xlat16_45 * u_xlat0.x + -0.5;
    u_xlat16_46 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_11;
    u_xlat16_46 = u_xlat16_45 * u_xlat16_46 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11 + 1.0;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_46;
    u_xlat12.x = u_xlat1.x * u_xlat16_45;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_45 = (-u_xlat0.x) + 1.0;
    u_xlat16_46 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_46;
    u_xlat16_45 = u_xlat16_45 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_45);
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_45 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(u_xlat16_45) + u_xlat0.xyz;
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
uniform 	vec2 _Clouds_Background_Smoothstep;
uniform 	vec2 _Clouds_Background_Distortion_Panning;
uniform 	vec2 _Clouds_Background_Distortion_Tiling;
uniform 	vec2 _Clouds_Background_Distortion_Offset;
uniform 	float _Clouds_Background_Distortion_Amount;
uniform 	vec2 _Clouds_Background_Panning;
uniform 	vec2 _Clouds_Background_Tiling;
uniform 	vec2 _Clouds_Background_Offset;
uniform 	float _Emissive_Lightning_Intensity;
uniform 	vec4 _Emissive_Lightning_color;
uniform 	float _Lightning_Flash_Mask_Opacity;
uniform 	vec2 _Lightning_Flash_Mask_Panning;
uniform 	vec2 _Lightning_Flash_Mask_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_Offset;
uniform 	vec2 _Lightning_Flash_Mask_2_Panning;
uniform 	vec2 _Lightning_Flash_Mask_2_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_2_Offset;
uniform 	float _Lightning_Flash_Mask_2_Opacity;
uniform 	vec2 _Emissive_Lightning_Smoothstep;
uniform 	float _Clouds_Background_Emissive;
uniform 	vec4 _Clouds_Color_Tint_2;
uniform 	vec4 _Clouds_Color_Tint_1;
uniform 	vec2 _Clouds_Color_Tint_Smoothstep;
uniform 	vec2 _Clouds_Color_Tint_Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds_Background;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning_Flash_Mask;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bvec3 u_xlatb7;
vec3 u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat17;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat26;
float u_xlat36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
float u_xlat39;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Clouds_Background_Distortion_Tiling.xy + vec2(_Clouds_Background_Distortion_Offset.x, _Clouds_Background_Distortion_Offset.y);
    u_xlat2.xy = _Time.yy * vec2(_Clouds_Background_Distortion_Panning.x, _Clouds_Background_Distortion_Panning.y) + u_xlat2.xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Clouds_Background_Tiling.xy + vec2(_Clouds_Background_Offset.x, _Clouds_Background_Offset.y);
    u_xlat26.xy = _Time.yy * vec2(_Clouds_Background_Panning.x, _Clouds_Background_Panning.y) + u_xlat26.xy;
    u_xlat16_2.xy = texture(_Texture0, u_xlat2.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(_Clouds_Background_Distortion_Amount) + u_xlat26.xy;
    u_xlat16_2.xyz = texture(_Clouds_Background, u_xlat2.xy).xyz;
    u_xlat37 = (-_Clouds_Background_Smoothstep.x) + _Clouds_Background_Smoothstep.y;
    u_xlat3.xyz = u_xlat16_2.xyz + (-_Clouds_Background_Smoothstep.xxx);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat4.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat37 = _Time.y + _Time.y;
    u_xlat37 = sin(u_xlat37);
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat5 = _Time.yyyy * vec4(12.0, 8.0, 48.0, 24.0);
    u_xlat5.xz = sin(u_xlat5.xz);
    u_xlat37 = u_xlat37 + u_xlat5.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat17.xz = sin((-u_xlat5.yw));
    u_xlat37 = u_xlat37 + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat6.xy = vs_TEXCOORD0.xy * _Lightning_Flash_Mask_Tiling.xy + vec2(_Lightning_Flash_Mask_Offset.x, _Lightning_Flash_Mask_Offset.y);
    u_xlat6.xy = _Time.yy * vec2(_Lightning_Flash_Mask_Panning.x, _Lightning_Flash_Mask_Panning.y) + u_xlat6.xy;
    u_xlat16_6.xyz = texture(_Lightning_Flash_Mask, u_xlat6.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_6.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat6.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * vec2(_Lightning_Flash_Mask_2_Tiling.x, _Lightning_Flash_Mask_2_Tiling.y) + _Lightning_Flash_Mask_2_Offset.xy;
    u_xlat7.xy = _Time.yy * _Lightning_Flash_Mask_2_Panning.xy + u_xlat7.xy;
    u_xlat16_7.xyz = texture(_Lightning_Flash_Mask, u_xlat7.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_7.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat7.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat38 = u_xlat5.x + 1.0;
    u_xlat38 = u_xlat38 + u_xlat5.z;
    u_xlat38 = u_xlat38 + 1.5;
    u_xlat38 = u_xlat17.z + u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat38) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity));
    u_xlat5.xyz = vec3(_Lightning_Flash_Mask_Opacity) * u_xlat5.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat38 = (-_Emissive_Lightning_Smoothstep.x) + _Emissive_Lightning_Smoothstep.y;
    u_xlat2.xyz = u_xlat16_2.xyz + (-_Emissive_Lightning_Smoothstep.xxx);
    u_xlat38 = float(1.0) / u_xlat38;
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat38 = vs_TEXCOORD0.y + _Clouds_Color_Tint_Offset.xxxy.w;
    u_xlat39 = (-_Clouds_Color_Tint_Smoothstep.x) + _Clouds_Color_Tint_Smoothstep.y;
    u_xlat38 = u_xlat38 + (-_Clouds_Color_Tint_Smoothstep.x);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat38 = u_xlat38 * u_xlat39;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat39 = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat39;
    u_xlat6.xyz = (-_Clouds_Color_Tint_2.xyz) + _Clouds_Color_Tint_1.xyz;
    u_xlat6.xyz = vec3(u_xlat38) * u_xlat6.xyz + _Clouds_Color_Tint_2.xyz;
    u_xlat37 = u_xlat37 * _Clouds_Background_Emissive;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat6.xyz * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(_Emissive_Lightning_Intensity) * _Emissive_Lightning_color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat6.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat16_9.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_9.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_9.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb37){
        u_xlat37 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_9.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec4 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat37 = min(u_xlat5.y, u_xlat5.x);
        u_xlat37 = min(u_xlat5.z, u_xlat37);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat37) + u_xlat5.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_9.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_45 = u_xlat16_3.w + -1.0;
    u_xlat16_45 = unity_SpecCube0_HDR.w * u_xlat16_45 + 1.0;
    u_xlat16_45 = log2(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * unity_SpecCube0_HDR.y;
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_3.xyz * vec3(u_xlat16_45);
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
            u_xlat37 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
            u_xlat37 = inversesqrt(u_xlat37);
            u_xlat5.xyz = vec3(u_xlat37) * u_xlat16_9.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat37 = min(u_xlat6.y, u_xlat6.x);
            u_xlat37 = min(u_xlat6.z, u_xlat37);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat37) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_9.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_9.x = u_xlat16_5.w + -1.0;
        u_xlat16_9.x = unity_SpecCube1_HDR.w * u_xlat16_9.x + 1.0;
        u_xlat16_9.x = log2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.y;
        u_xlat16_9.x = exp2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.x;
        u_xlat16_9.xyz = u_xlat16_5.xyz * u_xlat16_9.xxx;
        u_xlat3.xyz = vec3(u_xlat16_45) * u_xlat16_3.xyz + (-u_xlat16_9.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat16_9.xyz = u_xlat4.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
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
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat0.x + u_xlat0.x;
    u_xlat16_45 = u_xlat16_45 * u_xlat0.x + -0.5;
    u_xlat16_46 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_11;
    u_xlat16_46 = u_xlat16_45 * u_xlat16_46 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11 + 1.0;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_46;
    u_xlat12.x = u_xlat1.x * u_xlat16_45;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_45 = (-u_xlat0.x) + 1.0;
    u_xlat16_46 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_46;
    u_xlat16_45 = u_xlat16_45 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_45);
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_45 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(u_xlat16_45) + u_xlat0.xyz;
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
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 106963
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
uniform 	vec2 _Clouds_Background_Smoothstep;
uniform 	vec2 _Clouds_Background_Distortion_Panning;
uniform 	vec2 _Clouds_Background_Distortion_Tiling;
uniform 	vec2 _Clouds_Background_Distortion_Offset;
uniform 	float _Clouds_Background_Distortion_Amount;
uniform 	vec2 _Clouds_Background_Panning;
uniform 	vec2 _Clouds_Background_Tiling;
uniform 	vec2 _Clouds_Background_Offset;
uniform 	float _Emissive_Lightning_Intensity;
uniform 	vec4 _Emissive_Lightning_color;
uniform 	float _Lightning_Flash_Mask_Opacity;
uniform 	vec2 _Lightning_Flash_Mask_Panning;
uniform 	vec2 _Lightning_Flash_Mask_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_Offset;
uniform 	vec2 _Lightning_Flash_Mask_2_Panning;
uniform 	vec2 _Lightning_Flash_Mask_2_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_2_Offset;
uniform 	float _Lightning_Flash_Mask_2_Opacity;
uniform 	vec2 _Emissive_Lightning_Smoothstep;
uniform 	float _Clouds_Background_Emissive;
uniform 	vec4 _Clouds_Color_Tint_2;
uniform 	vec4 _Clouds_Color_Tint_1;
uniform 	vec2 _Clouds_Color_Tint_Smoothstep;
uniform 	vec2 _Clouds_Color_Tint_Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds_Background;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning_Flash_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Clouds_Background_Distortion_Tiling.xy + vec2(_Clouds_Background_Distortion_Offset.x, _Clouds_Background_Distortion_Offset.y);
    u_xlat0.xy = _Time.yy * vec2(_Clouds_Background_Distortion_Panning.x, _Clouds_Background_Distortion_Panning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_Texture0, u_xlat0.xy).xy;
    u_xlat10.xy = vs_TEXCOORD0.xy * _Clouds_Background_Tiling.xy + vec2(_Clouds_Background_Offset.x, _Clouds_Background_Offset.y);
    u_xlat10.xy = _Time.yy * vec2(_Clouds_Background_Panning.x, _Clouds_Background_Panning.y) + u_xlat10.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_Clouds_Background_Distortion_Amount) + u_xlat10.xy;
    u_xlat16_0.xyz = texture(_Clouds_Background, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + (-_Clouds_Background_Smoothstep.xxx);
    u_xlat0.xyz = u_xlat16_0.xyz + (-_Emissive_Lightning_Smoothstep.xxx);
    u_xlat15 = (-_Clouds_Background_Smoothstep.x) + _Clouds_Background_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat15 = (-_Emissive_Lightning_Smoothstep.x) + _Emissive_Lightning_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_Lightning_Flash_Mask_2_Tiling.x, _Lightning_Flash_Mask_2_Tiling.y) + _Lightning_Flash_Mask_2_Offset.xy;
    u_xlat2.xy = _Time.yy * _Lightning_Flash_Mask_2_Panning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Lightning_Flash_Mask, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * vec4(12.0, 8.0, 48.0, 24.0);
    u_xlat3.xz = sin(u_xlat3.xz);
    u_xlat8.xz = sin((-u_xlat3.yw));
    u_xlat15 = u_xlat3.x + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.z;
    u_xlat15 = u_xlat15 + 1.5;
    u_xlat15 = u_xlat8.z + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity));
    u_xlat15 = _Time.y + _Time.y;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.x;
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat8.x + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat3.xy = vs_TEXCOORD0.xy * _Lightning_Flash_Mask_Tiling.xy + vec2(_Lightning_Flash_Mask_Offset.x, _Lightning_Flash_Mask_Offset.y);
    u_xlat3.xy = _Time.yy * vec2(_Lightning_Flash_Mask_Panning.x, _Lightning_Flash_Mask_Panning.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_Lightning_Flash_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_3.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat15 = u_xlat15 * _Clouds_Background_Emissive;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = vec3(_Lightning_Flash_Mask_Opacity) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = vs_TEXCOORD0.y + _Clouds_Color_Tint_Offset.xxxy.w;
    u_xlat15 = u_xlat15 + (-_Clouds_Color_Tint_Smoothstep.x);
    u_xlat16 = (-_Clouds_Color_Tint_Smoothstep.x) + _Clouds_Color_Tint_Smoothstep.y;
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat15 = u_xlat15 * u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat2.xyz = (-_Clouds_Color_Tint_2.xyz) + _Clouds_Color_Tint_1.xyz;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Clouds_Color_Tint_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(_Emissive_Lightning_Intensity) * _Emissive_Lightning_color.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
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
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
uniform 	vec2 _Clouds_Background_Smoothstep;
uniform 	vec2 _Clouds_Background_Distortion_Panning;
uniform 	vec2 _Clouds_Background_Distortion_Tiling;
uniform 	vec2 _Clouds_Background_Distortion_Offset;
uniform 	float _Clouds_Background_Distortion_Amount;
uniform 	vec2 _Clouds_Background_Panning;
uniform 	vec2 _Clouds_Background_Tiling;
uniform 	vec2 _Clouds_Background_Offset;
uniform 	float _Emissive_Lightning_Intensity;
uniform 	vec4 _Emissive_Lightning_color;
uniform 	float _Lightning_Flash_Mask_Opacity;
uniform 	vec2 _Lightning_Flash_Mask_Panning;
uniform 	vec2 _Lightning_Flash_Mask_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_Offset;
uniform 	vec2 _Lightning_Flash_Mask_2_Panning;
uniform 	vec2 _Lightning_Flash_Mask_2_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_2_Offset;
uniform 	float _Lightning_Flash_Mask_2_Opacity;
uniform 	vec2 _Emissive_Lightning_Smoothstep;
uniform 	float _Clouds_Background_Emissive;
uniform 	vec4 _Clouds_Color_Tint_2;
uniform 	vec4 _Clouds_Color_Tint_1;
uniform 	vec2 _Clouds_Color_Tint_Smoothstep;
uniform 	vec2 _Clouds_Color_Tint_Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds_Background;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning_Flash_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Clouds_Background_Distortion_Tiling.xy + vec2(_Clouds_Background_Distortion_Offset.x, _Clouds_Background_Distortion_Offset.y);
    u_xlat0.xy = _Time.yy * vec2(_Clouds_Background_Distortion_Panning.x, _Clouds_Background_Distortion_Panning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_Texture0, u_xlat0.xy).xy;
    u_xlat10.xy = vs_TEXCOORD0.xy * _Clouds_Background_Tiling.xy + vec2(_Clouds_Background_Offset.x, _Clouds_Background_Offset.y);
    u_xlat10.xy = _Time.yy * vec2(_Clouds_Background_Panning.x, _Clouds_Background_Panning.y) + u_xlat10.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_Clouds_Background_Distortion_Amount) + u_xlat10.xy;
    u_xlat16_0.xyz = texture(_Clouds_Background, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + (-_Clouds_Background_Smoothstep.xxx);
    u_xlat0.xyz = u_xlat16_0.xyz + (-_Emissive_Lightning_Smoothstep.xxx);
    u_xlat15 = (-_Clouds_Background_Smoothstep.x) + _Clouds_Background_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat15 = (-_Emissive_Lightning_Smoothstep.x) + _Emissive_Lightning_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_Lightning_Flash_Mask_2_Tiling.x, _Lightning_Flash_Mask_2_Tiling.y) + _Lightning_Flash_Mask_2_Offset.xy;
    u_xlat2.xy = _Time.yy * _Lightning_Flash_Mask_2_Panning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Lightning_Flash_Mask, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * vec4(12.0, 8.0, 48.0, 24.0);
    u_xlat3.xz = sin(u_xlat3.xz);
    u_xlat8.xz = sin((-u_xlat3.yw));
    u_xlat15 = u_xlat3.x + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.z;
    u_xlat15 = u_xlat15 + 1.5;
    u_xlat15 = u_xlat8.z + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity));
    u_xlat15 = _Time.y + _Time.y;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.x;
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat8.x + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat3.xy = vs_TEXCOORD0.xy * _Lightning_Flash_Mask_Tiling.xy + vec2(_Lightning_Flash_Mask_Offset.x, _Lightning_Flash_Mask_Offset.y);
    u_xlat3.xy = _Time.yy * vec2(_Lightning_Flash_Mask_Panning.x, _Lightning_Flash_Mask_Panning.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_Lightning_Flash_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_3.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat15 = u_xlat15 * _Clouds_Background_Emissive;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = vec3(_Lightning_Flash_Mask_Opacity) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = vs_TEXCOORD0.y + _Clouds_Color_Tint_Offset.xxxy.w;
    u_xlat15 = u_xlat15 + (-_Clouds_Color_Tint_Smoothstep.x);
    u_xlat16 = (-_Clouds_Color_Tint_Smoothstep.x) + _Clouds_Color_Tint_Smoothstep.y;
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat15 = u_xlat15 * u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat2.xyz = (-_Clouds_Color_Tint_2.xyz) + _Clouds_Color_Tint_1.xyz;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Clouds_Color_Tint_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(_Emissive_Lightning_Intensity) * _Emissive_Lightning_color.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
uniform 	vec2 _Clouds_Background_Smoothstep;
uniform 	vec2 _Clouds_Background_Distortion_Panning;
uniform 	vec2 _Clouds_Background_Distortion_Tiling;
uniform 	vec2 _Clouds_Background_Distortion_Offset;
uniform 	float _Clouds_Background_Distortion_Amount;
uniform 	vec2 _Clouds_Background_Panning;
uniform 	vec2 _Clouds_Background_Tiling;
uniform 	vec2 _Clouds_Background_Offset;
uniform 	float _Emissive_Lightning_Intensity;
uniform 	vec4 _Emissive_Lightning_color;
uniform 	float _Lightning_Flash_Mask_Opacity;
uniform 	vec2 _Lightning_Flash_Mask_Panning;
uniform 	vec2 _Lightning_Flash_Mask_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_Offset;
uniform 	vec2 _Lightning_Flash_Mask_2_Panning;
uniform 	vec2 _Lightning_Flash_Mask_2_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_2_Offset;
uniform 	float _Lightning_Flash_Mask_2_Opacity;
uniform 	vec2 _Emissive_Lightning_Smoothstep;
uniform 	float _Clouds_Background_Emissive;
uniform 	vec4 _Clouds_Color_Tint_2;
uniform 	vec4 _Clouds_Color_Tint_1;
uniform 	vec2 _Clouds_Color_Tint_Smoothstep;
uniform 	vec2 _Clouds_Color_Tint_Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds_Background;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning_Flash_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Clouds_Background_Distortion_Tiling.xy + vec2(_Clouds_Background_Distortion_Offset.x, _Clouds_Background_Distortion_Offset.y);
    u_xlat0.xy = _Time.yy * vec2(_Clouds_Background_Distortion_Panning.x, _Clouds_Background_Distortion_Panning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_Texture0, u_xlat0.xy).xy;
    u_xlat10.xy = vs_TEXCOORD0.xy * _Clouds_Background_Tiling.xy + vec2(_Clouds_Background_Offset.x, _Clouds_Background_Offset.y);
    u_xlat10.xy = _Time.yy * vec2(_Clouds_Background_Panning.x, _Clouds_Background_Panning.y) + u_xlat10.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_Clouds_Background_Distortion_Amount) + u_xlat10.xy;
    u_xlat16_0.xyz = texture(_Clouds_Background, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + (-_Clouds_Background_Smoothstep.xxx);
    u_xlat0.xyz = u_xlat16_0.xyz + (-_Emissive_Lightning_Smoothstep.xxx);
    u_xlat15 = (-_Clouds_Background_Smoothstep.x) + _Clouds_Background_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat15 = (-_Emissive_Lightning_Smoothstep.x) + _Emissive_Lightning_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_Lightning_Flash_Mask_2_Tiling.x, _Lightning_Flash_Mask_2_Tiling.y) + _Lightning_Flash_Mask_2_Offset.xy;
    u_xlat2.xy = _Time.yy * _Lightning_Flash_Mask_2_Panning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Lightning_Flash_Mask, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * vec4(12.0, 8.0, 48.0, 24.0);
    u_xlat3.xz = sin(u_xlat3.xz);
    u_xlat8.xz = sin((-u_xlat3.yw));
    u_xlat15 = u_xlat3.x + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.z;
    u_xlat15 = u_xlat15 + 1.5;
    u_xlat15 = u_xlat8.z + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity));
    u_xlat15 = _Time.y + _Time.y;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.x;
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat8.x + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat3.xy = vs_TEXCOORD0.xy * _Lightning_Flash_Mask_Tiling.xy + vec2(_Lightning_Flash_Mask_Offset.x, _Lightning_Flash_Mask_Offset.y);
    u_xlat3.xy = _Time.yy * vec2(_Lightning_Flash_Mask_Panning.x, _Lightning_Flash_Mask_Panning.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_Lightning_Flash_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_3.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat15 = u_xlat15 * _Clouds_Background_Emissive;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = vec3(_Lightning_Flash_Mask_Opacity) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = vs_TEXCOORD0.y + _Clouds_Color_Tint_Offset.xxxy.w;
    u_xlat15 = u_xlat15 + (-_Clouds_Color_Tint_Smoothstep.x);
    u_xlat16 = (-_Clouds_Color_Tint_Smoothstep.x) + _Clouds_Color_Tint_Smoothstep.y;
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat15 = u_xlat15 * u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat2.xyz = (-_Clouds_Color_Tint_2.xyz) + _Clouds_Color_Tint_1.xyz;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Clouds_Color_Tint_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(_Emissive_Lightning_Intensity) * _Emissive_Lightning_color.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz;
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
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
uniform 	vec2 _Clouds_Background_Smoothstep;
uniform 	vec2 _Clouds_Background_Distortion_Panning;
uniform 	vec2 _Clouds_Background_Distortion_Tiling;
uniform 	vec2 _Clouds_Background_Distortion_Offset;
uniform 	float _Clouds_Background_Distortion_Amount;
uniform 	vec2 _Clouds_Background_Panning;
uniform 	vec2 _Clouds_Background_Tiling;
uniform 	vec2 _Clouds_Background_Offset;
uniform 	float _Emissive_Lightning_Intensity;
uniform 	vec4 _Emissive_Lightning_color;
uniform 	float _Lightning_Flash_Mask_Opacity;
uniform 	vec2 _Lightning_Flash_Mask_Panning;
uniform 	vec2 _Lightning_Flash_Mask_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_Offset;
uniform 	vec2 _Lightning_Flash_Mask_2_Panning;
uniform 	vec2 _Lightning_Flash_Mask_2_Tiling;
uniform 	vec2 _Lightning_Flash_Mask_2_Offset;
uniform 	float _Lightning_Flash_Mask_2_Opacity;
uniform 	vec2 _Emissive_Lightning_Smoothstep;
uniform 	float _Clouds_Background_Emissive;
uniform 	vec4 _Clouds_Color_Tint_2;
uniform 	vec4 _Clouds_Color_Tint_1;
uniform 	vec2 _Clouds_Color_Tint_Smoothstep;
uniform 	vec2 _Clouds_Color_Tint_Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds_Background;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning_Flash_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Clouds_Background_Distortion_Tiling.xy + vec2(_Clouds_Background_Distortion_Offset.x, _Clouds_Background_Distortion_Offset.y);
    u_xlat0.xy = _Time.yy * vec2(_Clouds_Background_Distortion_Panning.x, _Clouds_Background_Distortion_Panning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_Texture0, u_xlat0.xy).xy;
    u_xlat10.xy = vs_TEXCOORD0.xy * _Clouds_Background_Tiling.xy + vec2(_Clouds_Background_Offset.x, _Clouds_Background_Offset.y);
    u_xlat10.xy = _Time.yy * vec2(_Clouds_Background_Panning.x, _Clouds_Background_Panning.y) + u_xlat10.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_Clouds_Background_Distortion_Amount) + u_xlat10.xy;
    u_xlat16_0.xyz = texture(_Clouds_Background, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + (-_Clouds_Background_Smoothstep.xxx);
    u_xlat0.xyz = u_xlat16_0.xyz + (-_Emissive_Lightning_Smoothstep.xxx);
    u_xlat15 = (-_Clouds_Background_Smoothstep.x) + _Clouds_Background_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat15 = (-_Emissive_Lightning_Smoothstep.x) + _Emissive_Lightning_Smoothstep.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_Lightning_Flash_Mask_2_Tiling.x, _Lightning_Flash_Mask_2_Tiling.y) + _Lightning_Flash_Mask_2_Offset.xy;
    u_xlat2.xy = _Time.yy * _Lightning_Flash_Mask_2_Panning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Lightning_Flash_Mask, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * vec4(12.0, 8.0, 48.0, 24.0);
    u_xlat3.xz = sin(u_xlat3.xz);
    u_xlat8.xz = sin((-u_xlat3.yw));
    u_xlat15 = u_xlat3.x + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.z;
    u_xlat15 = u_xlat15 + 1.5;
    u_xlat15 = u_xlat8.z + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity, _Lightning_Flash_Mask_2_Opacity));
    u_xlat15 = _Time.y + _Time.y;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat15 + u_xlat3.x;
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat8.x + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat3.xy = vs_TEXCOORD0.xy * _Lightning_Flash_Mask_Tiling.xy + vec2(_Lightning_Flash_Mask_Offset.x, _Lightning_Flash_Mask_Offset.y);
    u_xlat3.xy = _Time.yy * vec2(_Lightning_Flash_Mask_Panning.x, _Lightning_Flash_Mask_Panning.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_Lightning_Flash_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = (-u_xlat16_3.xyz) + vec3(0.710000038, 0.710000038, 0.710000038);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.4084506, 1.4084506, 1.4084506);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat15 = u_xlat15 * _Clouds_Background_Emissive;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = vec3(_Lightning_Flash_Mask_Opacity) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = vs_TEXCOORD0.y + _Clouds_Color_Tint_Offset.xxxy.w;
    u_xlat15 = u_xlat15 + (-_Clouds_Color_Tint_Smoothstep.x);
    u_xlat16 = (-_Clouds_Color_Tint_Smoothstep.x) + _Clouds_Color_Tint_Smoothstep.y;
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat15 = u_xlat15 * u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat2.xyz = (-_Clouds_Color_Tint_2.xyz) + _Clouds_Color_Tint_1.xyz;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Clouds_Color_Tint_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(_Emissive_Lightning_Intensity) * _Emissive_Lightning_color.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz;
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