// (C) 2022 madoodia.com\nAll Rights Reserved.

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

	UPROPERTY(EditDefaultO)

	virtual void BeginPlay() override;

public:
	void ActorAboveMe(){BeginPlay()};
};
