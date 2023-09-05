// (C) 2022 madoodia.com\nAll Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "FirstActor.generated.h"

UCLASS()
class BLANK_API AFirstActor : public AActor
{
	GENERATED_BODY()

public:
	// Sets default values for this actor's properties
	AFirstActor();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;
};
