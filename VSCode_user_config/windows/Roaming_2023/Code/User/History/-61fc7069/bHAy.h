// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "CoreMinimal.h"

USTRUCT(BlueprintType)
struct FMyStruct
{
    GENERATED_BODY()

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "MyStruct")
    FString MyString;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "MyStruct")
    int32 MyInt;
};

/*
 *
 */
USTRUCT(BlueprintType)
struct FNewStruct
{
    GENERATED_BODY()

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "NewStruct")
    FString MyString;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "NewStruct")
    int32 MyInt;

    TArray<FMyStruct> MyStructs;
    TMap<FString, FMyStruct> MyStructMap;
    TSet<FMyStruct> MyStructSet;
};

UCLASS(Blueprintable)
class UE5_UI_DEMO_API UMyClass : public UObject
{
    GENERATED_BODY()

public:
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "MyClass")
    FMyStruct MyStruct;

    UFUNCTION(BlueprintCallable, BlueprintPure, Category = "MyClass")
    int MyInt();

    UFUNCTION(BlueprintCallable, Category = "MyClass")
    void SetMyInt(int NewValue);

    UFUNCTION(BlueprintCallable, Category = "MyClass")

private:
    int MyInt;
};