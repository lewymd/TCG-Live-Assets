//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/EnergySphere_Master" {
Properties {
_EnergySphereTexture ("Energy Sphere Texture", 2D) = "white" { }
_MainColor ("Main Color", Color) = (0.8588235,0.6196079,0.2705882,0)
_FresnelColor ("Fresnel Color", Color) = (1,1,1,0)
_ShadowColor ("Shadow Color", Color) = (0.6415094,0.4236988,0.1059096,0)
_EmissionAmount ("Emission Amount", Float) = 0.25
_IconScaling ("Icon Scaling", Vector) = (1,1,0,0)
_IconOffset ("Icon Offset", Vector) = (0,0,0,0)
_IconParallaxOffset ("Icon Parallax Offset", Float) = 0.1
_HighlightsScaling ("Highlights Scaling", Vector) = (1,1,0,0)
_HighlightsOffset ("Highlights Offset", Vector) = (0,0,0,0)
_HighlightsParallaxOffset ("Highlights Parallax Offset", Float) = 0.1
_ReflectionEffectTexture ("Reflection Effect Texture", 2D) = "white" { }
_ReflectionTextureTiling ("Reflection Texture Tiling", Vector) = (2,2,0,0)
_ReflectionTextureOffset ("Reflection Texture Offset", Float) = 0
_ReflectionTexturePanning ("Reflection Texture Panning", Vector) = (-1,-0.15,0,0)
_ReflectionEffectColor ("Reflection Effect Color", Color) = (0.764151,0.3810839,0.06848521,0)
_ReflectionEffectIntensity ("Reflection Effect Intensity", Float) = 0.25
_ReflectionEffectDistortionTexture ("Reflection Effect Distortion Texture", 2D) = "white" { }
_ReflectionEffectDistortionTiling ("Reflection Effect Distortion Tiling", Vector) = (1,1,0,0)
_ReflectionEffectDistortionOffset ("Reflection Effect Distortion Offset", Vector) = (0,0,0,0)
_ReflectionEffectDistortionPanning ("Reflection Effect Distortion Panning", Vector) = (0,0,0,0)
_ReflectionEffectDistortionAmount ("Reflection Effect Distortion Amount", Float) = 0.1
_IconColor ("Icon Color", Color) = (0,0,0,0)
_IconColorBrightness ("Icon Color Brightness", Range(0, 10)) = 1
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 6036
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
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	vec2 _HighlightsScaling;
uniform 	vec2 _HighlightsOffset;
uniform 	float _HighlightsParallaxOffset;
uniform 	vec4 _MainColor;
uniform 	vec4 _ShadowColor;
uniform 	vec2 _IconScaling;
uniform 	vec2 _IconOffset;
uniform 	float _IconParallaxOffset;
uniform 	vec4 _FresnelColor;
uniform 	vec4 _IconColor;
uniform 	float _IconColorBrightness;
uniform 	float _EmissionAmount;
uniform 	vec2 _ReflectionTexturePanning;
uniform 	vec2 _ReflectionTextureTiling;
uniform 	float _ReflectionTextureOffset;
uniform 	vec2 _ReflectionEffectDistortionPanning;
uniform 	vec2 _ReflectionEffectDistortionTiling;
uniform 	vec2 _ReflectionEffectDistortionOffset;
uniform 	float _ReflectionEffectDistortionAmount;
uniform 	vec4 _ReflectionEffectColor;
uniform 	float _ReflectionEffectIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _EnergySphereTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionEffectDistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _ReflectionEffectTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_9;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2 = inversesqrt(u_xlat16_2);
    u_xlat16_9.xy = u_xlat1.xy * vec2(u_xlat16_2);
    u_xlat21 = u_xlat1.z * u_xlat16_2 + 0.419999987;
    u_xlat1.xy = u_xlat16_9.xy / vec2(u_xlat21);
    u_xlat15.xy = vs_TEXCOORD0.xy * _IconScaling.xy + vec2(_IconOffset.x, _IconOffset.y);
    u_xlat16_2 = _IconParallaxOffset * 0.5;
    u_xlat15.xy = (-vec2(u_xlat16_2)) * u_xlat1.xy + u_xlat15.xy;
    u_xlat16_15.xy = texture(_EnergySphereTexture, u_xlat15.xy).xw;
    u_xlat21 = (-u_xlat16_15.x) + 1.0;
    u_xlat3.xyz = u_xlat16_15.yyy * vs_COLOR0.xyz;
    u_xlat4.xyz = (-_MainColor.xyz) + _ShadowColor.xyz;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz + _MainColor.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _FresnelColor.xyz;
    u_xlat6.x = vs_TEXCOORD1.z;
    u_xlat6.y = vs_TEXCOORD2.z;
    u_xlat6.z = vs_TEXCOORD3.z;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.3499999;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat21 = max(_IconColorBrightness, 0.0);
    u_xlat21 = min(u_xlat21, 10.0);
    u_xlat4.xyz = _IconColor.xyz * vec3(u_xlat21) + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat15.xy = vs_TEXCOORD0.xy * _HighlightsScaling.xy + vec2(_HighlightsOffset.x, _HighlightsOffset.y);
    u_xlat16_2 = _HighlightsParallaxOffset * 0.5;
    u_xlat1.xy = (-vec2(u_xlat16_2)) * u_xlat1.xy + u_xlat15.xy;
    u_xlat16_21 = texture(_EnergySphereTexture, u_xlat1.xy).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_EmissionAmount, _EmissionAmount, _EmissionAmount)) + vec3(u_xlat16_21);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_ReflectionEffectDistortionTiling.x, _ReflectionEffectDistortionTiling.y) + _ReflectionEffectDistortionOffset.xy;
    u_xlat1.xy = _Time.yy * _ReflectionEffectDistortionPanning.xy + u_xlat1.xy;
    u_xlat16_1.xy = texture(_ReflectionEffectDistortionTexture, u_xlat1.xy).xy;
    u_xlat15.xy = vs_TEXCOORD0.xy * _ReflectionTextureTiling.xy + vec2(vec2(_ReflectionTextureOffset, _ReflectionTextureOffset));
    u_xlat1.xy = u_xlat16_1.xy * vec2(vec2(_ReflectionEffectDistortionAmount, _ReflectionEffectDistortionAmount)) + u_xlat15.xy;
    u_xlat1.xy = _Time.yy * vec2(_ReflectionTexturePanning.x, _ReflectionTexturePanning.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_ReflectionEffectTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectionEffectColor.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(_ReflectionEffectIntensity) + u_xlat0.xyz;
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
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	vec2 _HighlightsScaling;
uniform 	vec2 _HighlightsOffset;
uniform 	float _HighlightsParallaxOffset;
uniform 	vec4 _MainColor;
uniform 	vec4 _ShadowColor;
uniform 	vec2 _IconScaling;
uniform 	vec2 _IconOffset;
uniform 	float _IconParallaxOffset;
uniform 	vec4 _FresnelColor;
uniform 	vec4 _IconColor;
uniform 	float _IconColorBrightness;
uniform 	float _EmissionAmount;
uniform 	vec2 _ReflectionTexturePanning;
uniform 	vec2 _ReflectionTextureTiling;
uniform 	float _ReflectionTextureOffset;
uniform 	vec2 _ReflectionEffectDistortionPanning;
uniform 	vec2 _ReflectionEffectDistortionTiling;
uniform 	vec2 _ReflectionEffectDistortionOffset;
uniform 	float _ReflectionEffectDistortionAmount;
uniform 	vec4 _ReflectionEffectColor;
uniform 	float _ReflectionEffectIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _EnergySphereTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionEffectDistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _ReflectionEffectTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_9;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2 = inversesqrt(u_xlat16_2);
    u_xlat16_9.xy = u_xlat1.xy * vec2(u_xlat16_2);
    u_xlat21 = u_xlat1.z * u_xlat16_2 + 0.419999987;
    u_xlat1.xy = u_xlat16_9.xy / vec2(u_xlat21);
    u_xlat15.xy = vs_TEXCOORD0.xy * _IconScaling.xy + vec2(_IconOffset.x, _IconOffset.y);
    u_xlat16_2 = _IconParallaxOffset * 0.5;
    u_xlat15.xy = (-vec2(u_xlat16_2)) * u_xlat1.xy + u_xlat15.xy;
    u_xlat16_15.xy = texture(_EnergySphereTexture, u_xlat15.xy).xw;
    u_xlat21 = (-u_xlat16_15.x) + 1.0;
    u_xlat3.xyz = u_xlat16_15.yyy * vs_COLOR0.xyz;
    u_xlat4.xyz = (-_MainColor.xyz) + _ShadowColor.xyz;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz + _MainColor.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _FresnelColor.xyz;
    u_xlat6.x = vs_TEXCOORD1.z;
    u_xlat6.y = vs_TEXCOORD2.z;
    u_xlat6.z = vs_TEXCOORD3.z;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.3499999;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat21 = max(_IconColorBrightness, 0.0);
    u_xlat21 = min(u_xlat21, 10.0);
    u_xlat4.xyz = _IconColor.xyz * vec3(u_xlat21) + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat15.xy = vs_TEXCOORD0.xy * _HighlightsScaling.xy + vec2(_HighlightsOffset.x, _HighlightsOffset.y);
    u_xlat16_2 = _HighlightsParallaxOffset * 0.5;
    u_xlat1.xy = (-vec2(u_xlat16_2)) * u_xlat1.xy + u_xlat15.xy;
    u_xlat16_21 = texture(_EnergySphereTexture, u_xlat1.xy).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_EmissionAmount, _EmissionAmount, _EmissionAmount)) + vec3(u_xlat16_21);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_ReflectionEffectDistortionTiling.x, _ReflectionEffectDistortionTiling.y) + _ReflectionEffectDistortionOffset.xy;
    u_xlat1.xy = _Time.yy * _ReflectionEffectDistortionPanning.xy + u_xlat1.xy;
    u_xlat16_1.xy = texture(_ReflectionEffectDistortionTexture, u_xlat1.xy).xy;
    u_xlat15.xy = vs_TEXCOORD0.xy * _ReflectionTextureTiling.xy + vec2(vec2(_ReflectionTextureOffset, _ReflectionTextureOffset));
    u_xlat1.xy = u_xlat16_1.xy * vec2(vec2(_ReflectionEffectDistortionAmount, _ReflectionEffectDistortionAmount)) + u_xlat15.xy;
    u_xlat1.xy = _Time.yy * vec2(_ReflectionTexturePanning.x, _ReflectionTexturePanning.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_ReflectionEffectTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectionEffectColor.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(_ReflectionEffectIntensity) + u_xlat0.xyz;
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