// Copyright Epic Games, Inc. All Rights Reserved.

#include "UE5_UI_Demo.h"
#include "Modules/ModuleManager.h"

IMPLEMENT_PRIMARY_GAME_MODULE(FDefaultGameModuleImpl, UE5_UI_Demo, "UE5_UI_Demo");

int UMyClass::MyInt()
{
    return 0;
}

void UMyClass::SetMyInt(int NewValue)
{
    MyInt = NewValue;
}

void UMyClass::TestFunction(FMyStruct &MyStruct)
{
}

void UMyClass::RemovePickup()
{
    auto Temp = UGameplayStatics::GetPlayerCameraManager(this, 0);
    Temp->GetForwardVector();
    Temp->GetCameraLocation();
}
