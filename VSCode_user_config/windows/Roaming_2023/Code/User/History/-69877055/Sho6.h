// (C) 2022 madoodia.com
// All Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "FirstActorComponent.generated.h"

UCLASS(ClassGroup = (Custom), meta = (BlueprintSpawnableComponent))
class BLANK_API UFirstActorComponent : public UActorComponent
{
	GENERATED_BODY()

public:
	UFirstActorComponent();

protected:
	UPROPERTY(EditDefaultsOnly)
	TSubclassOf<AActor> ActorClassToSpawn;

	virtual void BeginPlay() override;

public:
	UFUNCTION(BlueprintCallable)
	void ActorAboveMe();
};
