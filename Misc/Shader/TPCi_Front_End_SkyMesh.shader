//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Front_End/SkyMesh" {
Properties {
_Color0 ("Color 0", Color) = (0.3607843,0.8,0.6431373,0)
_T_Direction_RGB_Random ("T_Direction_RGB_Random", 2D) = "white" { }
_Color1 ("Color 1", Color) = (0.01176468,0.207671,0.8313726,0)
_T_noise_dots ("T_noise_dots", 2D) = "white" { }
_StarsTexture ("Stars Texture", 2D) = "white" { }
_HolofoilSpectrumTexture ("Holofoil Spectrum Texture", 2D) = "white" { }
_RChannelParallaxOffset ("R Channel Parallax Offset", Float) = -0.01
_GChannelParallaxOffset ("G Channel Parallax Offset", Float) = 0.01
_BChannelParallaxOffset ("B Channel Parallax Offset", Float) = 0.01
_AChannelParallaxOffset ("A Channel Parallax Offset", Float) = 0.01
_pow ("pow", Float) = 1
_Subtract ("Subtract", Float) = 0.5
_texturetiling ("texture tiling", Vector) = (2,2,0,0)
_DirectionTiling ("Direction Tiling", Vector) = (2,2,0,0)
_ObjectMotion ("Object Motion", Float) = 6
_HolofoilVewMovementIntensity ("Holofoil Vew Movement Intensity", Float) = 1
_MaskCameraMovementIntensity ("Mask Camera Movement Intensity", Float) = 0.1
_RChannelSpectrumTiling ("R Channel Spectrum Tiling", Vector) = (2,2,0,0)
_RChannelSpectrumOffsetScooch ("R Channel Spectrum Offset Scooch", Vector) = (0,0,0,0)
_GChannelSpectrumTiling ("G Channel Spectrum Tiling", Vector) = (2.5,2,0,0)
_GChannelSpectrumOffsetScooch ("G Channel Spectrum Offset Scooch", Vector) = (0,0,0,0)
_BChannelSpectrumTiling ("B Channel Spectrum Tiling", Vector) = (2.5,2,0,0)
_BChannelSpectrumOffsetScooch ("B Channel Spectrum Offset Scooch", Vector) = (0,0,0,0)
_AChannelSpectrumTiling ("A Channel Spectrum Tiling", Vector) = (1,1,0,0)
_AChannelSpectrumOffsetScooch ("A Channel Spectrum Offset Scooch", Vector) = (0,0,0,0)
_RChannelSpectrumMovementIntensity ("R Channel Spectrum Movement Intensity", Float) = 1
_GChannelSpectrumMovementIntensity ("G Channel Spectrum Movement Intensity", Float) = 1.3
_BChannelSpectrumMovementIntensity ("B Channel Spectrum Movement Intensity", Float) = 1.3
_AChannelSpectrumMovementInensity ("A Channel Spectrum Movement Inensity", Float) = 1.3
_FoilBackgroundColor ("Foil Background Color", Color) = (0,0,0,0)
_RChannelNonFoilColor ("R Channel NonFoil Color", Color) = (0.5660378,0.5660378,0.5660378,0)
_RChannelTiling ("R Channel Tiling", Vector) = (2,2,0,0)
_RChannelOffsetScooch ("R Channel Offset Scooch", Vector) = (0,0,0,0)
_GChannelTiling ("G Channel Tiling", Vector) = (2,2,0,0)
_GChannelOffsetScooch ("G Channel Offset Scooch", Vector) = (0,0,0,0)
_BChannelTiling ("B Channel Tiling", Vector) = (2,2,0,0)
_BChannelOffsetScooch ("B Channel Offset Scooch", Vector) = (0,0,0,0)
_AChannelTiling ("A Channel Tiling", Vector) = (2,2,0,0)
_AChannelOffsetScooch ("A Channel Offset Scooch", Vector) = (0,0,0,0)
_MaskPower ("Mask Power", Float) = 3
_ColorIntensityAfterMasking ("Color Intensity (After Masking)", Float) = 1.2
_FresnelAmount ("Fresnel Amount", Float) = 0.1
_MaskGTiling ("Mask G Tiling", Vector) = (1,1,0,0)
_MaskRTiling ("Mask R Tiling", Vector) = (1,1,0,0)
_MaskBTiling ("Mask B Tiling", Vector) = (1,1,0,0)
_ColorMaskPower ("Color Mask Power", Float) = 2
_MaskTexture ("Mask Texture", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 35345
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _ColorMaskPower;
uniform 	vec2 _MaskRTiling;
uniform 	vec2 _MaskGTiling;
uniform 	vec2 _MaskBTiling;
uniform 	vec4 _RChannelNonFoilColor;
uniform 	vec2 _RChannelSpectrumTiling;
uniform 	float _RChannelSpectrumMovementIntensity;
uniform 	vec2 _RChannelSpectrumOffsetScooch;
uniform 	float _ColorIntensityAfterMasking;
uniform 	float _FresnelAmount;
uniform 	vec2 _texturetiling;
uniform 	float _HolofoilVewMovementIntensity;
uniform 	float _ObjectMotion;
uniform 	vec2 _DirectionTiling;
uniform 	float _pow;
uniform 	float _Subtract;
uniform 	float _MaskCameraMovementIntensity;
uniform 	float _MaskPower;
uniform 	vec2 _RChannelTiling;
uniform 	vec2 _RChannelOffsetScooch;
uniform 	float _RChannelParallaxOffset;
uniform 	vec2 _GChannelTiling;
uniform 	vec2 _GChannelOffsetScooch;
uniform 	float _GChannelParallaxOffset;
uniform 	vec2 _GChannelSpectrumTiling;
uniform 	float _GChannelSpectrumMovementIntensity;
uniform 	vec2 _GChannelSpectrumOffsetScooch;
uniform 	vec2 _BChannelSpectrumTiling;
uniform 	float _BChannelSpectrumMovementIntensity;
uniform 	vec2 _BChannelSpectrumOffsetScooch;
uniform 	vec2 _BChannelTiling;
uniform 	vec2 _BChannelOffsetScooch;
uniform 	float _BChannelParallaxOffset;
uniform 	vec2 _AChannelSpectrumTiling;
uniform 	float _AChannelSpectrumMovementInensity;
uniform 	vec2 _AChannelSpectrumOffsetScooch;
uniform 	vec2 _AChannelTiling;
uniform 	vec2 _AChannelOffsetScooch;
uniform 	float _AChannelParallaxOffset;
uniform 	vec4 _FoilBackgroundColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_Direction_RGB_Random;
UNITY_LOCATION(2) uniform mediump sampler2D _T_noise_dots;
UNITY_LOCATION(3) uniform mediump sampler2D _HolofoilSpectrumTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _StarsTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
mediump vec2 u_xlat16_16;
float u_xlat20;
mediump float u_xlat16_20;
vec2 u_xlat22;
mediump float u_xlat16_22;
float u_xlat30;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
float u_xlat33;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat1.x = vs_TEXCOORD1.z;
    u_xlat1.y = vs_TEXCOORD2.z;
    u_xlat1.z = vs_TEXCOORD3.z;
    u_xlat30 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat30 = (-u_xlat30) + 1.0;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * 0.74000001;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = u_xlat30 + 0.129999995;
    u_xlat30 = (-u_xlat30) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * vs_TEXCOORD3.xxx + u_xlat1.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * vs_TEXCOORD1.yyy + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * vs_TEXCOORD3.yyy + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_ObjectMotion, _ObjectMotion, _ObjectMotion));
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.z = vs_TEXCOORD3.y;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat2.x = vs_TEXCOORD1.y;
    u_xlat2.y = vs_TEXCOORD2.y;
    u_xlat3.x = vs_TEXCOORD1.x;
    u_xlat3.y = vs_TEXCOORD2.x;
    u_xlat4.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_HolofoilVewMovementIntensity, _HolofoilVewMovementIntensity, _HolofoilVewMovementIntensity)) + u_xlat1.xyz;
    u_xlat22.xy = _Time.yy * vec2(0.25, 0.0174532924);
    u_xlat3.xy = vs_TEXCOORD0.xy * _DirectionTiling.xy + u_xlat22.xx;
    u_xlat4.x = sin(u_xlat22.y);
    u_xlat5.x = cos(u_xlat22.y);
    u_xlat16_3.xyz = texture(_T_Direction_RGB_Random, u_xlat3.xy).xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_3.xyz);
    u_xlat1.x = u_xlat1.x * _pow;
    u_xlat1.xy = vs_TEXCOORD0.xy * _texturetiling.xy + u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy + (-vec2(vec2(_Subtract, _Subtract)));
    u_xlat1.xy = u_xlat2.xy * vec2(_MaskCameraMovementIntensity) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_noise_dots, u_xlat1.xy).xyz;
    u_xlat1.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat30 = u_xlat30 * _FresnelAmount + u_xlat1.x;
    u_xlat11 = log2(u_xlat1.x);
    u_xlat11 = u_xlat11 * _MaskPower;
    u_xlat11 = exp2(u_xlat11);
    u_xlat30 = u_xlat30 * u_xlat1.x + u_xlat11;
    u_xlat1.xy = u_xlat2.xy * vec2(vec2(_GChannelSpectrumMovementIntensity, _GChannelSpectrumMovementIntensity)) + _GChannelSpectrumOffsetScooch.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_GChannelSpectrumTiling.x, _GChannelSpectrumTiling.y) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.xy, vec2(0.707106769, 0.707106769));
    u_xlat3.y = dot(u_xlat1.xy, vec2(-0.707106769, 0.707106769));
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_HolofoilSpectrumTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) + (-_RChannelNonFoilColor.xyz);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz + _RChannelNonFoilColor.xyz;
    u_xlat16_6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_6 = inversesqrt(u_xlat16_6);
    u_xlat16_16.xy = u_xlat0.xy * vec2(u_xlat16_6);
    u_xlat0.x = u_xlat0.z * u_xlat16_6 + 0.419999987;
    u_xlat0.xy = u_xlat16_16.xy / u_xlat0.xx;
    u_xlat22.xy = vs_TEXCOORD0.xy * _GChannelTiling.xy + vec2(_GChannelOffsetScooch.x, _GChannelOffsetScooch.y);
    u_xlat16_6 = _GChannelParallaxOffset * 0.5;
    u_xlat22.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat4.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat4.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_20 = texture(_StarsTexture, u_xlat22.xy).y;
    u_xlat22.xy = vs_TEXCOORD0.xy * vec2(_RChannelTiling.x, _RChannelTiling.y) + _RChannelOffsetScooch.xy;
    u_xlat16_6 = _RChannelParallaxOffset * 0.5;
    u_xlat22.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat4.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_31 = texture(_StarsTexture, u_xlat22.xy).x;
    u_xlat22.x = (-u_xlat16_31) + 1.0;
    u_xlat32 = u_xlat16_20 * u_xlat22.x;
    u_xlat20 = u_xlat22.x * u_xlat16_20 + u_xlat16_31;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32);
    u_xlat22.xy = u_xlat2.xy * vec2(vec2(_RChannelSpectrumMovementIntensity, _RChannelSpectrumMovementIntensity)) + _RChannelSpectrumOffsetScooch.xy;
    u_xlat22.xy = vs_TEXCOORD0.xy * _RChannelSpectrumTiling.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat22.xy, vec2(0.707106769, -0.707106769));
    u_xlat3.y = dot(u_xlat22.xy, vec2(0.707106769, 0.707106769));
    u_xlat22.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xyz = texture(_HolofoilSpectrumTexture, u_xlat22.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) + (-_RChannelNonFoilColor.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + _RChannelNonFoilColor.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat16_31) + u_xlat1.xyz;
    u_xlat22.xy = u_xlat2.xy * vec2(_BChannelSpectrumMovementIntensity) + vec2(_BChannelSpectrumOffsetScooch.x, _BChannelSpectrumOffsetScooch.y);
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_AChannelSpectrumMovementInensity, _AChannelSpectrumMovementInensity)) + _AChannelSpectrumOffsetScooch.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_AChannelSpectrumTiling.x, _AChannelSpectrumTiling.y) + u_xlat2.xy;
    u_xlat2.zw = vs_TEXCOORD0.xy * vec2(_BChannelSpectrumTiling.x, _BChannelSpectrumTiling.y) + u_xlat22.xy;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.x = dot(u_xlat2.zw, vec2(0.5, 0.866025388));
    u_xlat3.y = dot(u_xlat2.zw, vec2(-0.866025388, 0.5));
    u_xlat22.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xyz = texture(_HolofoilSpectrumTexture, u_xlat22.xy).xyz;
    u_xlat3.xyz = vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) * u_xlat16_3.xyz + (-_RChannelNonFoilColor.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + _RChannelNonFoilColor.xyz;
    u_xlat31 = (-u_xlat20) + 1.0;
    u_xlat22.xy = vs_TEXCOORD0.xy * _BChannelTiling.xy + vec2(_BChannelOffsetScooch.x, _BChannelOffsetScooch.y);
    u_xlat16_6 = _BChannelParallaxOffset * 0.5;
    u_xlat22.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat33 = (-_Time.y) + 1.0;
    u_xlat4.xy = vec2(u_xlat33) * vec2(0.0261799395, 0.0349065848);
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7 = sin(u_xlat4.y);
    u_xlat8 = cos(u_xlat4.y);
    u_xlat9.z = u_xlat4.x;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat22.xy, u_xlat9.xy);
    u_xlat4.x = dot(u_xlat22.xy, u_xlat9.yz);
    u_xlat22.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_22 = texture(_StarsTexture, u_xlat22.xy).z;
    u_xlat32 = u_xlat31 * u_xlat16_22;
    u_xlat20 = u_xlat31 * u_xlat16_22 + u_xlat20;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat32) + u_xlat1.xyz;
    u_xlat3.x = dot(u_xlat2.xy, vec2(6.12323426e-17, 1.0));
    u_xlat3.y = dot(u_xlat2.xy, vec2(-1.0, 6.12323426e-17));
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_HolofoilSpectrumTexture, u_xlat2.xy).xyz;
    u_xlat2.xyz = vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) * u_xlat16_2.xyz + (-_RChannelNonFoilColor.xyz);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz + _RChannelNonFoilColor.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_AChannelTiling.x, _AChannelTiling.y) + _AChannelOffsetScooch.xy;
    u_xlat16_6 = _AChannelParallaxOffset * 0.5;
    u_xlat0.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.z = u_xlat7;
    u_xlat3.y = u_xlat8;
    u_xlat3.x = (-u_xlat7);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_StarsTexture, u_xlat0.xy).w;
    u_xlat10 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat10 * u_xlat16_0 + u_xlat20;
    u_xlat0.x = u_xlat16_0 * u_xlat10;
    u_xlat0.xyw = u_xlat2.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat0.xyz = vec3(u_xlat20) * _FoilBackgroundColor.xyz + u_xlat0.xyw;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskGTiling.xy + vec2(-0.5, -0.5);
    u_xlat2 = _Time.yyyy * vec4(0.0250000004, -0.0250000004, 0.0349065848, 0.00999999978);
    u_xlat3.x = sin(u_xlat2.z);
    u_xlat4.x = cos(u_xlat2.z);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.y = texture(_MaskTexture, u_xlat1.xy).y;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_MaskRTiling.x, _MaskRTiling.y) + u_xlat2.xy;
    u_xlat22.xy = vs_TEXCOORD0.xy * vec2(_MaskBTiling.x, _MaskBTiling.y) + u_xlat2.ww;
    u_xlat1.z = texture(_MaskTexture, u_xlat22.xy).z;
    u_xlat1.x = texture(_MaskTexture, u_xlat2.xy).x;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat30 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * _ColorMaskPower;
    u_xlat30 = exp2(u_xlat30);
    u_xlat1.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz + _Color1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat1.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _ColorMaskPower;
uniform 	vec2 _MaskRTiling;
uniform 	vec2 _MaskGTiling;
uniform 	vec2 _MaskBTiling;
uniform 	vec4 _RChannelNonFoilColor;
uniform 	vec2 _RChannelSpectrumTiling;
uniform 	float _RChannelSpectrumMovementIntensity;
uniform 	vec2 _RChannelSpectrumOffsetScooch;
uniform 	float _ColorIntensityAfterMasking;
uniform 	float _FresnelAmount;
uniform 	vec2 _texturetiling;
uniform 	float _HolofoilVewMovementIntensity;
uniform 	float _ObjectMotion;
uniform 	vec2 _DirectionTiling;
uniform 	float _pow;
uniform 	float _Subtract;
uniform 	float _MaskCameraMovementIntensity;
uniform 	float _MaskPower;
uniform 	vec2 _RChannelTiling;
uniform 	vec2 _RChannelOffsetScooch;
uniform 	float _RChannelParallaxOffset;
uniform 	vec2 _GChannelTiling;
uniform 	vec2 _GChannelOffsetScooch;
uniform 	float _GChannelParallaxOffset;
uniform 	vec2 _GChannelSpectrumTiling;
uniform 	float _GChannelSpectrumMovementIntensity;
uniform 	vec2 _GChannelSpectrumOffsetScooch;
uniform 	vec2 _BChannelSpectrumTiling;
uniform 	float _BChannelSpectrumMovementIntensity;
uniform 	vec2 _BChannelSpectrumOffsetScooch;
uniform 	vec2 _BChannelTiling;
uniform 	vec2 _BChannelOffsetScooch;
uniform 	float _BChannelParallaxOffset;
uniform 	vec2 _AChannelSpectrumTiling;
uniform 	float _AChannelSpectrumMovementInensity;
uniform 	vec2 _AChannelSpectrumOffsetScooch;
uniform 	vec2 _AChannelTiling;
uniform 	vec2 _AChannelOffsetScooch;
uniform 	float _AChannelParallaxOffset;
uniform 	vec4 _FoilBackgroundColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_Direction_RGB_Random;
UNITY_LOCATION(2) uniform mediump sampler2D _T_noise_dots;
UNITY_LOCATION(3) uniform mediump sampler2D _HolofoilSpectrumTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _StarsTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
mediump vec2 u_xlat16_16;
float u_xlat20;
mediump float u_xlat16_20;
vec2 u_xlat22;
mediump float u_xlat16_22;
float u_xlat30;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
float u_xlat33;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat1.x = vs_TEXCOORD1.z;
    u_xlat1.y = vs_TEXCOORD2.z;
    u_xlat1.z = vs_TEXCOORD3.z;
    u_xlat30 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat30 = (-u_xlat30) + 1.0;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * 0.74000001;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = u_xlat30 + 0.129999995;
    u_xlat30 = (-u_xlat30) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * vs_TEXCOORD3.xxx + u_xlat1.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * vs_TEXCOORD1.yyy + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * vs_TEXCOORD3.yyy + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_ObjectMotion, _ObjectMotion, _ObjectMotion));
    u_xlat2.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.z = vs_TEXCOORD3.y;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat2.x = vs_TEXCOORD1.y;
    u_xlat2.y = vs_TEXCOORD2.y;
    u_xlat3.x = vs_TEXCOORD1.x;
    u_xlat3.y = vs_TEXCOORD2.x;
    u_xlat4.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat3.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_HolofoilVewMovementIntensity, _HolofoilVewMovementIntensity, _HolofoilVewMovementIntensity)) + u_xlat1.xyz;
    u_xlat22.xy = _Time.yy * vec2(0.25, 0.0174532924);
    u_xlat3.xy = vs_TEXCOORD0.xy * _DirectionTiling.xy + u_xlat22.xx;
    u_xlat4.x = sin(u_xlat22.y);
    u_xlat5.x = cos(u_xlat22.y);
    u_xlat16_3.xyz = texture(_T_Direction_RGB_Random, u_xlat3.xy).xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_3.xyz);
    u_xlat1.x = u_xlat1.x * _pow;
    u_xlat1.xy = vs_TEXCOORD0.xy * _texturetiling.xy + u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy + (-vec2(vec2(_Subtract, _Subtract)));
    u_xlat1.xy = u_xlat2.xy * vec2(_MaskCameraMovementIntensity) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_noise_dots, u_xlat1.xy).xyz;
    u_xlat1.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat30 = u_xlat30 * _FresnelAmount + u_xlat1.x;
    u_xlat11 = log2(u_xlat1.x);
    u_xlat11 = u_xlat11 * _MaskPower;
    u_xlat11 = exp2(u_xlat11);
    u_xlat30 = u_xlat30 * u_xlat1.x + u_xlat11;
    u_xlat1.xy = u_xlat2.xy * vec2(vec2(_GChannelSpectrumMovementIntensity, _GChannelSpectrumMovementIntensity)) + _GChannelSpectrumOffsetScooch.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_GChannelSpectrumTiling.x, _GChannelSpectrumTiling.y) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.xy, vec2(0.707106769, 0.707106769));
    u_xlat3.y = dot(u_xlat1.xy, vec2(-0.707106769, 0.707106769));
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_HolofoilSpectrumTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) + (-_RChannelNonFoilColor.xyz);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz + _RChannelNonFoilColor.xyz;
    u_xlat16_6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_6 = inversesqrt(u_xlat16_6);
    u_xlat16_16.xy = u_xlat0.xy * vec2(u_xlat16_6);
    u_xlat0.x = u_xlat0.z * u_xlat16_6 + 0.419999987;
    u_xlat0.xy = u_xlat16_16.xy / u_xlat0.xx;
    u_xlat22.xy = vs_TEXCOORD0.xy * _GChannelTiling.xy + vec2(_GChannelOffsetScooch.x, _GChannelOffsetScooch.y);
    u_xlat16_6 = _GChannelParallaxOffset * 0.5;
    u_xlat22.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat4.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat4.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_20 = texture(_StarsTexture, u_xlat22.xy).y;
    u_xlat22.xy = vs_TEXCOORD0.xy * vec2(_RChannelTiling.x, _RChannelTiling.y) + _RChannelOffsetScooch.xy;
    u_xlat16_6 = _RChannelParallaxOffset * 0.5;
    u_xlat22.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat4.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_31 = texture(_StarsTexture, u_xlat22.xy).x;
    u_xlat22.x = (-u_xlat16_31) + 1.0;
    u_xlat32 = u_xlat16_20 * u_xlat22.x;
    u_xlat20 = u_xlat22.x * u_xlat16_20 + u_xlat16_31;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32);
    u_xlat22.xy = u_xlat2.xy * vec2(vec2(_RChannelSpectrumMovementIntensity, _RChannelSpectrumMovementIntensity)) + _RChannelSpectrumOffsetScooch.xy;
    u_xlat22.xy = vs_TEXCOORD0.xy * _RChannelSpectrumTiling.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat22.xy, vec2(0.707106769, -0.707106769));
    u_xlat3.y = dot(u_xlat22.xy, vec2(0.707106769, 0.707106769));
    u_xlat22.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xyz = texture(_HolofoilSpectrumTexture, u_xlat22.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) + (-_RChannelNonFoilColor.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + _RChannelNonFoilColor.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat16_31) + u_xlat1.xyz;
    u_xlat22.xy = u_xlat2.xy * vec2(_BChannelSpectrumMovementIntensity) + vec2(_BChannelSpectrumOffsetScooch.x, _BChannelSpectrumOffsetScooch.y);
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_AChannelSpectrumMovementInensity, _AChannelSpectrumMovementInensity)) + _AChannelSpectrumOffsetScooch.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_AChannelSpectrumTiling.x, _AChannelSpectrumTiling.y) + u_xlat2.xy;
    u_xlat2.zw = vs_TEXCOORD0.xy * vec2(_BChannelSpectrumTiling.x, _BChannelSpectrumTiling.y) + u_xlat22.xy;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.x = dot(u_xlat2.zw, vec2(0.5, 0.866025388));
    u_xlat3.y = dot(u_xlat2.zw, vec2(-0.866025388, 0.5));
    u_xlat22.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xyz = texture(_HolofoilSpectrumTexture, u_xlat22.xy).xyz;
    u_xlat3.xyz = vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) * u_xlat16_3.xyz + (-_RChannelNonFoilColor.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + _RChannelNonFoilColor.xyz;
    u_xlat31 = (-u_xlat20) + 1.0;
    u_xlat22.xy = vs_TEXCOORD0.xy * _BChannelTiling.xy + vec2(_BChannelOffsetScooch.x, _BChannelOffsetScooch.y);
    u_xlat16_6 = _BChannelParallaxOffset * 0.5;
    u_xlat22.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat33 = (-_Time.y) + 1.0;
    u_xlat4.xy = vec2(u_xlat33) * vec2(0.0261799395, 0.0349065848);
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7 = sin(u_xlat4.y);
    u_xlat8 = cos(u_xlat4.y);
    u_xlat9.z = u_xlat4.x;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat22.xy, u_xlat9.xy);
    u_xlat4.x = dot(u_xlat22.xy, u_xlat9.yz);
    u_xlat22.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_22 = texture(_StarsTexture, u_xlat22.xy).z;
    u_xlat32 = u_xlat31 * u_xlat16_22;
    u_xlat20 = u_xlat31 * u_xlat16_22 + u_xlat20;
    u_xlat1.xyz = u_xlat3.xyz * vec3(u_xlat32) + u_xlat1.xyz;
    u_xlat3.x = dot(u_xlat2.xy, vec2(6.12323426e-17, 1.0));
    u_xlat3.y = dot(u_xlat2.xy, vec2(-1.0, 6.12323426e-17));
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_HolofoilSpectrumTexture, u_xlat2.xy).xyz;
    u_xlat2.xyz = vec3(vec3(_ColorIntensityAfterMasking, _ColorIntensityAfterMasking, _ColorIntensityAfterMasking)) * u_xlat16_2.xyz + (-_RChannelNonFoilColor.xyz);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz + _RChannelNonFoilColor.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_AChannelTiling.x, _AChannelTiling.y) + _AChannelOffsetScooch.xy;
    u_xlat16_6 = _AChannelParallaxOffset * 0.5;
    u_xlat0.xy = (-vec2(u_xlat16_6)) * u_xlat0.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.z = u_xlat7;
    u_xlat3.y = u_xlat8;
    u_xlat3.x = (-u_xlat7);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_StarsTexture, u_xlat0.xy).w;
    u_xlat10 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat10 * u_xlat16_0 + u_xlat20;
    u_xlat0.x = u_xlat16_0 * u_xlat10;
    u_xlat0.xyw = u_xlat2.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat0.xyz = vec3(u_xlat20) * _FoilBackgroundColor.xyz + u_xlat0.xyw;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskGTiling.xy + vec2(-0.5, -0.5);
    u_xlat2 = _Time.yyyy * vec4(0.0250000004, -0.0250000004, 0.0349065848, 0.00999999978);
    u_xlat3.x = sin(u_xlat2.z);
    u_xlat4.x = cos(u_xlat2.z);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.y = texture(_MaskTexture, u_xlat1.xy).y;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_MaskRTiling.x, _MaskRTiling.y) + u_xlat2.xy;
    u_xlat22.xy = vs_TEXCOORD0.xy * vec2(_MaskBTiling.x, _MaskBTiling.y) + u_xlat2.ww;
    u_xlat1.z = texture(_MaskTexture, u_xlat22.xy).z;
    u_xlat1.x = texture(_MaskTexture, u_xlat2.xy).x;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat30 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * _ColorMaskPower;
    u_xlat30 = exp2(u_xlat30);
    u_xlat1.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat1.xyz + _Color1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat1.xyz;
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