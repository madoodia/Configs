// (C) 2022 madoodia.com\nAll Rights Reserved.
/*===========================================================================
	Generated code exported from UnrealHeaderTool.
	DO NOT modify this manually! Edit the corresponding .h files instead!
===========================================================================*/

#include "UObject/GeneratedCppIncludes.h"
PRAGMA_DISABLE_DEPRECATION_WARNINGS
void EmptyLinkFunctionForGeneratedCodeBlank_init() {}
	static FPackageRegistrationInfo Z_Registration_Info_UPackage__Script_Blank;
	FORCENOINLINE UPackage* Z_Construct_UPackage__Script_Blank()
	{
		if (!Z_Registration_Info_UPackage__Script_Blank.OuterSingleton)
		{
			static const UECodeGen_Private::FPackageParams PackageParams = {
				"/Script/Blank",
				nullptr,
				0,
				PKG_CompiledIn | 0x00000000,
				0x0DA1E36F,
				0x5C2C40D9,
				METADATA_PARAMS(nullptr, 0)
			};
			UECodeGen_Private::ConstructUPackage(Z_Registration_Info_UPackage__Script_Blank.OuterSingleton, PackageParams);
		}
		return Z_Registration_Info_UPackage__Script_Blank.OuterSingleton;
	}
	static FRegisterCompiledInInfo Z_CompiledInDeferPackage_UPackage__Script_Blank(Z_Construct_UPackage__Script_Blank, TEXT("/Script/Blank"), Z_Registration_Info_UPackage__Script_Blank, CONSTRUCT_RELOAD_VERSION_INFO(FPackageReloadVersionInfo, 0x0DA1E36F, 0x5C2C40D9));
PRAGMA_ENABLE_DEPRECATION_WARNINGS
