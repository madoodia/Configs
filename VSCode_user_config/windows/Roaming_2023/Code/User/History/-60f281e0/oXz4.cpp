// (C) 2022 madoodia.com\nAll Rights Reserved.
/*===========================================================================
	Generated code exported from UnrealHeaderTool.
	DO NOT modify this manually! Edit the corresponding .h files instead!
===========================================================================*/

#include "UObject/GeneratedCppIncludes.h"
#include "Blank/Public/FirstActor.h"
PRAGMA_DISABLE_DEPRECATION_WARNINGS
void EmptyLinkFunctionForGeneratedCodeFirstActor() {}
// Cross Module References
	BLANK_API UClass* Z_Construct_UClass_AFirstActor();
	BLANK_API UClass* Z_Construct_UClass_AFirstActor_NoRegister();
	ENGINE_API UClass* Z_Construct_UClass_AActor();
	UPackage* Z_Construct_UPackage__Script_Blank();
// End Cross Module References
	void AFirstActor::StaticRegisterNativesAFirstActor()
	{
	}
	IMPLEMENT_CLASS_NO_AUTO_REGISTRATION(AFirstActor);
	UClass* Z_Construct_UClass_AFirstActor_NoRegister()
	{
		return AFirstActor::StaticClass();
	}
	struct Z_Construct_UClass_AFirstActor_Statics
	{
		static UObject* (*const DependentSingletons[])();
#if WITH_METADATA
		static const UECodeGen_Private::FMetaDataPairParam Class_MetaDataParams[];
#endif
		static const FCppClassTypeInfoStatic StaticCppClassTypeInfo;
		static const UECodeGen_Private::FClassParams ClassParams;
	};
	UObject* (*const Z_Construct_UClass_AFirstActor_Statics::DependentSingletons[])() = {
		(UObject* (*)())Z_Construct_UClass_AActor,
		(UObject* (*)())Z_Construct_UPackage__Script_Blank,
	};
#if WITH_METADATA
	const UECodeGen_Private::FMetaDataPairParam Z_Construct_UClass_AFirstActor_Statics::Class_MetaDataParams[] = {
		{ "IncludePath", "FirstActor.h" },
		{ "ModuleRelativePath", "Public/FirstActor.h" },
	};
#endif
	const FCppClassTypeInfoStatic Z_Construct_UClass_AFirstActor_Statics::StaticCppClassTypeInfo = {
		TCppClassTypeTraits<AFirstActor>::IsAbstract,
	};
	const UECodeGen_Private::FClassParams Z_Construct_UClass_AFirstActor_Statics::ClassParams = {
		&AFirstActor::StaticClass,
		"Engine",
		&StaticCppClassTypeInfo,
		DependentSingletons,
		nullptr,
		nullptr,
		nullptr,
		UE_ARRAY_COUNT(DependentSingletons),
		0,
		0,
		0,
		0x009000A4u,
		METADATA_PARAMS(Z_Construct_UClass_AFirstActor_Statics::Class_MetaDataParams, UE_ARRAY_COUNT(Z_Construct_UClass_AFirstActor_Statics::Class_MetaDataParams))
	};
	UClass* Z_Construct_UClass_AFirstActor()
	{
		if (!Z_Registration_Info_UClass_AFirstActor.OuterSingleton)
		{
			UECodeGen_Private::ConstructUClass(Z_Registration_Info_UClass_AFirstActor.OuterSingleton, Z_Construct_UClass_AFirstActor_Statics::ClassParams);
		}
		return Z_Registration_Info_UClass_AFirstActor.OuterSingleton;
	}
	template<> BLANK_API UClass* StaticClass<AFirstActor>()
	{
		return AFirstActor::StaticClass();
	}
	DEFINE_VTABLE_PTR_HELPER_CTOR(AFirstActor);
	AFirstActor::~AFirstActor() {}
	struct Z_CompiledInDeferFile_FID_UE5_Plugins_Plugins_Blank_Source_Blank_Public_FirstActor_h_Statics
	{
		static const FClassRegisterCompiledInInfo ClassInfo[];
	};
	const FClassRegisterCompiledInInfo Z_CompiledInDeferFile_FID_UE5_Plugins_Plugins_Blank_Source_Blank_Public_FirstActor_h_Statics::ClassInfo[] = {
		{ Z_Construct_UClass_AFirstActor, AFirstActor::StaticClass, TEXT("AFirstActor"), &Z_Registration_Info_UClass_AFirstActor, CONSTRUCT_RELOAD_VERSION_INFO(FClassReloadVersionInfo, sizeof(AFirstActor), 2323482107U) },
	};
	static FRegisterCompiledInInfo Z_CompiledInDeferFile_FID_UE5_Plugins_Plugins_Blank_Source_Blank_Public_FirstActor_h_2921047715(TEXT("/Script/Blank"),
		Z_CompiledInDeferFile_FID_UE5_Plugins_Plugins_Blank_Source_Blank_Public_FirstActor_h_Statics::ClassInfo, UE_ARRAY_COUNT(Z_CompiledInDeferFile_FID_UE5_Plugins_Plugins_Blank_Source_Blank_Public_FirstActor_h_Statics::ClassInfo),
		nullptr, 0,
		nullptr, 0);
PRAGMA_ENABLE_DEPRECATION_WARNINGS
